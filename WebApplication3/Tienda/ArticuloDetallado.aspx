<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ArticuloDetallado.aspx.cs" Inherits="TourMe.Tienda.DetalleProducto" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="contenedor" 
        style="height: 498px; width: 850px; margin-bottom: 1px; position: static;">
        <div id="cabecera"
        style="position:absolute; top: 18px; left: 13px;">
        <br />
            <div id="Imagen"
            style="position:absolute; top: 17px; left: 6px;">
        <asp:Image ID="Image1" runat="server" Height="138px" Width="187px" />
            </div>
            <div id="FichaTecnica"
            style="position:absolute; top: 3px; left:231px; width: 618px; height: 257px;">
            <div id="Nombre_FichaTecnica"
            style = "position:absolute; top: 1px; left:4px; width: 606px; height: 1px;">

                <asp:Label ID="NombreFicha" runat="server" Text="Nombre: "></asp:Label>

            </div>
            <div id="NReferencia_FichaTecnica"
                    style = "position:absolute; top: 19px; left:3px; width: 571px; height: 15px; right: 44px;">

                <asp:Label ID="NReferencia" runat="server" Text="Nº de Referencia: "></asp:Label>

            </div>
                <div id="Marca_FichaTecnica"
                style = "position:absolute; top: 38px; left:4px; width: 606px; height: 7px;">

                     <asp:Label ID="Marca" runat="server" Text="Marca: "></asp:Label>
                        <div id="Modelo_FichaTecnica"
                        
                         style = "position:absolute; top: -1px; left:228px; width: 210px; height: 4px;">
                             <asp:Label ID="Modelo" runat="server" Text="Modelo: "></asp:Label>

                        </div>
                </div>
                <div id="Terreno_FichaTecnica"
            style = "position:absolute; top: 55px; left:2px; width: 609px; height: 4px;">
                </div>
                    <div id="Materiales_FichaTecnica"
            style = "position:absolute; top: 74px; left:2px; width: 606px; height: 19px;">

                    <asp:Label ID="Materiales" runat="server" Text="Materiales: "></asp:Label>

                    </div>
                    <div id="TipoSuela_FichaTecnica"
            style = "position:absolute; top: 101px; left:0px; width: 609px; height: 19px;">

                <asp:Label ID="Tipo" runat="server" Text="Tipo : "></asp:Label>

                    </div>

                    <div id="descripcion">
                    </div>

                    <div id="Precio_FichaTecnica"
            style = "position:absolute; top: 172px; left:4px; width: 612px; height: 74px;">

                <asp:Label ID="Precio" runat="server" Text="P.V.P: " Font-Bold="True" 
                            Font-Italic="False" Font-Names="Comic Sans MS" Font-Size="X-Large" 
                            Font-Strikeout="False" ForeColor="Red" Height="53px" Width="547px"></asp:Label>
                           <div id="Carrito"                            
                            
                            style = "position:absolute; top:2px; left:352px; width: 120px; height: 70px; font-family: Calibri; color: #FF0000;" 
                            align="center">
                                &nbsp;&nbsp;&nbsp;
                               <asp:ImageButton ID="Añadiralcarrito" runat="server" Height="46px" Width="54px" 
                                   ImageUrl="~/images/Tienda/carro_compra.jpg" 
                                   onclick="Añadiralcarrito_Click" />
                               <br><asp:Label ID="añadidoOkLabel" runat="server"></asp:Label>
                                   <br>
                               <asp:Label ID="Label1" runat="server" Text="Añadir al carrito"></asp:Label>
                            </div>
                    </div>
            </div>
        </div>
        
        <div id= "Descripcion" 
            style="position:absolute; top: 143px; left: 245px; width: 614px;">
                        <asp:Label ID="descripcionlabel" runat="server" Text="Descripción: "></asp:Label>
             <br />

             <div id="cantidad" 
                            style="position:absolute; top: 167px; left: -2px; width: 179px; height: 54px; margin-bottom: 0px;">
                 
                 <asp:Label ID="Label2" runat="server" Text="¿Cúantos productos desea?:"></asp:Label>
                
                <br />&nbsp;<br />&nbsp;
                <asp:DropDownList ID="DropDownListCantidad" runat="server" 
                     Height="33px" Width="41px">
                     <asp:ListItem>1</asp:ListItem>
                     <asp:ListItem>2</asp:ListItem>
                     <asp:ListItem>3</asp:ListItem>
                     <asp:ListItem>4</asp:ListItem>
                     <asp:ListItem>5</asp:ListItem>
                     <asp:ListItem>6</asp:ListItem>
                     <asp:ListItem>7</asp:ListItem>
                     <asp:ListItem>8</asp:ListItem>
                     <asp:ListItem>9</asp:ListItem>
                     <asp:ListItem>10</asp:ListItem>
                 </asp:DropDownList>
             </div>

             <div id="ircarrito" 
                 style="position:absolute; top: 301px; left: 115px; width: 89px; height: 16px;">

                 <asp:LinkButton ID="ircarritoLink" runat="server" onclick="ircarritoLink_Click" Text="Ir al carrito"></asp:LinkButton>
             </div>

             <div id="seguircompra" 
                 style="position:absolute; top: 301px; left: 304px; width: 146px; height: 29px;">

                 <asp:LinkButton ID="seguircompraLink" runat="server" 
                     onclick="seguircompraLink_Click" Text="Seguir Comprando"></asp:LinkButton>
             </div>

             <div id="Comentario" 
                 style="position:absolute; top: 163px; left: 237px; width: 338px; height: 74px; ">
           
                 <textarea id="TextAreaComentario"
                            runat="server" name="S1" rows="5" cols="30">Introduzca comentario si lo desea</textarea>

             </div>

             <div id="registro" 
                            
                            style="position:absolute; top: 169px; left: 58px; width: 428px; height: 29px;" 
                            align="center">

                 <asp:Label ID="avisoLabel" runat="server" Text="Para comprar es necesario iniciar sesión"></asp:Label>
                 <br>
                 <asp:Label ID="registroLabel" runat="server" Text="Registrese "></asp:Label>
                 <asp:LinkButton ID="registroLink" runat="server" onclick="registroLink_Click">aquí</asp:LinkButton>
                 <br>
                 <asp:Label ID="inicioLabel" runat="server" Text="Inicia Sesión "></asp:Label>
                 <asp:LinkButton ID="inicioLink" runat="server" onclick="inicioLink_Click">aquí</asp:LinkButton>

             </div>
        </div>
    </div>

        
<!--     
        <div id= "Descripcion"
        style="position:absolute; top: 192px; left: 16px; width: 846px;">
        <br />
            &lt;AQUÍ VA LA DESCRIPCIÓN TOTAL DEL PRODUCTO&gt;</div>
        </div>
-->

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="Head">
    <style type="text/css">
        #cabecera
        {
            height: 265px;
            width: 848px;
        }
        #descripcion
        {
            height: 50px;
        }
        #Text1
        {
            width: 598px;
        }
        #TextArea1
        {
            height: 103px;
            width: 458px;
            margin-top: 0px;
        }
        #TextAreaComentario
        {
            height: 71px;
            width: 338px;
        }
    </style>
</asp:Content>

