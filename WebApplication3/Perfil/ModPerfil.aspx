<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ModPerfil.aspx.cs" Inherits="ClassLibrary2.Perfil.ModPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
            height: 398px;
        }
        .style10
        {
            height: 22px;
            width: 180px;
        }
        .style11
        {
            width: 180px;
        }
        .style15
        {
            height: 22px;
            width: 108px;
        }
        .style19
        {
            height: 22px;
            width: 38px;
        }
        .style24
        {
            height: 22px;
            }
        .style25
        {
            width: 104px;
        }
        .style26
        {
            text-align: center;
        }
        .style27
        {
            width: 108px;
        }
        .style28
        {
            width: 38px;
            height: 23px;
        }
        .style29
        {
            width: 104px;
            height: 23px;
        }
        .style30
        {
            width: 108px;
            height: 23px;
        }
        .style31
        {
            height: 23px;
        }
        .style32
        {
            text-align: center;
            height: 47px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="Panel2" runat="server" Height="414px">
        <table class="style2">
            <tr>
                <td class="style19">
                </td>
                <td class="style24" colspan="3">
                    <strong>MODIFICA TUS DATOS. LOS DATOS QUE DESEÉS MANTENER DEJALOS EN BLANCO.</strong></td>
            </tr>
            <tr>
                <td class="style19">
                    &nbsp;</td>
                <td class="style24">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style19">
                </td>
                <td class="style24">
                    <asp:Label ID="Label9" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td class="style15">
                    <asp:TextBox ID="TextBoxNombre" runat="server" ReadOnly="True" Width="140px"></asp:TextBox>
                </td>
                <td class="style10">
                    <asp:TextBox ID="TextBoxNombre2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style25">
                    <asp:Label ID="Label10" runat="server" Text="Apellidos"></asp:Label>
                </td>
                <td class="style27">
                    <asp:TextBox ID="TextBoxApellido" runat="server" ReadOnly="True" Width="140px"></asp:TextBox>
                </td>
                <td class="style11">
                    <asp:TextBox ID="TextBoxApellidos2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style25">
                    <asp:Label ID="Label12" runat="server" Text="DNI"></asp:Label>
                </td>
                <td class="style27">
                    <asp:TextBox ID="TextBoxDNI" runat="server" ReadOnly="True" Width="140px"></asp:TextBox>
                </td>
                <td class="style11">
                    <asp:TextBox ID="TextBoxDNI2" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="TextBoxDNI2" ErrorMessage="DNI no Válido" 
                        style="color: #FF0000" 
                        ValidationExpression="(0?[1-9]|[1-9][0-9])[0-9]{6}(-| )?[trwagmyfpdxbnjzsqvhlcke]"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style25">
                    <asp:Label ID="Label13" runat="server" Text="Dirección"></asp:Label>
                </td>
                <td class="style27">
                    <asp:TextBox ID="TextBoxDireccion" runat="server" ReadOnly="True" Width="140px"></asp:TextBox>
                </td>
                <td class="style11">
                    <asp:TextBox ID="TextBoxDireccion2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style25">
                    <asp:Label ID="Label14" runat="server" Text="Código Postal"></asp:Label>
                </td>
                <td class="style27">
                    <asp:TextBox ID="TextBoxCP" runat="server" ReadOnly="True" Width="140px"></asp:TextBox>
                </td>
                <td class="style11">
                    <asp:TextBox ID="TextBoxCP2" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBoxCP2" ErrorMessage="Código Postal no Válido" 
                        style="color: #FF0000" 
                        ValidationExpression="^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style25">
                    <asp:Label ID="Label15" runat="server" Text="Teléfono"></asp:Label>
                </td>
                <td class="style27">
                    <asp:TextBox ID="TextBoxTelefono" runat="server" ReadOnly="True" Width="140px"></asp:TextBox>
                </td>
                <td class="style11">
                    <asp:TextBox ID="TextBoxTelefono2" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBoxTelefono2" ErrorMessage="Telefono no Valido" 
                        style="color: #FF0000" 
                        ValidationExpression="(([+]?34) ?)?(6(([0-9]{8})|([0-9]{2} [0-9]{6})|([0-9]{2} [0-9]{3} [0-9]{3}))|9(([0-9]{8})|([0-9]{2} [0-9]{6})|([1-9] [0-9]{7})|([0-9]{2} [0-9]{3} [0-9]{3})|([0-9]{2} [0-9]{2} [0-9]{2} [0-9]{2})))"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style25">
                    <asp:Label ID="Label16" runat="server" Text="Fecha Nacimiento"></asp:Label>
                </td>
                <td class="style27">
                    <asp:TextBox ID="TextBoxFNacimiento" runat="server" ReadOnly="True" 
                        Width="140px"></asp:TextBox>
                </td>
                <td class="style11">
                    <asp:TextBox ID="TextBoxFNacimiento2" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="TextBoxFNacimiento2" 
                        ErrorMessage="Formato de Fecha Erroneo dd/mm/aaaa" style="color: #FF0000" 
                        ValidationExpression="(0[1-9]|[12][0-9]|3[01]|[1-9])[- /.]([1-9]|0[1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style25">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style28">
                </td>
                <td class="style29">
                </td>
                <td class="style30">
                </td>
                <td class="style31">
                </td>
            </tr>
            <tr>
                <td class="style32" colspan="4">
                    <asp:Button ID="Button1" runat="server" Text="Volver" 
                        onclick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Text="Modificar" 
                        onclick="Button2_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <div _designerregion="0">
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
