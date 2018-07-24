<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true" CodeFile="lost_report.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
        <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Issue Report</h2> 
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <div class="table-responsive">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                        <HeaderTemplate>
                            <table class="table table-striped jambo_table bulk_action dataTable">
                                <thead>
                                    <tr>
                                        <th>
                                            Lost ID
                                        </th>
                                        <th>
                                            USN Number
                                        </th>
                                        <th>
                                            Book Name
                                        </th>
                                        <th>
                                            Price
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%#Eval("Lost_id") %>
                                </td>
                                <td>
                                    <%#Eval("usn_no") %>
                                </td>
                                <td>
                                    <%#Eval("book_name") %>
                                </td>
                                <td>
                                    <%#Eval("price") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> </table>
                        </FooterTemplate>
                    </asp:Repeater>
					  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          SelectCommand="SELECT  a.lost_id,a.usn_no,b.book_name,a.price FROM book_lost as a inner join book_mster as b on a.book_id=b.book_id order by a.lost_id "></asp:SqlDataSource>
					</div> 
                  </div>
                </div>
        </div>
    </form>

</asp:Content>

