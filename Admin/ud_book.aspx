<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true" CodeFile="ud_book.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Book Report</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="table-responsive">

                        <asp:GridView ID="GridView1" runat="server" EmptyDataText="There are no data records to display."
                            class="table table-striped table-bordered dt-responsive nowrap"
                            AutoGenerateColumns="False" OnRowCancelingEdit="gridview_RowCancelingEdit"
                            OnRowDeleting="gridview_RowDeleting" OnRowEditing="gridview_RowEditing"
                            OnRowUpdating="gridview_RowUpdating" DataKeyNames="book_id">
                            <Columns>
                                <asp:TemplateField HeaderText="Book ID" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbook_id" runat="server" Text='<%# Eval("book_id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Book Name" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbook_name" runat="server" Text='<%# Eval("book_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtbname" runat="server" Width="75px" Text='<%# Eval("book_name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Publication Name" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpub_name" runat="server" Text='<%# Eval("pub_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtpub" runat="server" Width="75px" Text='<%# Eval("pub_name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edition">
                                    <ItemTemplate>
                                        <asp:Label ID="lbledition" runat="server" Text='<%# Eval("edition") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtedition" runat="server" Width="75px" Text='<%# Eval("edition") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="20%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Author Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblauthor_name" runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtauthor" runat="server" Width="75px" Text='<%# Eval("author_name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Semester">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsem" runat="server" Text='<%# Eval("sem") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtsem" runat="server" Width="75px" Text='<%# Eval("sem") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsub" runat="server" Text='<%# Eval("sub_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtsub" runat="server" Width="75px" Text='<%# Eval("sub_name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:Label ID="lblqty" runat="server" Text='<%# Eval("qty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtqty" runat="server" Width="75px" Text='<%# Eval("qty") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price">
                                    <ItemTemplate>
                                        <asp:Label ID="lblprice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtprice" runat="server" Width="75px" Text='<%# Eval("price") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotal_amt" runat="server" Text='<%# Eval("Total1") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Update">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Btn_Edit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="Btn_Update" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                                        <asp:LinkButton ID="Btn_Cancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Btn_Delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"
                                            OnClientClick="return  confirm ( ' Are you sure you want to delete this record ? ' );"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                            </Columns>
                            <%-- <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />--%>
                        </asp:GridView>

                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

