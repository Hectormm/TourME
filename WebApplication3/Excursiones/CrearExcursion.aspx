<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CrearExcursion.aspx.cs" Inherits="TourMe.Excursiones.CrearExcursion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 30%;
        }
        .error 
        {
            color:Red; 
            text-align: left;
            font-size: x-small;
        }        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
        <asp:Panel ID="CreaExcursion" runat="server">
            <table class="auto-style1">
                <tr>
                    <td style="vertical-align: baseline; text-align: center;" class="auto-style2">
                        <asp:Image ID="ImageExc" ImageUrl="~/images/modEx.bmp" runat="server" Width="150" Height="150"/><br />
                        <asp:FileUpload ID="FUImagen" runat="server" Width="196px" Height="20px" />
                        <p style="font-size: x-small">
                            (Se redimensionará a 150x150 px)
                        </p>
                    </td>
                    <td>
                         *Título:
                        <asp:TextBox runat="server" ID="TBTitulo" Width="186px"></asp:TextBox>
                        &nbsp;
                         <asp:Label ID="ErrorTitulo" runat="server" CssClass="error" 
                             Text="Rellene este campo." visible="false"></asp:Label>
                         <br />
                         <br />
                         Ciudad:
                        <asp:TextBox runat="server" ID="TBCiudad"></asp:TextBox>
                        <p>Organizado por: <asp:Label runat="server" ID="LabelOrganizador"/></p>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        *Longitud: 
                        <asp:Label ID="ErrorLongitud" runat="server" 
                           Text="Rellene este campo." CssClass="error" visible="false"></asp:Label>
                        <br />
                        <asp:TextBox runat="server" ID="TBLong"  TextMode="SingleLine" Height="16px" Width="77px" /> 
                        <asp:DropDownList ID="DDLDist" runat="server">
                            <asp:ListItem Text="Metros"></asp:ListItem>
                            <asp:ListItem Text="Kilómetros"></asp:ListItem>
                        </asp:DropDownList><br />
                        Dificultad: <br />
                        <asp:DropDownList runat="server" ID="DDLDiff">
                            <asp:ListItem Text="Fácil" />
                            <asp:ListItem Text="Moderado" />
                            <asp:ListItem Text="Avanzado" />
                        </asp:DropDownList><br />
                        Nº Personas: <asp:Label runat="server" ID="LabelPersAct" Text="0" />/<asp:TextBox 
                            runat="server" ID="TBPersMax" Height="22px" Width="16px" />
                        &nbsp;
                        <asp:Label ID="ErrorMax" runat="server" CssClass="error" Text="Campo necesario" 
                            visible="false"></asp:Label>
                        <br />
                        Salida de: <br />
                        <asp:TextBox runat="server" ID="TBSalida" />
                        &nbsp;
                        <asp:Label ID="ErrorSalida" runat="server" CssClass="error" 
                            Text="Campo necesario" visible="false"></asp:Label>
                        <br />
                        Llegada a:
                        <br />
                        <asp:TextBox ID="TBLlegada" runat="server" />
                        <br />
                        Fecha: <br />
                        <asp:DropDownList runat="server" ID="DDLDia">
                            <asp:ListItem Text="01"></asp:ListItem>
                            <asp:ListItem Text="02"></asp:ListItem>
                            <asp:ListItem Text="03"></asp:ListItem>
                            <asp:ListItem Text="04"></asp:ListItem>
                            <asp:ListItem Text="05"></asp:ListItem>
                            <asp:ListItem Text="06"></asp:ListItem>
                            <asp:ListItem Text="07"></asp:ListItem>
                            <asp:ListItem Text="08"></asp:ListItem>
                            <asp:ListItem Text="09"></asp:ListItem>    
                            <asp:ListItem Text="10"></asp:ListItem>
                            <asp:ListItem Text="11"></asp:ListItem>
                            <asp:ListItem Text="12"></asp:ListItem>
                            <asp:ListItem Text="13"></asp:ListItem>
                            <asp:ListItem Text="14"></asp:ListItem>
                            <asp:ListItem Text="15"></asp:ListItem>
                            <asp:ListItem Text="16"></asp:ListItem>
                            <asp:ListItem Text="17"></asp:ListItem>
                            <asp:ListItem Text="18"></asp:ListItem>
                            <asp:ListItem Text="19"></asp:ListItem>
                            <asp:ListItem Text="20"></asp:ListItem>
                            <asp:ListItem Text="21"></asp:ListItem>
                            <asp:ListItem Text="22"></asp:ListItem>
                            <asp:ListItem Text="23"></asp:ListItem>
                            <asp:ListItem Text="24"></asp:ListItem>
                            <asp:ListItem Text="25"></asp:ListItem>
                            <asp:ListItem Text="26"></asp:ListItem>
                            <asp:ListItem Text="27"></asp:ListItem>
                            <asp:ListItem Text="28"></asp:ListItem>
                            <asp:ListItem Text="29"></asp:ListItem>
                            <asp:ListItem Text="30"></asp:ListItem>
                            <asp:ListItem Text="31"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList runat="server" ID="DDLMes">
                            <asp:ListItem Text="01"></asp:ListItem>
                            <asp:ListItem Text="02"></asp:ListItem>
                            <asp:ListItem Text="03"></asp:ListItem>
                            <asp:ListItem Text="04"></asp:ListItem>
                            <asp:ListItem Text="05"></asp:ListItem>
                            <asp:ListItem Text="06"></asp:ListItem>
                            <asp:ListItem Text="07"></asp:ListItem>
                            <asp:ListItem Text="08"></asp:ListItem>
                            <asp:ListItem Text="09"></asp:ListItem>
                            <asp:ListItem Text="10"></asp:ListItem>
                            <asp:ListItem Text="11"></asp:ListItem>
                            <asp:ListItem Text="12" ></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList runat="server" ID="DDLAnyo">
                            <asp:ListItem Text="2012"></asp:ListItem>
                            <asp:ListItem Text="2013"></asp:ListItem>
                            <asp:ListItem Text="2014"></asp:ListItem>
                            <asp:ListItem Text="2015"></asp:ListItem>
                            <asp:ListItem Text="2016"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="ErrorFecha" runat="server" CssClass="error" 
                            Text="La fecha tiene que ser mayor al día actual." visible="false"></asp:Label>
                    </td>
                    <td>
                        <h3>*Descripción: <asp:Label ID="ErrorDesc" runat="server" CssClass="error" 
                                Text="Campo necesario" visible="false"></asp:Label>
                        </h3>
                        <asp:TextBox ID="TBDesc" runat="server" style="margin-left: 60px" 
                            Width="80%" TextMode="MultiLine" MaxLength="500" Height="140px" />
                        <p style="font-size: x-small;">(*)Campos imprescindibles</p>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="PAceptar" runat="server" HorizontalAlign="Center">
                <asp:Button ID="CrearButton" runat="server" Text="Crear Excursión" BackColor="#80B670" OnClick="Crear"/>
                &nbsp;
                <asp:Button ID="CancelarButton" BackColor="#80B670" runat="server" Height="26px" onclick="Button2_Click" 
                    Text="Cancelar" Width="139px" />
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="ExcursionCreada" runat="server" Visible="false" HorizontalAlign="Center">
            <h1>Excursión creada correctamente.</h1>
            <asp:Button ID="AceptarButton" runat="server" Text="Aceptar" BackColor="#80B670"
                onclick="AceptarButton_Click" />
        </asp:Panel>
        <asp:Panel ID="CreaFallida" runat="server" Visible="false" HorizontalAlign="Center">
            <h1>No se ha podido crear la excurión.</h1>
            <h2>Por favor intentelo de nuevo más tarde.</h2>
            <asp:Button ID="Button1" runat="server" Text="Aceptar" BackColor="#80B670" PostBackUrl="~/Excursiones/Excursiones.aspx"/>
        </asp:Panel>
        <asp:Panel ID="PanelNoLog" runat="server" HorizontalAlign="Center" Visible = "false">
            <h1>Tiene que estar registrado para crear una excursión.</h1>
            <asp:Button ID="ButtonLog" runat="server" Text="Loguearse" BackColor="#80B670" PostBackUrl="~/Default/Default.aspx"/>
            &nbsp;&nbsp;<asp:Button ID="ButtonReg" runat="server" BackColor="#80B670" Height="26px" 
                PostBackUrl="~/Registro.aspx" Text="Registrarse" />
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
