<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="EliminarUsuario.aspx.cs" Inherits="ClassLibrary2.Perfil.EliminarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
            height: 42px;
        }
        .style3
        {
            width: 108px;
        }
        .style4
        {
            width: 636px;
        }
        .style5
        {
            width: 48%;
            margin-left: 263px;
        }
        .style9
        {
            text-align: left;
        }
        .style10
        {
            width: 100%;
            margin-left: 0px;
        }
        .style11
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="Panel2" runat="server" Height="96px" Width="852px">
        <table class="style2">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    Está a punto de proceder a la emininación de su perfil. Esto será llevado a cabo 
                    por el equpo técnico de TourMe en las siguiente 48 horas. Como medida de 
                    seguridad, usted deberá introducir su Email y Contraseña para comenzar el 
                    proceso. Recibirá un email informativo de que su cuenta está en proceso de 
                    eliminación y otro de confirmación cuando el proceso se haya completado.</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="Panel3" runat="server" style="text-align: center">
        <table class="style5">
            <tr>
                <td class="style9">
                    <asp:Label ID="Label1" runat="server" Text="Email "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9" colspan="2">
                    <asp:Label ID="LabelError" runat="server" style="color: #FF0000" Text="Label" 
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ButtonEliminar" runat="server" Text="Eliminar" 
            onclick="ButtonEliminar_Click" />
    </asp:Panel>

    <asp:Panel ID="Panel5" runat="server">
        <div class="style11">
            Debes iniciar sesión para poder Eliminar tu Usuario.
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/Default/Default.aspx">Aquí.</asp:HyperLink>
        </div>
    </asp:Panel>

    <br />
    <asp:Panel ID="Panel4" runat="server" Visible="False">
        <table class="style10">
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="Label3" runat="server" 
                        Text="El proceso de Eliminación de su Usuario a comenado. Revise su Email."></asp:Label>
                    <br />
                    <div>
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Volver" />
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
