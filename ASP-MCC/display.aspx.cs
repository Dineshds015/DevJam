using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class display : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["a"] == null)
        {
            Response.Redirect("homepage.aspx");

        }
        if (!this.IsPostBack)
        {
            commentct();
            using (MySqlConnection con = new MySqlConnection(constring))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandText = "select * from tbl_register where stud_id='" + Session["a"] + "'";
                cmd.Connection = con;

                using (MySqlDataReader msr = cmd.ExecuteReader())
                {
                    msr.Read();
                    img_c_image.ImageUrl = msr["s_image"].ToString();
                }
                con.Close();
            }
        }
    }
    string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    private void commentct()
    {
        if(Request.QueryString["s_course"]==null && Request.QueryString["s_city"] == null && Request.QueryString["s_batch"] == null)
        {
            using (MySqlConnection con = new MySqlConnection(constring))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("select * from tbl_register", con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dlc.DataSource = dt;
                dlc.DataBind();
                con.Close();
            }
        }
        else
        {
            using (MySqlConnection con = new MySqlConnection(constring))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("select * from tbl_register where s_course LIKE %'" + Request.QueryString["course"] + "' AND s_city LIKE %'" + Request.QueryString["city"] + "' AND s_batch LIKE %'" + Request.QueryString["batch"] + "' AND stud_id!='" + Session["a"] + "'", con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dlc.DataSource = dt;
                dlc.DataBind();
                con.Close();
            }
        }
        using (MySqlConnection con = new MySqlConnection(constring))
        {
            con.Open();
            MySqlCommand cmd2 = new MySqlCommand("select s_id from tbl_register where stud_id='" + Session["a"] + "'", con);
            cmd2.Parameters.AddWithValue("@s_id", lbl_sid);
            DataTable dt = new DataTable();
            dt.Load(cmd2.ExecuteReader());
            MySqlDataReader dr = cmd2.ExecuteReader();
            if (dr.Read())
            {
                lbl_sid.Text = dr["s_id"].ToString();
            }

            con.Close();
        }
    }

    protected void btn_home_Click(object sender, EventArgs e)
    {
        if (Session["a"] != null)
        {
            Response.Redirect("dashboard.aspx");
        }
        else
        {
            Response.Redirect("homepage.aspx");
        }
    }
    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Session["a"] = null;
        Response.Redirect("homepage.aspx");
    }
    protected void dlc_ItemCommand(object source, DataListCommandEventArgs e)
    {
        MySqlConnection con = new MySqlConnection(constring);
        if (e.CommandName == "connection")
        {
            string cnn_id = ((Label)e.Item.FindControl("lbl_s_id")).Text;
            string studid = ((Label)e.Item.FindControl("lbl_stud_id")).Text;
            string insert_con = "INSERT INTO tbl_connection (con_reg,s_id,c_status,con_id,conn_reg) VALUES ('" + studid.ToString() + "'," + lbl_sid.Text + ",'Pending'," + cnn_id + ",'" + Session["a"].ToString() + "')";
            MySqlCommand cmd1 = new MySqlCommand(insert_con, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            dlc.EditItemIndex = -1;
            commentct();
            Response.Write("<script>alert('Connection requested !')</script>");
        }
    }
    protected void btn_img_setting_Click(object sender, EventArgs e)
    {
        Response.Redirect("profile.aspx");
    }
    protected void btn_fb_onClick(object sender, EventArgs e)
    {
        Response.Redirect("https://www.facebook.com/MNNITALLD");
    }
    protected void btn_tt_onClick(object sender, EventArgs e)
    {
        Response.Redirect("https://twitter.com/MNNITALLD");
    }
    protected void btn_ig_onClick(object sender, EventArgs e)
    {
        Response.Redirect("https://www.instagram.com/mnnitalld/");
    }
    protected void btn_em_onClick(object sender, EventArgs e)
    {
        Response.Redirect("https://nodalc@mnnit.ac.in");
    }
    protected void btn_fd_onClick(object sender, EventArgs e)
    {
        Response.Redirect("https://www.linkedin.com/school/motilal-nehru-national-institute-of-technology/");
    }
}