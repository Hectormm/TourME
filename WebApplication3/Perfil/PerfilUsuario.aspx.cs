using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TourMe;
using System.Collections;

namespace ClassLibrary2.Perfil
{
    public partial class PerfilExterno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session.Count != 0)
            {
                Panel3.Visible = false;
                string usuario = Request.QueryString["user"];
                if (usuario == null || Session["email"].ToString()==usuario)
                    Response.Redirect("Perfil.aspx");

                ENCliente en = new ENCliente();
                ArrayList a = new ArrayList();
                a = en.MostrarPerfil(usuario);
                foreach (string s in a)
                {
                    LabelNombre.Text = a[2].ToString();
                    LabelApellidos.Text = a[3].ToString();
                    LabelEmail.Text = a[0].ToString();
                }
                SqlDataSource1.SelectCommand = "SELECT EXCURSION.ID, convert(varchar(10), EXCURSION.Fecha, 103), EXCURSION.Titulo, EXCURSION.Ciudad FROM CLIENTE INNER JOIN PARTICIPA ON CLIENTE.email = PARTICIPA.Organizador INNER JOIN EXCURSION ON PARTICIPA.Excursion = EXCURSION.ID WHERE (CLIENTE.email = '" + usuario + "')";
            }
            else
            {
                string registro = "Si no estás registrado. Registrate ";
                string logeado = "Si estás registrado Inicia Sesión ";
                Panel2.Visible = false;
                LabelNoRegistrado.Text = registro;
                LabelNoLogeado.Text = logeado;
                
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID = GridView1.SelectedValue.ToString();
            Response.Redirect("../Excursiones/Excursion.aspx?ID=" + Server.UrlEncode(ID));
        }
    }
}