﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public partial class User_ureg : System.Web.UI.Page
{
    private static Random random = new Random();
    myclass x = new myclass();
    string qry, str, fname;
    SqlDataReader dr;
    DataTable dt = new DataTable();
    String[] chk = { ".jpg", ".jpeg", ".png" };
    string pass = RandomString(8);
    private string yash5511;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.Items.Insert(0, new ListItem("--Select Sem--", "0"));
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {

        string Gender = "M";
        if (r2.Checked)
            Gender = "F";
        x.conopen();
        qry = "select * from student_mster where email_id='" + txtemail.Text + "'";
        dt = x.ser(qry);
        if (ImgSrc.HasFile)
        {
            str = System.IO.Path.GetExtension(ImgSrc.PostedFile.FileName);
            ImgSrc.PostedFile.SaveAs(Server.MapPath("~/User/images/profile/ " + txtusn_no.Text + str));
            fname = txtusn_no.Text + str;
        }
        else 
        { 
        
        }
        if (dt.Rows.Count == 0)
        {
            x.conclose();
            if (MyCaptcha1.IsValid)
            {
                string pass = RandomString(8);
                if (ImgSrc.HasFile)
                {
                    str = System.IO.Path.GetExtension(ImgSrc.PostedFile.FileName);
                    if (chk.Contains(str.ToLower()))
                    {
                        string body = this.PopulateBody(txtemail.Text, txtfname.Text, System.DateTime.Now.ToString(), pass);
                        ImgSrc.PostedFile.SaveAs(Server.MapPath("~/User/images/profile/" + txtusn_no.Text + str));
                        MailMessage Msg = new MailMessage();
                        Msg.From = new MailAddress(txtemail.Text);
                        Msg.To.Add(txtemail.Text);
                        Msg.Subject = "Please Change your Password After Login";
                        Msg.Body = body;
                        Msg.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.Credentials = new System.Net.NetworkCredential("ysv.libmng@gmail.com", "admin@5511");
                        smtp.EnableSsl = true;
                        smtp.Send(Msg);
                        Msg = null;
                        string Password = "yash5511";
                        string Msg1 = "Register_Successed...";
                        string OPTINS = "SMTLIB";
                        string MobileNumber = txtmob_no.Text;
                        string type = "3";
                        string strUrl = "http://bulksmsgateway.in/sendmessage.php?user=yashjari&password=" + Password + "&message=" + Msg1 + "&sender=" + OPTINS + "&mobile=" + MobileNumber + "&type=" + type;
                        System.Net.WebRequest request = System.Net.WebRequest.Create(strUrl);
                        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                        Stream s = (Stream)response.GetResponseStream();
                        StreamReader readStream = new StreamReader(s);
                        string dataString = readStream.ReadToEnd();
                        response.Close();
                        s.Close();
                        readStream.Close();

                        lbl_error.Text = "Your Password Details Sent to your mail";
                        Response.AddHeader("Refresh", "5;url=Login.aspx");
                        
                        x.conopen();
                        qry = "insert into student_mster values ('" + txtusn_no.Text + "','" + txtfname.Text + "','" + txtaddress.Text + "','" + txtmob_no.Text + "','" + txtemail.Text + "','" + Gender + "','" + txtdob.Text + "','" + DropDownList1.SelectedValue + "','" + pass.ToString() + "','" + fname + "')";
                        x.iud(qry);
                        x.conclose();
                    }
                    else
                    {
                        lbl_error.Text = "Please Select Image File Only";
                    }
                }

                else
                {
                    lbl_error.Text = "Please Select the File";
                }
            }
            else
            {
                lbl_error.Text = "Captcha is Wrong";
            }
           
        }
        else
        {
            // x.conclose();
            lbl_error.Text = "You Are Already Registered. Now you will be redirect to login page";
            Response.AddHeader("Refresh", "5;url=Login.aspx");
        }
       
    }
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789abcdefghijklmnopqrstuvwxyz";
        return new string(Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
    }
    private string PopulateBody(string EmailID, string UserName, string SystemDateTime, string Code)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/Admin/Mail.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{EmailID}", EmailID);
        body = body.Replace("{UserName}", UserName);
        body = body.Replace("{SystemDateTime}", SystemDateTime);
        body = body.Replace("{Code}", Code);
        return body;
    }
}






//if (ImgSrc.HasFile)
//{
//    str = System.IO.Path.GetExtension(ImgSrc.PostedFile.FileName);
//    ImgSrc.PostedFile.SaveAs(Server.MapPath("~/User/images/profile/ " + txtusn_no.Text + str));
//    fname = txtusn_no.Text + str;
//}
//x.conopen();
//qry = "insert into student_mster values ('E" + txtusn_no.Text + "','" + txtfname.Text + "','" + txtaddress.Text + "','" + txtmob_no.Text + "','" + txtemail.Text + "','" + Gender + "','" + txtdob.Text + "','" + DropDownList1.SelectedValue + "','" + pass.ToString() + "','" + fname + "')";
//x.iud(qry);
//x.conclose();
