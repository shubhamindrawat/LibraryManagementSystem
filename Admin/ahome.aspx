<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true" CodeFile="ahome.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <div style="width:40%; display:inline-block; background:#FFF; margin:10px; box-shadow: 10px 5px 5px #BAB8B8; border-radius: 20px;">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/icons/publishers.png" Style="max-height: 100px; max-width:100px; float: left; margin:10px;" />
                <asp:Label ID="Label1" runat="server" Text="Publishers" Font-Size="35" style="margin:10px;" ForeColor="#BAB8B8" />
                <div class="count"><asp:Label ID="lbl_pub" runat="server" Font-Size="38px" style="font-weight:700; margin:10px;" Text="179" /></div>
            </div>
            <div style="width:40%; display:inline-block; background:#FFF; margin:10px; box-shadow: 10px 5px 5px #BAB8B8; border-radius: 20px;">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Admin/icons/authors.png" Style="max-height: 100px; max-width:100px; float: left; margin:10px;" />
                <asp:Label ID="Label3" runat="server" Text="Authors" Font-Size="35" style="margin:10px;" ForeColor="#BAB8B8" />
                <div class="count"><asp:Label ID="lbl_authors" runat="server" Font-Size="38px" style="font-weight:700; margin:10px;" Text="179" /></div>
            </div>
            <div style="width:40%; display:inline-block; background:#FFF; margin:10px; box-shadow: 10px 5px 5px #BAB8B8; border-radius: 20px;">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Admin/icons/books.png" Style="max-height: 100px; max-width:100px; float: left; margin:10px;" />
                <asp:Label ID="Label5" runat="server" Text="Books" Font-Size="35" style="margin:10px;" ForeColor="#BAB8B8" />
                <div class="count"><asp:Label ID="lbl_books" runat="server" Font-Size="38px" style="font-weight:700; margin:10px;" Text="179" /></div>
            </div>
            <div style="width:40%; display:inline-block; background:#FFF; margin:10px; box-shadow: 10px 5px 5px #BAB8B8; border-radius: 20px;">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Admin/icons/students.png" Style="max-height: 100px; max-width:100px; float: left; margin-top: 25px; margin-left: 10px; margin-right: 11px" />
                <asp:Label ID="Label7" runat="server" Text="Students" Font-Size="35" style="margin:10px;" ForeColor="#BAB8B8" />
                <div class="count"><asp:Label ID="lbl_students" runat="server" Font-Size="38px" style="font-weight:700; margin:10px;" Text="179" /></div>
            </div>
</asp:Content>

