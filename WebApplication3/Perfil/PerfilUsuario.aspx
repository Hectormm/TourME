<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="ClassLibrary2.Perfil.PerfilExterno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style2
        {
            text-align: center;
        }
        .style3
        {
            width: 100%;
        }
        .style5
        {
            height: 21px;
        }
        .style6
        {
            width: 161px;
            height: 21px;
        }
        .style7
        {
            width: 161px;
        }
        .style8
        {
            width: 159px;
        }
        .style9
        {
            width: 159px;
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="Panel2" runat="server">
        <br />
        <table class="style3">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td class="style8">
                    <asp:Label ID="LabelNombre" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label2" runat="server" Text="Apellidos"></asp:Label>
                </td>
                <td class="style8">
                    <asp:Label ID="LabelApellidos" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                </td>
                <td class="style6">
                    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="style9">
                    <asp:Label ID="LabelEmail" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td class="style5">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <div style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                style="text-align: left; margin-left: 60px;" Width="729px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                        SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Column1" HeaderText="Fecha" SortExpression="Column1" 
                        ReadOnly="True" />
                    <asp:BoundField DataField="Titulo" HeaderText="Titulo" 
                        SortExpression="Titulo" />
                    <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                        SortExpression="Ciudad" />
                    <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT EXCURSION.ID, convert(varchar(10), EXCURSION.Fecha, 103), EXCURSION.Titulo, EXCURSION.Ciudad FROM CLIENTE INNER JOIN PARTICIPA ON CLIENTE.email = PARTICIPA.Organizador INNER JOIN EXCURSION ON PARTICIPA.Excursion = EXCURSION.ID WHERE (CLIENTE.email = ' ')">
        </asp:SqlDataSource>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
        <div class="style2">
            <asp:Label ID="LabelNoRegistrado" runat="server" style="text-align: center" 
                Text="Label"></asp:Label>
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Registro.aspx">aquí.</asp:HyperLink>
            <br />
            <asp:Label ID="LabelNoLogeado" runat="server" Text="Label"></asp:Label>
            <asp:HyperLink ID="HyperLink7" runat="server" 
                NavigateUrl="~/Default/Default.aspx">Aquí</asp:HyperLink>
            <br />
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
