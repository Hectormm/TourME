using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace TourMe
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session.Count != 0)
            {
                Panel2.Visible = false;
                ENCliente cliente = new ENCliente();
                ArrayList a = new ArrayList();
                a = cliente.MostrarPerfil(Session["email"].ToString());
                foreach (string s in a)
                {
                    LabelNombre2.Text = a[2].ToString();
                    LabelApellidos2.Text = a[3].ToString();
                    LabelEmail2.Text = a[0].ToString();
                    LabelDireccion2.Text = a[5].ToString();
                    LabelCodigoPostal2.Text = a[6].ToString();
                    LabelDNI2.Text = a[4].ToString();
                    LabelTelefono2.Text = a[7].ToString();
                    LabelFNacimiento2.Text = a[8].ToString().Remove(10);
                }
                SqlDataSource1.SelectCommand = "SELECT EXCURSION.ID,  convert(varchar(10), EXCURSION.Fecha, 103) , EXCURSION.Titulo, EXCURSION.Ciudad FROM CLIENTE INNER JOIN PARTICIPA ON CLIENTE.email = PARTICIPA.Organizador INNER JOIN EXCURSION ON PARTICIPA.Excursion = EXCURSION.ID WHERE (CLIENTE.email = '" + LabelEmail2.Text.ToString() + "')";
                SqlDataSource2.SelectCommand = "SELECT NUMPEDIDO, FECHA, EMAIL, COMENTARIO, CONFIRMADO FROM PEDIDO WHERE CONFIRMADO = '1' AND EMAIL ='" + Session["email"].ToString() + "'";
            } 
            else
            {
                string registro = "Si no estás registrado. Registrate ";
                string logeado = "Si estás registrado Inicia Sesión "; 
                Panel1.Visible = false;
                LabelNoRegistrado.Text = registro;
                LabelNoLogeado.Text = logeado;
                
            }

        }

        protected void ButtonEliminarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarUsuario.aspx");
        }

        protected void ButtonModificarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModPerfil.aspx");
        }

        protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string ID = GridView2.SelectedValue.ToString();
            Response.Redirect("../Excursiones/Excursion.aspx?ID=" + Server.UrlEncode(ID));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModPass.aspx");
        }



        protected void GridView3_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string ID = GridView3.SelectedValue.ToString();
            Response.Redirect("../Perfil/PedidoUser.aspx?ID=" + Server.UrlEncode(ID));
        }

    }
}