<%@ Page Title="TourMe - Registro" Language="C#" MasterPageFile="~/MasterPage.master" 
    AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TourMe.Registro" %>
<%@ Register assembly="MSCaptcha" namespace="MSCaptcha" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    
    <style type="text/css">
        #Tabla_Registro
        {
            width: 557px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     
    
    <div>            
    
    <asp:Panel ID="PanelRegistro" runat="server">


    <table ID="Tabla_Registro" class="style1" frame="void" align="center">
        <tr>
            <td class="style10">
                <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td class="style19">
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
            </td>
            <td class="style11">
                <asp:Label ID="Label_ErrorEmail" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBoxEmail" ErrorMessage="Email no Valido" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    style="color: #FF0000"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Label ID="LabelNombre" runat="server" Text="Nombre"></asp:Label>
            </td>
            <td class="style18">
                <asp:TextBox ID="TextBoxNombre" runat="server" style="margin-bottom: 0px"></asp:TextBox>
            </td>
            <td class="style20">
                <asp:Label ID="Label_ErrorNombre" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15">
                <asp:Label ID="LabelApellidos" runat="server" Text="Apellidos"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="TextBoxApellidos" runat="server"></asp:TextBox>
            </td>
            <td class="style17">
                <asp:Label ID="Label_ErrorApellidos" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style21">
                <asp:Label ID="LabelDireccion" runat="server" Text="Dirección"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="TextBoxDireccion" runat="server"></asp:TextBox>
            </td>
            <td class="style23">
                <asp:Label ID="Label_ErrorDireccion" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15">
                <asp:Label ID="LabelTelefono" runat="server" Text="Teléfono"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="TextBoxTelefono" runat="server"></asp:TextBox>
            </td>
            <td class="style20">
                <asp:Label ID="Label_ErrorTelefono" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="TextBoxTelefono" ErrorMessage="Telefono no Valido" 
                    style="color: #FF0000" 
                    ValidationExpression="(([+]?34) ?)?(6(([0-9]{8})|([0-9]{2} [0-9]{6})|([0-9]{2} [0-9]{3} [0-9]{3}))|9(([0-9]{8})|([0-9]{2} [0-9]{6})|([1-9] [0-9]{7})|([0-9]{2} [0-9]{3} [0-9]{3})|([0-9]{2} [0-9]{2} [0-9]{2} [0-9]{2})))"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Label ID="LabelCodigoPostal" runat="server" Text="Código Postal"></asp:Label>
            </td>
            <td class="style18">
                <asp:TextBox ID="TextBoxCP" runat="server" MaxLength="5"></asp:TextBox>
            </td>
            <td class="style20">
                <asp:Label ID="Label_ErrorCP" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="TextBoxCP" ErrorMessage="Código Postal no Válido" 
                    style="color: #FF0000" 
                    ValidationExpression="^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Label ID="Label1" runat="server" Text="DNI"></asp:Label>
            </td>
            <td class="style18">
                <asp:TextBox ID="TextBoxDNI" runat="server" MaxLength="9"></asp:TextBox>
            </td>
            <td class="style20">
                <asp:Label ID="Label_ErrorDNI" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="TextBoxDNI" ErrorMessage="DNI no Válido" 
                    style="color: #FF0000" 
                    ValidationExpression="(0?[1-9]|[1-9][0-9])[0-9]{6}(-| )?[trwagmyfpdxbnjzsqvhlcke]"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style32">
                <asp:Label ID="LabelFechaNacimiento0" runat="server" Text="Fecha de Nacimiento"></asp:Label>
            </td>
            <td class="style33">
                <asp:TextBox ID="TextBoxAnyo" runat="server"></asp:TextBox>
            </td>
            <td class="style31">
                <asp:Label ID="Label_ErrorFecha" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                    ControlToValidate="TextBoxAnyo" 
                    ErrorMessage="Formato de Fecha Erroneo dd/mm/aaaa" style="color: #FF0000" 
                    
                    ValidationExpression="(0[1-9]|[12][0-9]|3[01]|[1-9])[- /.]([1-9]|0[1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
            </td>
        </tr>
        
        <tr>
            <td class="style21">
                <asp:Label ID="LabelContra4" runat="server" Text="Contraseña"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="TextBoxContrasenya" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style23">
                <asp:Label ID="Label_ErrorContrasenya" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style21">
                <asp:Label ID="LabelContra3" runat="server" Text="Confirma Contraseña"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="TextBoxConfirmarContrasenya" runat="server" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td class="style23">
                <asp:Label ID="Label_ErrorConfirmarContrasenya" runat="server" 
                    style="color: #FF0000; text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style21">
                <asp:Label ID="LabelContra5" runat="server" Text="Captcha"></asp:Label>
            </td>
            <td class="style16">
                <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="none" 
                    CaptchaHeight="60" CaptchaLength="5" CaptchaLineNoise="None" 
                    CaptchaMaxTimeout="240" CaptchaMinTimeout="5" CaptchaWidth="200" 
                    style="margin-left: 114px" Width="214px" />
            </td>
            <td class="style23">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style21">
                <asp:Label ID="LabelContra6" runat="server" Text="Introduzca el Captcha"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="TextBoxCaptcha" runat="server"></asp:TextBox>
            </td>
            <td class="style23">
                &nbsp;</td>
        </tr>
        </table>
        </asp:Panel>
        </div>

        <div style="height: 87px; text-align: center; width: 841px; margin-top: 8px;">
        
 
        


        
 
        
            <br />

            <asp:Panel runat="server" Height="44px" Width="837px" >
            <asp:Button ID="Boton_Registrar" runat="server" 
                onclick="Button_Registrar_Click" Text="Registrar"/>
                <asp:Button ID="Boton_Aceptar" runat="server" Text="Aceptar" 
                     Visible="False" PostBackUrl="/Default/Default.aspx" />
                <br />
                <asp:Label ID="Label_RegistroCorrecto" runat="server" 
                    style="font-size: medium; font-weight: 700;" Text="REGISTRO CORRECTO" 
                    Visible="False"></asp:Label>
                <br />
            </asp:Panel>
            



        
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>

