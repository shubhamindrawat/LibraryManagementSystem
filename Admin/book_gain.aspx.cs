using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_Default : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    SqlDataReader dr;
    DataSet dst = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (txt_enroll.Text != "")
            {
                fillbook();
            }
        }
    }
    protected void btn_submit1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "0")
        {
            Label2.Text = "You Must Select Book..";
        }
        else
        {
            Label3.Text = "Lost Book Gain & Money is Refunded";
            Panel1.Visible = false;
        }
        x.conopen();
        qry = "UPDATE  book_mster SET qty = qty + 1,total_amt=qty*price WHERE book_id ='" + DropDownList1.SelectedValue + "'";
        x.iud(qry);
        x.conclose();
        x.conopen();
        qry = "delete  from book_lost where usn_no ='" + txt_enroll.Text + "' and book_id='" + DropDownList1.SelectedValue + "'";
        x.iud(qry);
        x.conclose();
    }
    void fillbook()
    {
        x.conopen();
        qry = "select l.lost_id,s.first_name,b.book_name,b.book_id from book_lost l,student_mster s,book_mster b where l.usn_no=s.usn_no and l.book_id=b.book_id and l.usn_no='"+txt_enroll.Text + "'"; 
        dst = x.fills(qry);
        if (dst.Tables[0].Rows.Count > 0)
        {
            lbl_sname.Text = dst.Tables[0].Rows[0][1].ToString();
            DropDownList1.DataSource = dst.Tables[0];
            DropDownList1.DataTextField = "book_name";
            DropDownList1.DataValueField = "book_id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("--Select Book--", "0"));
        }
        else
        {
            Panel1.Visible = false;
            Label1.Text = " You Don't Have Any Lost Book";
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        x.conopen();
        qry = "select price from book_lost where book_id='" + DropDownList1.SelectedValue + "'";
        dr = x.search(qry);
        if (dr.HasRows)
        {
            dr.Read();
            lblbamount.Text = dr["price"].ToString();
        }
        x.conclose();
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        clearL();
        Panel1.Visible = true;
        fillbook();
    }
    void clearL()
    {
        foreach (var x in Form1.Controls)
        {
            if (x is Label)
            {
                ((Label)x).Text = "";
            }
        }
    }
    void clearT()
    {
        foreach (var x in Form1.Controls)
        {
            if (x is TextBox)
            {
                ((TextBox)x).Text = "";
            }
        }

    }
}