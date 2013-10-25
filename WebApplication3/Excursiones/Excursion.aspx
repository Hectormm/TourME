<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Excursion.aspx.cs" Inherits="TourMe.Excrusion.Exc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 30%;
        }
        .ExTitulo {
            font-size: xx-large;
        }
        .ExSubTitulo {
            font-size: x-large;
        }
        .Descripcion { 
            width: 80%;
            text-align: justify;
        }
        .style2
        {
            height: 196px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="fb-root"></div>
    <script>    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk'));</script>
    <div>
        <table class="auto-style1">
            <tr>
                <td style="vertical-align: baseline; text-align: center;" class="auto-style2">
                    <asp:Image ID="Image1" runat="server"  Width="150" Height="150" />
                </td>
                <td> 
                    <asp:Label runat="server" ID="LabelTitulo" CssClass="ExTitulo" /> <br />
                    <asp:Label runat="server" ID="LabelCiudad" CssClass="ExSubTitulo" />
                    <p>
                        Organizado por: 
                        <asp:LinkButton ID="LinkOrganizador" runat="server" onclick="LinkButton1_Click"></asp:LinkButton>
                    </p>
                        <a href="https://twitter.com/share" class="twitter-share-button" data-via="tourme1" data-lang="es">Twittear</a>
                        <script>
                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");
                        </script>
                        <div class="fb-like" data-send="false" data-width="450" data-show-faces="false" data-action="recommend"></div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" rowspan="2">
                    Longitud: <br />
                        <asp:Label runat="server" ID="LabelLong"></asp:Label><br />
                    Dificultad: <br />
                        <asp:Label runat="server" ID="LabelDiff"></asp:Label><br />
                    Nº Personas: <br />
                        <asp:Label runat="server" ID="LabelPersAct"></asp:Label>/<asp:Label runat="server" ID="LabelPersMax"></asp:Label><br />
                    Salida de: <br />
                        <asp:Label runat="server" ID="LabelSalida"></asp:Label><br />
                    Llegada a: <br />
                        <asp:Label runat="server" ID="LabelLlegada"></asp:Label><br />
                    Fecha: <br />
                        <asp:Label runat="server" ID="LabelFecha"></asp:Label>
                    <br />
                        <asp:Panel runat="server" ID="PanelLog" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="ButtonLog" BackColor="#80B670" onclick="ButtonLog_Click" />
                        </asp:Panel>
                </td>
                <td class="style2">
                    <h3>Descripción:</h3>
                        <asp:Label ID="LabelDesc" CssClass="Descripcion" runat="server" />
                        
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Panel ID="Panel2" runat="server" Height="22px">
                        <asp:Button ID="Button1" runat="server" Text="Atrás" BackColor="#80B670" 
                            Width="99px" onclick="Button1_Click"/>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
