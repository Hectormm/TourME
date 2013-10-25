<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TourMe.Default.Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style33
        {
            width: 19px;
        }
        .style34
        {
            width: 643px;
        }
        .style32
        {
            width: 100%;
            height: 219px;
            margin-top: 0px;
        }
        .style28
        {
            width: 120px;
            text-align: justify;
        }
        .style31
        {
            text-align: justify;
        }
        .style15
        {
            text-align: justify;
        }
        .style30
        {
            width: 17px;
            text-align: justify;
        }
        .style26
        {
            width: 289px;
            text-align: justify;
        }
        .style29
        {
            width: 40px;
            text-align: justify;
        }
        .style27
        {
            width: 309px;
            text-align: justify;
        }
        .style10
        {
            width: 120px;
        }
        .style19
        {
            width: 120px;
            height: 23px;
        }
        .style35
        {
            width: 120px;
            height: 22px;
        }
        .hidden    
        {       
            display:none;    
        }
    .style36
    {
        font-size: medium;
    }
    .style37
    {
        width: 51px;
        text-align: justify;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
        <div id="fb-root"></div>
    <script>        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));</script>
    
    <div>
    
    
    <div style="height: 386px; margin-bottom: 0px;">
        <asp:Panel ID="Panel2" runat="server" Height="411px">
            <div>
                <table style="width:100%;">
                    <tr>
                        <td class="style28" rowspan="3">
                            <br />
                        </td>
                        <td class="style31" colspan="4">
                            <strong>&nbsp;<asp:Label ID="Label6" runat="server" CssClass="style36" 
                                style="font-weight: 700; " 
                                Text="Bienvenido a TourMe, tu red social de Excursiones. "></asp:Label>
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="style36" 
                                NavigateUrl="~/Registro.aspx">Regístrate.</asp:HyperLink>
                            </strong></td>
                        <td class="style30">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style15" colspan="5">
                         <div class="fb-like" data-send="false" data-width="450" data-show-faces="false" data-action="recommend"></div>
                          <a href="https://twitter.com/TourMe1" class="twitter-follow-button" data-show-count="false" data-lang="es">Seguir a @TourMe</a>
<script>    !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script> 
                           
                           &nbsp; 
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style37" rowspan="12">
                            &nbsp;</td>
                        <td class="style26" rowspan="12">
                            <html>
                            <head>
                            <title>Slide.Show</title>
                            <script src="Silverlight.js" type="text/javascript">


</script>
                            <script src="SlideShow.js" type="text/javascript">


</script>
                            </head>
                            <body>
                            <script type="text/javascript">



		                        new SlideShow.Control(new SlideShow.XmlConfigProvider());
		                    </script>
                            </body>
                            </html>
                            &nbsp;</td>
                        <td class="style29" rowspan="12">
                            &nbsp;</td>
                        <td class="style27" rowspan="12">
                            <asp:Panel ID="PanelBienvenido" runat="server" Height="273px">
                                TourMe es una red Social ideada para que los amantes de las excursiones puedan 
                                realizar su afición favorita, compartirla con otro usuarios y hacer nuevas 
                                amistades.<br />
                                <br />
                                En TourMe podrás comprar todo los necesario para tus acctividades en nuestra 
                                Tienda. Podrás apuntarte a una de las numerosas excursiones realizadas por 
                                nuestros usuarios.<br />
                                <br />
                                Esperamos que disfrutes de la web e interactues con el resto de usuarios.</asp:Panel>
                        </td>
                        <td class="style30" rowspan="12">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style10">
                            <asp:Label ID="LabelUsuario" runat="server" style="font-weight: 700; " 
                                Text="USUARIO"></asp:Label>
                            <br />
                            <asp:HyperLink ID="HyperLinkPerfil" runat="server" 
                                NavigateUrl="~/Perfil/Perfil.aspx" Visible="False">HyperLink</asp:HyperLink>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            <asp:TextBox ID="TextBoxEmail" runat="server" AutoCompleteType="Disabled" 
                                onclick="this.value=''" Width="120px">Email</asp:TextBox>
                            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" 
                                Width="120px">Password</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            <asp:Button ID="ButtonEntrar" runat="server" BackColor="#80B670" 
                                onclick="Button1_Click" Text="Entrar" Width="120px" />
                            <asp:Button ID="ButtonLogout" runat="server" BackColor="#80B670" 
                                onclick="ButtonLogout_Click" Text="Salir" Visible="false" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            <asp:HyperLink ID="HyperLink3" runat="server" 
                                NavigateUrl="~/Perfil/Recuperacion.aspx">Recordar Contraseña</asp:HyperLink>
                            <asp:Label ID="LabelErrorLogin" runat="server" style="color: #FF0000" 
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style19">

                    </tr>
                    <tr>
                        <td class="style10">
                             
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style10">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style10">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style35">
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    </div>
    <div>
                    <table class="style32" __designer:mapid="3f">
                        <tr __designer:mapid="40">
                            <td class="style33" __designer:mapid="41" rowspan="2">
                                &nbsp;</td>
                            <td class="style34" __designer:mapid="42">
                                <strong>PRÓXIMAS EXCURSIONES</strong></td>
                        </tr>
                        <tr __designer:mapid="40">
                            <td class="style34" __designer:mapid="42">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                CellPadding="5" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                                GridLines="None" Height="197px" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                                style="text-align: center; margin-left: 0px; margin-top: 2px;" Width="801px" DataKeyNames="ID" 
                                AllowPaging="True" PageSize="5" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="Fecha" SortExpression="Column1" 
                                        ReadOnly="True" />
                                    <asp:BoundField DataField="Titulo" HeaderText="Titulo" 
                                        SortExpression="Titulo" />
                                    <asp:BoundField DataField="Organizador" HeaderText="Organizador" 
                                        SortExpression="Organizador" Visible="False" />
                                    <asp:BoundField DataField="p_act" HeaderText="Personas" 
                                        SortExpression="p_act" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" 
                                        SortExpression="ID" ReadOnly="True" Visible="False">
                                    </asp:BoundField>
                                    <asp:CommandField ButtonType="Button" SelectText="Ver" 
                                        ShowSelectButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerSettings Visible="False" />
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
                                    
                                    
                                    SelectCommand="SELECT [Titulo], [Organizador], [p_act],  convert(varchar(10), Fecha, 103), [ID] FROM [EXCURSION] WHERE [Fecha]&gt;=GETDATE() ORDER BY [Fecha] ASC">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server"></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server"></asp:Content>
