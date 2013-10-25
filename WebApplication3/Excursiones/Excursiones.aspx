<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" 
    AutoEventWireup="true" CodeBehind="Excursiones.aspx.cs" Inherits="TourMe.exc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style5
        {
            text-align: center;
        }
        .style9
        {
            text-decoration: underline;
        }
        .style10
        {
            text-align: center;
            height: 50px;
            font-weight: 700;
            font-size: medium;
        }
        .hidden    
        {       
            display:none;    
        }
        .style11
        {
            height: 238px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="style1">
        <tr>
            <td class="style11">
                <asp:Calendar ID="Calendar1" runat="server" ForeColor="Black" 
                    SelectedDate="05/25/2012 11:08:54" ShowGridLines="True" 
                    VisibleDate="2012-05-25" onselectionchanged="Calendar1_SelectionChanged" 
                    style="text-align: left"></asp:Calendar>
            </td>
            <td rowspan="2">
                <table class="style1">
                    <tr>
                        <td class="style10">
                            <asp:TextBox ID="TextBox3" runat="server" ontextchanged="TextBox3_TextChanged" onclick="this.value=''"
                                style="margin-left: 0px" Width="393px">Introduce una ciudad, un destino o un organizador</asp:TextBox>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Ciudad</asp:ListItem>
                                <asp:ListItem>Destino</asp:ListItem>
                                <asp:ListItem>Organizador</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="Button1" runat="server" Height="22px" Text="Buscar" 
                                BackColor="#80B670" Width="60px" onclick="Buscar_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            <asp:Panel ID="LabelUltimas" runat="server">
                                Últimas excursiones añadidas por los usuarios
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                CellPadding="5" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                                GridLines="None" Height="197px" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                                style="text-align: center" Width="578px" DataKeyNames="ID" 
                                AllowPaging="True" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Titulo" HeaderText="Titulo" 
                                        SortExpression="Titulo" />
                                    <asp:BoundField DataField="nombre" HeaderText="Organizador" 
                                        SortExpression="nombre" />
                                    <asp:BoundField DataField="p_act" HeaderText="Personas" 
                                        SortExpression="p_act" />
                                    <asp:BoundField DataField="Column1" HeaderText="Fecha" SortExpression="Column1" 
                                        ReadOnly="True" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" 
                                        SortExpression="ID" ReadOnly="True">
                                    <ControlStyle CssClass="hidden" />
                                    <FooterStyle CssClass="hidden" />
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:CommandField ButtonType="Button" SelectText="Ver" ShowSelectButton="True">
                                    <ControlStyle BackColor="#80B670" />
                                    </asp:CommandField>
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
                                
                                
                                SelectCommand="SELECT EXCURSION.Titulo,    CLIENTE.nombre,EXCURSION.p_act, convert(varchar(10), EXCURSION.Fecha, 103), EXCURSION.ID FROM CLIENTE,EXCURSION WHERE (EXCURSION.Fecha &gt;= GETDATE()) AND CLIENTE.email = EXCURSION.Organizador ORDER BY EXCURSION.Fecha">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            <br class="style9" />
                            <br class="style9" />
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Panel ID="PanelCrear" runat="server" HorizontalAlign="Center">
                    <asp:Button ID="BotonCrear" runat="server" Text="Crear Excursión" BackColor="#80B670"
                        onclick="BotonCrear_Click"/>
                </asp:Panel>    
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
