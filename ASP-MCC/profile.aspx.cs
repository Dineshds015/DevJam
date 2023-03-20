using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class profile : System.Web.UI.Page
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

                MySqlConnection con2 = new MySqlConnection(constring);
                MySqlCommand cmd2 = new MySqlCommand("SELECT * FROM tbl_city", con2);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd2);
                DataSet ds = new DataSet();
                da.Fill(ds);
                ddl_city.DataSource = ds;
                ddl_city.DataTextField = "city";
                ddl_city.DataValueField = "c_id";
                ddl_city.DataBind();
                using (MySqlDataReader msr = cmd.ExecuteReader())
                {
                    msr.Read();
                    img_c_image.ImageUrl = msr["s_image"].ToString();
                    img_s_image.ImageUrl = msr["s_image"].ToString();
                    txt_email.Text = msr["s_email"].ToString();
                    txt_linkedin.Text = msr["s_linkedin"].ToString();
                    txt_uname.Text = msr["s_name"].ToString();
                    txt_reg.Text = msr["stud_id"].ToString();
                    txt_course.Text = msr["s_course"].ToString();
                    ddl_city.SelectedValue = msr["s_city"].ToString();
                }
                con2.Close();
            }
        }
    }
    string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

    MySqlCommand cmd;
    MySqlDataAdapter da;
    DataSet ds;
    protected void btn_update_Click(object sender, EventArgs e)
    {
        using (MySqlConnection con = new MySqlConnection(constring))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.CommandText = "UPDATE tbl_register SET s_name='" + txt_uname.Text + "',s_email='" + txt_email.Text + "',s_linkedin='" + txt_linkedin.Text + "', s_city='" + ddl_city.SelectedItem + "' where stud_id='" + Session["a"] + "'";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Redirect("dashboard.aspx");
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
    protected void btn_img_setting_Click(object sender, EventArgs e)
    {
        Response.Redirect("profile.aspx");
    }
    protected void btn_delete_Click(object sender, EventArgs e)
    {
        using (MySqlConnection con = new MySqlConnection(constring))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.CommandText = "delete from tbl_register where stud_id='" + Session["a"] + "'";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Redirect("homepage.aspx");
            con.Close();
        }
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