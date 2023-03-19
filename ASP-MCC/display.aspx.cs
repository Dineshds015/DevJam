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