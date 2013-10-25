<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ModPass.aspx.cs" Inherits="ClassLibrary2.Perfil.ModPass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style5
        {
            width: 230px;
        }
        .style7
        {
            width: 243px;
        }
        .style8
        {
            width: 225px;
        }
        .style9
        {
            width: 132px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="Panel2" runat="server" Height="175px">
        <table class="style2">
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Label ID="Label1" runat="server" Text="Contraseña Actual"></asp:Label>
                </td>
                <td class="style7">
                    <asp:TextBox ID="TextBoxPassActual" runat="server"></asp:TextBox>
                </td>
                <td class="style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Label ID="Label2" runat="server" Text="Nueva Contraseña"></asp:Label>
                </td>
                <td class="style7">
                    <asp:TextBox ID="TextBoxNuevoPass" runat="server"></asp:TextBox>
                </td>
                <td class="style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Label ID="Label3" runat="server" Text="Confirmación de Contraseña"></asp:Label>
                </td>
                <td class="style7">
                    <asp:TextBox ID="TextBoxNuevoPass2" runat="server"></asp:TextBox>
                    <asp:Label ID="LabelError" runat="server" style="color: #FF0000" Text="Label" 
                        Visible="False"></asp:Label>
                </td>
                <td class="style9">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <div style="text-align: center">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Volver" />
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                style="text-align: center" Text="Cambiar" />
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Height="61px" style="text-align: center" 
        Visible="False">
        <div style="height: 31px">
            <asp:Label ID="LabelOK" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Volver" />
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
