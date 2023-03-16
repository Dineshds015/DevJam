using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["a"] = null;
        if (!IsPostBack)
        {
            if (Request.Cookies["username"] != null)
            {
                txt_reg.Text = Request.Cookies["username"].Value;
            }
            if (Request.Cookies["password"] != null)
            {
                txt_pass.Attributes.Add("value", Request.Cookies["password"].Value);
            }
            if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
            {
                rememberme.Checked = true;
            }
        }
    }
    string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

    protected void btn_home_Click(object sender, EventArgs e)
    {
        if (Session["a"] != null)
        {
            //Response.Redirect("alhomepage.aspx");
            Response.Write("<script>alert('logined');</script>");
        }
        else
        {
            Response.Write("<script>alert('Not logined');</script>");
            //Response.Redirect("homepage.aspx");
        }
    }
    protected void btn_about_Click(object sender, EventArgs e)
    {
        Response.Redirect("about_us.aspx");
    }
    protected void btn_fb_onClick(object sender, EventArgs e)
    {
        Response.Write("hello");
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        using (MySqlConnection con = new MySqlConnection(constring))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM tbl_register WHERE stud_id='" + txt_reg.Text + "' AND s_password='" + txt_pass.Text + "'", con);
            int i = Convert.ToInt16(cmd.ExecuteScalar());
            if (i == 0)
            {
                Response.Write("<script>alert('Not valid user');</script>");
            }
            else
            {
                Session["a"] = txt_reg.Text;
                if (Session["a"] != null)
                {
                    if (rememberme.Checked == true)
                    {
                        Response.Cookies["username"].Value = txt_reg.Text;
                        Response.Cookies["password"].Value = txt_pass.Text;
                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
                    }
                    else
                    {
                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
                    }
                    //Response.Write("register_user.aspx");
                    Response.Write("<script>alert('Validity checked');</script>");
                }
                else
                {
                    Response.Redirect("homepage.aspx");
                }
            }
            con.Close();
        }
    }
    protected void link_signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("register_user.aspx");
    }

}