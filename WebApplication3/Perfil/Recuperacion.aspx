<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Recuperacion.aspx.cs" Inherits="ClassLibrary2.Perfil.Recuperacion" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 89%;
        }
        .style3
        {            height: 206px;
        }
        .style4
        {
        }
        .style6
        {
            width: 466px;
        }
        .style7
        {
            width: 184px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div style="margin-left: 261px">
        <table class="style2">
            <tr>
                <td class="style3">
                   
                        <asp:Panel ID="Panel3" runat="server">

                            <table class="style2">
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                                    </td>
                                    <td class="style6">
                                        <asp:TextBox ID="TextBoxEmail" runat="server" 
                                            ontextchanged="TextBox1_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label3" runat="server" Text="Captcha"></asp:Label>
                                    </td>
                                    <td class="style6">
                                        <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="none" 
                                            CaptchaHeight="60" CaptchaLength="5" CaptchaLineNoise="None" 
                                            CaptchaMaxTimeout="240" CaptchaMinTimeout="5" CaptchaWidth="200" 
                                            style="margin-left: 114px" Width="214px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label4" runat="server" Text="Introduzca el Captcha"></asp:Label>
                                    </td>
                                    <td class="style6">
                                        <asp:TextBox ID="TextBoxCaptcha" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" colspan="2">
                                        <asp:Button ID="ButtonRecuperar" runat="server" 
                                            onclick="ButtonRecuperar_Click1" style="margin-left: 122px" 
                                            Text="Recuperar Contraseña" Width="139px" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Visible="False">
                                <asp:Label ID="Label1" runat="server" 
                        Text="Se ha enviado la contraseña a su email." OnTextChanged="EventHandler" ></asp:Label>
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