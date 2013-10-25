<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="TourMe.ProductosTienda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="contenedor" 
        style="height: 586px; width: 855px; margin-bottom: 1px; position: static;">
        <div id="cabeza" style="background-color: #90B1D5; height: 85px;" 
            align="left">
            <div style="height: 30px; position: absolute; top: 45px; left: 70px; width: 344px; right: 466px; margin-bottom: 10px;">
                 <asp:Image ID="lupa" runat="server" Height="18px"
                     ImageUrl="~/images/Tienda/Lupa.png" Width="23px" />
                 <asp:TextBox ID="BuscarBox" runat="server" Font-Names="Calibri" Height="18px"  
                     BorderStyle="None" style="margin-left: 10px; margin-top: 0px;" onFocus="javascript:{this.value = '';Text='';}" 
                     onBlur="javascript:{if(this.value == '') this.value = Text;}"
                                         Text="Buscar Producto"></asp:TextBox>
                 <asp:Button ID="BuscarButton" runat="server" BackColor="#CCCCFF" Height="22px" 
                     style="margin-left: 10px; margin-top: 4px;" Text="Buscar" 
                     onclick="BuscarButton_Click" />
            </div>
            <div id="alCarrito" 
                style="position:absolute; top: 42px; left: 787px; width: 47px; height: 38px;">
                <asp:ImageButton ID="alCarritoLink"  runat="server" 
                    ImageUrl="~/images/Tienda/logo_carrito.png" Height="37px" 
                    onclick="alCarritoLink_Click" Width="46px" />
            </div>
        </div>
        <div id="lateral" 
            
            style="position: absolute; width: 154px; height: 497px; background-color: #90B1D5; border-top-color: #FFFFFF; top: 103px; left: 15px;" 
            align="left">
            
               <br />
               &nbsp;<asp:LinkButton class="linkprod" ID="TiendasLink" runat="server" onclick="TiendasLink_Click" Text="TIENDAS DE CAMPAÑA"></asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="CantimplorasLink" runat="server" onclick="CantimplorasLink_Click">CANTIMPLORAS</asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="PantalonesLink" runat="server" onclick="PantalonesLink_Click">PANTALONES</asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="AccesoriosLink" runat="server" onclick="AccesoriosLink_Click">ACCESORIOS</asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="CamisetasLink" runat="server" onclick="CamisetasLink_Click">CAMISETAS</asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="MochilasLink" runat="server" onclick="MochilasLink_Click">MOCHILAS</asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="BastonesLink" runat="server" onclick="BastonesLink_Click">BASTONES</asp:LinkButton><br />
               &nbsp;<asp:LinkButton class="linkprod" ID="CalzadoLink" runat="server" onclick="CalzadoLink_Click">CALZADO</asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="GuantesLink" runat="server" onclick="GuantesLink_Click">GUANTES</asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="GorrosLink" runat="server" onclick="GorrosLink_Click">GORROS</asp:LinkButton><br>
               &nbsp;<asp:LinkButton class="linkprod" ID="AbrigosLink" runat="server" onclick="AbrigosLink_Click">ABRIGOS</asp:LinkButton><br>
               
        </div>
        
        <div id="productos" 
            
            style="border-style: none; border-color: inherit; border-width: medium; position: absolute; background-color: #FFFFFF; left: 177px; font-family: Calibri;">

         <span class="message">
            <a href="../Default/Default.aspx">TourMe</a> >
            <a href="Tienda.aspx">Tienda</a> > 
            <asp:Label ID="SiteMapLabel" runat="server"></asp:Label><br>
         </span>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server">
        </asp:SqlDataSource>

        <asp:ListView ID="productsList" DataSourceID="SqlDataSource1" runat="server">
                <LayoutTemplate>
                    <ul class="productlist">
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </ul>
                </LayoutTemplate>
                
                <ItemTemplate>
                   <li>
                        <a href="ArticuloDetallado.aspx?cod=<%# Eval("codigo_producto") %>">
                            <img alt="Error al abrir imagen" align="middle" width="125px" height="125px" src="../images/Tienda/Productos/<%# Eval("imagen1") %>"/>
                        </a><br><br><%# Eval("descripcion1") %><br>Precio: <%# Eval("pvp") %>€
                        <br>
                   </li>
                    
                </ItemTemplate>

                <EmptyDataTemplate>
                   <span class="message" style="left:45px; top:75px"> Lo sentimos - No hay productos disponibles para la búsqueda indicada </span >
                </EmptyDataTemplate>
         </asp:ListView>

         <br><br><br>
         <div class="datapager">
              <asp:DataPager ID="DataPager1" PageSize="6" PagedControlID="productsList"  runat="server">
                  <Fields>
                      <asp:NumericPagerField />
                  </Fields>
              </asp:DataPager>
         </div>
        </div>
        <!-- Fin productos -->
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
