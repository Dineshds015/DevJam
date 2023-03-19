using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["a"] == null)
        {
            Response.Redirect("homepage.aspx");

        }
        if (!this.IsPostBack)
        {
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
            MySqlConnection con2 = new MySqlConnection(constring);
            con2.Open();
            MySqlCommand cmd2 = new MySqlCommand("SELECT * FROM tbl_city", con2);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd2);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddl_city.DataSource = ds;
            ddl_city.DataTextField = "city";
            ddl_city.DataValueField = "c_id";
            ddl_city.DataBind();
            con2.Close();
        }
    }
    string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    protected void btn_discoverall_Click(object sender, EventArgs e)
    {
        Response.Redirect("display.aspx");
    }
    protected void btn_fdiscover_Click(object sender, EventArgs e)
    {
        Response.Redirect("display.aspx?city=" + ddl_city.SelectedItem.ToString() + "&course=" + ddl_course.SelectedItem.ToString() + "&batch=" + ddl_batch.SelectedItem.ToString());
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