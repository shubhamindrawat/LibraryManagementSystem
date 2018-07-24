using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class User_Default : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        x.conopen ();
        qry = "select image,usn_no,first_name,mob_no,email_id,dob,sem from student_mster where email_id='" + Session["email_id"] +"'";
        dr = x.search(qry);
        if (dr.HasRows)
        {
            dr.Read();
            Image1.ImageUrl  = "images/profile/"+dr[0].ToString();
            lblusn_no .Text = dr[1].ToString();
            lblname.Text = dr[2].ToString();
            lblmob_no.Text = dr[3].ToString();
            lblemail.Text = dr[4].ToString();
            lbldob.Text = dr[5].ToString();
            lblsem.Text = dr[6].ToString();
        }
        else
        {
            Response.Redirect("User/login.aspx");
        }
        x.conclose();
    }
}