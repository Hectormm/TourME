<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" 
    AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="TourMe.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style1
    {
        width: 358px;
            height: 464px;
        }
        .style24
        {
            width: 61%;
            margin-left: 159px;
        }
        .style25
        {
            width: 193px;
        }
        .style26
        {
        }
        .style27
        {
            text-align: center;
        }
        .style28
        {
            width: 36%;
            margin-left: 0px;
        }
        .style29
        {
            width: 25px;
        }
        .style32
        {
            width: 128px;
            height: 22px;
        }
        .style33
        {
            width: 143px;
            height: 22px;
        }
        .style34
        {
            width: 193px;
            height: 22px;
        }
        .style35
        {
            width: 25px;
            height: 22px;
        }
        .style36
        {
            width: 143px;
        }
        .style37
        {
            width: 128px;
        }
        .style38
        {
            width: 100%;
        }
        .style39
        {
            width: 85px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server" Height="229px" Width="818px" 
            style="text-align: left">
        <div style="height: 711px">
            <br />
            <table align="left" class="style24">
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style36">
                        <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                    </td>
                    <td class="style25">
                        <asp:Label ID="LabelNombre2" runat="server" Text="Nombre"></asp:Label>
                    </td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style36">
                        <asp:Label ID="Label2" runat="server" Text="Apellidos"></asp:Label>
                    </td>
                    <td class="style25">
                        <asp:Label ID="LabelApellidos2" runat="server" Text="Apellidos"></asp:Label>
                    </td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style36">
                        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="style25">
                        <a href="mailto:roberto@tourme.com">
                        <asp:Label ID="LabelEmail2" runat="server"></asp:Label>
                        </a>
                    </td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style36">
                        <asp:Label ID="Label4" runat="server" Text="Direccion"></asp:Label>
                    </td>
                    <td class="style25">
                        <asp:Label ID="LabelDireccion2" runat="server" Text="Calle"></asp:Label>
                    </td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style36">
                        <asp:Label ID="Label5" runat="server" Text="CP"></asp:Label>
                    </td>
                    <td class="style25">
                        <asp:Label ID="LabelCodigoPostal2" runat="server"></asp:Label>
                    </td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style36">
                        <asp:Label ID="Label6" runat="server" Text="DNI"></asp:Label>
                    </td>
                    <td class="style25">
                        <asp:Label ID="LabelDNI2" runat="server" Text="LabelDNI2"></asp:Label>
                    </td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        </td>
                    <td class="style33">
                        <asp:Label ID="Label7" runat="server" Text="Teléfono"></asp:Label>
                    </td>
                    <td class="style34">
                        <asp:Label ID="LabelTelefono2" runat="server" Text="LabelTelefono2"></asp:Label>
                    </td>
                    <td class="style35">
                        </td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style36">
                        <asp:Label ID="Label8" runat="server" Text="Fecha Nacimiento"></asp:Label>
                    </td>
                    <td class="style25">
                        <asp:Label ID="LabelFNacimiento2" runat="server" Text="LabelFNacimiento2"></asp:Label>
                    </td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style36">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        <strong>EXCURSIONES</strong></td>
                    <td class="style36">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td class="style29">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style26" colspan="4">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                            onselectedindexchanged="GridView2_SelectedIndexChanged1" Width="480px">
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
                                <asp:CommandField ButtonType="Button" SelectText="Ver" ShowSelectButton="True" 
                                    UpdateText="Ver" />
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
                        <div class="style27">
                            <br />
                            <table class="style38">
                                <tr>
                                    <td class="style39">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style39">
                                        <strong>PEDIDOS</strong></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="numpedido" 
                                DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
                                onselectedindexchanged="GridView3_SelectedIndexChanged1" Width="488px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="numpedido" HeaderText="numpedido" ReadOnly="True" 
                                        SortExpression="numpedido" Visible="False" />
                                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                    <asp:BoundField DataField="comentario" HeaderText="comentario" 
                                        SortExpression="comentario" />
                                    <asp:BoundField DataField="confirmado" HeaderText="confirmado" 
                                        SortExpression="confirmado" Visible="False" />
                                    <asp:CommandField ButtonType="Button" SelectText="Ver" 
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM PEDIDO WHERE CONFIRMADO = '1' AND PEDIDO.EMAIL = 'hectormm@gmail.com'">
                            </asp:SqlDataSource>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                Text="Cambiar Contraseña" />
                            <asp:Button ID="ButtonModificarPerfil" runat="server" 
                                onclick="ButtonModificarPerfil_Click" style="text-align: center" 
                                Text="Modificar Perfil" Width="120px" />
                            <asp:Button ID="ButtonEliminarPerfil0" runat="server" 
                                onclick="ButtonEliminarPerfil_Click" Text="Eliminar Perfil" 
                                Width="120px" />
                        </div>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            
            SelectCommand="SELECT EXCURSION.ID,  convert(varchar(10), EXCURSION.Fecha, 103), EXCURSION.Titulo, EXCURSION.Ciudad FROM CLIENTE INNER JOIN PARTICIPA ON CLIENTE.email = PARTICIPA.Organizador INNER JOIN EXCURSION ON PARTICIPA.Excursion = EXCURSION.ID WHERE (CLIENTE.email = ' ')">
        </asp:SqlDataSource>
        <br />
        <table align="center" class="style28">
        </table>
        <br />
    </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <div class="style27">
                <asp:Label ID="LabelNoRegistrado" runat="server" style="text-align: center" 
                    Text="Label"></asp:Label>
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Registro.aspx">aquí.</asp:HyperLink>
                <br />
                <asp:Label ID="LabelNoLogeado" runat="server" Text="Label"></asp:Label>
                <asp:HyperLink ID="HyperLink7" runat="server" 
                    NavigateUrl="~/Default/Default.aspx">Aquí</asp:HyperLink>
            </div>

        </asp:Panel>

</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
