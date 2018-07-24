<%@ Page Title="" Language="C#" MasterPageFile="~/User/M2.master" AutoEventWireup="true" CodeFile="returned_book.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="form-container" style="width="50%">
        <form id="Form1" runat="server">
            <br />
        <asp:Panel ID="Panel1" runat="server">
        <div class="table-responsive">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <HeaderTemplate>
                        <table class="table table-striped jambo_table bulk_action dataTable">
                            <thead>
                                <tr>
                                    <th>
                                        USN Number
                                    </th>
                                    <th>
                                        Book Name
                                    </th>
                                    <th>
                                        Issue Date
                                    </th>
                                    <th>
                                        Return Date
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("usn_no") %>
                            </td>
                            <td>
                                <%#Eval("book_name") %>
                            </td>
                            <td>
                                <%#Eval("issue_date") %>
                            </td>
                            <td>
                                <%#Eval("return_date") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody> </table>
                    </FooterTemplate>
                </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT i.usn_no,b.book_name, i.issue_date, i.return_date FROM return_mster AS i INNER JOIN book_mster AS b ON i.book_id = b.book_id WHERE (i.usn_no = @usn_no)">
                <SelectParameters>
                    <asp:SessionParameter Name="usn_no" SessionField="usn_no" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </asp:Panel>
        </form>
</div>
</asp:Content>
<%--<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered dt-responsive nowrap" EmptyDataText="YOu Dont" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="usn_no" HeaderText="Enrollment Number" 
                        SortExpression="usn_no" />
                   <asp:BoundField DataField="book_name" HeaderText="Book Name" 
                        SortExpression="book_name" />
                    <asp:BoundField DataField="issue_date" HeaderText="Issue Date" 
                        SortExpression="issue_date" />
                    <asp:BoundField DataField="return_date" HeaderText="Return Date" 
                        SortExpression="return_date" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT i.usn_no,b.book_name, i.issue_date, i.return_date FROM return_mster AS i INNER JOIN book_mster AS b ON i.book_id = b.book_id WHERE (i.usn_no = @usn_no)">
                <SelectParameters>
                    <asp:SessionParameter Name="usn_no" SessionField="usn_no" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
