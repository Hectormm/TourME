<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="ClassLibrary2.Tienda.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .hidden    
        {       
            display:none;    
        }
        #Cabecera
        {
            height: 132px;
            width: 1248px;
        }
        #Centrarlo
        {
            width: 524px;
            height: 30px;
            margin-left: 280px;
        }
        #Centrarlo1
        {
            width: 671px;
            height: 20px;
        }
        #CheckBoxlist
        {
            height: 74px;
            margin-top: 0px;
        }
        #Text1
        {
            width: 20px;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
        }
        .style4
        {
            width: 71px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<asp:Panel ID="PCarrito" runat="server">
    <div id="contenedor" style="
        style="height: 586px; width: 855px; margin-bottom: 1px; position: static;">
              <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" Height="251px" Width="571px" 
            DataKeyNames="linea,numpedido" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
                  <AlternatingRowStyle BackColor="White" />
                  <Columns>
                      <asp:BoundField DataField="nombre" HeaderText="nombre" 
                          SortExpression="nombre" />
                      <asp:BoundField DataField="cantidad" HeaderText="cantidad" 
                          SortExpression="cantidad" />
                      <asp:BoundField DataField="precio" HeaderText="precio" 
                          SortExpression="precio" />
                      <asp:BoundField DataField="codigo_producto" HeaderText="codigo_producto" 
                          SortExpression="codigo_producto" >
                      </asp:BoundField>
                      <asp:BoundField DataField="linea" HeaderText="linea" ReadOnly="True" 
                          SortExpression="linea" Visible="False" >
                      </asp:BoundField>
                      <asp:BoundField DataField="numpedido" HeaderText="numpedido" ReadOnly="True" 
                          SortExpression="numpedido" Visible="False" >
                      </asp:BoundField>
                      <asp:CommandField ButtonType="Button" SelectText="Borrar" 
                          ShowSelectButton="True" />
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


        <div id="lateral" 
            style="position:absolute; top: 107px; left: 668px; width: 183px; height: 325px;">
            <br />
            
            <br />
            <table class="style2">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="Detalles Cliente"></asp:Label>
                        :</td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label" runat="server" Text="Nombre:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelN" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label2" runat="server" Text="Dirección:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelD" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label4" runat="server" Text="CP"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelCP" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3" colspan="2">
                        Detalles Pedido:</td>
                </tr>
                <tr>
                    <td class="style4">
            <asp:Label ID="Total" runat="server" Text="Total: "></asp:Label>
                    </td>
                    <td>
            <asp:Label ID="PrecioTotal" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
            <asp:Label ID="Producto" runat="server" Text="Productos:"></asp:Label>
                    </td>
                    <td>
            <asp:Label ID="ProductoTotal" runat="server"></asp:Label>
            
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                </table>
            
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            
                  SelectCommand="SELECT DETALLES.nombre, LINPED.cantidad, LINPED.precio, LINPED.codigo_producto, LINPED.linea, LINPED.numpedido FROM LINPED INNER JOIN PEDIDO ON LINPED.numpedido = PEDIDO.numpedido INNER JOIN DETALLES ON LINPED.codigo_producto = DETALLES.codigo_producto INNER JOIN PRODUCTO ON LINPED.codigo_producto = PRODUCTO.codigo_producto AND DETALLES.codigo_producto = PRODUCTO.codigo_producto  AND PEDIDO.confirmado = 0">
        </asp:SqlDataSource>
        <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center">
            <asp:Button ID="Button1" runat="server" Text="Confirmar" 
                onclick="Button1_Click" />
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="Atrás" Height="25px" 
                onclick="Button2_Click" Width="83px" />
        </asp:Panel>
   </div>
   </asp:Panel>
    <asp:Panel ID="PanelNoLog" runat="server" HorizontalAlign="Center" Visible = "false">
            <h1>Tiene que estar registrado para ver su carrito.</h1>
            <asp:Button ID="ButtonLog" runat="server" Text="Loguearse" BackColor="#80B670" PostBackUrl="~/Default/Default.aspx"/>
            &nbsp;&nbsp;<asp:Button ID="ButtonReg" runat="server" BackColor="#80B670" Height="26px" 
                PostBackUrl="~/Registro.aspx" Text="Registrarse" />
        </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>

