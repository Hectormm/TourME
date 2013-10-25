using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ClassLibrary2.EN;
using System.Collections;

namespace TourMe
{
    public partial class exc3 : System.Web.UI.Page
    {
        protected void Buscar_Click(object sender, EventArgs e)
        {
            LabelUltimas.Visible = false;
            if(DropDownList1.SelectedIndex==0)
            {
                SqlDataSource2.SelectCommand = "SELECT EXCURSION.Titulo,    CLIENTE.nombre,EXCURSION.p_act, convert(varchar(10), EXCURSION.Fecha, 103), EXCURSION.ID FROM CLIENTE,EXCURSION WHERE [Ciudad] = '"+ TextBox3.Text +"' AND CLIENTE.email = EXCURSION.Organizador ORDER BY EXCURSION.Fecha";
            }
            else if(DropDownList1.SelectedIndex==1)
            {
                SqlDataSource2.SelectCommand = "SELECT EXCURSION.Titulo,    CLIENTE.nombre,EXCURSION.p_act, convert(varchar(10), EXCURSION.Fecha, 103), EXCURSION.ID FROM CLIENTE,EXCURSION WHERE [Titulo] = '" + TextBox3.Text + "' AND CLIENTE.email = EXCURSION.Organizador ORDER BY EXCURSION.Fecha";
            }
            else if(DropDownList1.SelectedIndex==2)
            {
                SqlDataSource2.SelectCommand = "SELECT EXCURSION.Titulo,    CLIENTE.nombre,EXCURSION.p_act, convert(varchar(10), EXCURSION.Fecha, 103), EXCURSION.ID FROM CLIENTE,EXCURSION WHERE [Nombre] = '" + TextBox3.Text + "' AND CLIENTE.email = EXCURSION.Organizador ORDER BY EXCURSION.Fecha";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                PanelCrear.Visible = true;
            }
            else
            {
                PanelCrear.Visible = false;
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string ID = GridView1.SelectedValue.ToString();
            Response.Redirect("Excursion.aspx?ID=" + Server.UrlEncode(ID));
        }

        protected void BotonCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearExcursion.aspx");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e){
            LabelUltimas.Visible = false;
            SqlDataSource2.SelectCommand = "SELECT EXCURSION.Titulo,    CLIENTE.nombre,EXCURSION.p_act, convert(varchar(10), EXCURSION.Fecha, 103), EXCURSION.ID FROM CLIENTE,EXCURSION WHERE [Fecha] = '" + Calendar1.SelectedDate + "' AND CLIENTE.email = EXCURSION.Organizador ORDER BY EXCURSION.Fecha";
        }
    }
}