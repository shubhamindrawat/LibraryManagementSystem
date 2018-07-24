using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default2 : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        x.conopen();
        qry = "select count(*) from pub_mster";
        lbl_pub.Text = x.sca(qry);

        qry = "select count(*) from author_mster";
        lbl_authors.Text = x.sca(qry);

        qry = "select sum(qty) from book_mster";
        lbl_books.Text = x.sca(qry);

        qry = "select count(*) from student_mster";
        lbl_students.Text = x.sca(qry);
        x.conclose();
    }

}