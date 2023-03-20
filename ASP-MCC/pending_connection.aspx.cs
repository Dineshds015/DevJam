using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class pending_connection : System.Web.UI.Page
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
        using (MySqlConnection con = new MySqlConnection(constring))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT  * FROM tbl_register E JOIN tbl_connection D USING (s_id)  where con_reg='" + Session["a"].ToString() + "' AND c_status='Pending'", con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dlc.DataSource = dt;
            dlc.DataBind();
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
        if (e.CommandName == "reject")
        {
            string update_rej = "UPDATE tbl_connection SET c_status='Rejected' WHERE con_reg='" + Session["a"].ToString() + "'";
            MySqlCommand cmd1 = new MySqlCommand(update_rej, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            dlc.EditItemIndex = -1;
            commentct();
            Response.Write("<script>alert('Connection Rejected!')</script>");
        }
        if (e.CommandName == "approve")
        {
            //string cn_id = ((Label)e.Item.FindControl("lbl_cust_id")).Text;
            string update_app = "UPDATE tbl_connection SET c_status='Approved' WHERE con_reg='" + Session["a"].ToString() + "'";
            MySqlCommand cmd1 = new MySqlCommand(update_app, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            dlc.EditItemIndex = -1;
            commentct();
            Response.Write("<script>alert('Connection Accepted !')</script>");
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