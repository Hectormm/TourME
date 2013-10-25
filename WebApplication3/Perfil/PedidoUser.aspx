<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="PedidoUser.aspx.cs" Inherits="ClassLibrary2.Perfil.PedidoUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
        }
        .style4
        {
            width: 231px;
        }
        .style5
        {
            width: 167px;
        }
        .style6
        {
            width: 303px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="style2">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                <strong>PEDIDO</strong></td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style3" colspan="2">
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
                    ForeColor="#333333" GridLines="None" Width="537px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="nombre" 
                            SortExpression="nombre" />
                        <asp:BoundField DataField="marca" HeaderText="marca" SortExpression="marca" />
                        <asp:BoundField DataField="modelo" HeaderText="modelo" 
                            SortExpression="modelo" />
                        <asp:BoundField DataField="cantidad" HeaderText="cantidad" 
                            SortExpression="cantidad" />
                        <asp:BoundField DataField="precio" HeaderText="precio" 
                            SortExpression="precio" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT DETALLES.nombre, LINPED.cantidad, DETALLES.marca, DETALLES.modelo, LINPED.precio FROM DETALLES INNER JOIN LINPED ON DETALLES.codigo_producto = LINPED.codigo_producto INNER JOIN PEDIDO ON LINPED.numpedido = PEDIDO.numpedido INNER JOIN PRODUCTO ON DETALLES.codigo_producto = PRODUCTO.codigo_producto AND LINPED.codigo_producto = PRODUCTO.codigo_producto">
                </asp:SqlDataSource>
                <br />
                <br />
                <div style="text-align: center">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Volver" />
                </div>
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
