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
	public partial class ModPerfil : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (Session.Count != 0)
            {
                ENCliente cliente = new ENCliente();
                ArrayList a = new ArrayList();
                a = cliente.MostrarPerfil(Session["email"].ToString());
                foreach (string s in a)
                {
                    TextBoxNombre.Text = a[2].ToString();
                    TextBoxApellido.Text = a[3].ToString();
                    TextBoxDNI.Text = a[4].ToString();
                    TextBoxDireccion.Text = a[5].ToString();
                    TextBoxCP.Text = a[6].ToString();      
                    TextBoxTelefono.Text = a[7].ToString();
                    TextBoxFNacimiento.Text = a[8].ToString().Remove(10);
                }

            }
            else
            {
                Response.Redirect("Perfil.aspx");
            }

		}

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil.aspx");
        }

        protected void Inicializar(object sender, EventArgs e)
        {
            TextBoxNombre2.Text = "";
            TextBoxApellidos2.Text = "";
            TextBoxDNI2.Text = "";
            TextBoxDireccion2.Text = "";
            TextBoxCP2.Text = "";
            TextBoxTelefono2.Text = "";
            TextBoxFNacimiento2.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ENCliente mod = new ENCliente();

            if (TextBoxNombre2.Text.Length != 0 )
                mod.Nombre = TextBoxNombre2.Text;
            else
                mod.Nombre = TextBoxNombre.Text;

            if (TextBoxApellidos2.Text.Length != 0)
                mod.Apellidos = TextBoxApellidos2.Text;
            else
                mod.Apellidos = TextBoxApellido.Text;

            if (TextBoxDNI2.Text.Length != 0)
                mod.Dni = TextBoxDNI2.Text;
            else
                mod.Dni = TextBoxDNI.Text;

            if (TextBoxDireccion2.Text.Length != 0)
                mod.Direccion = TextBoxDireccion2.Text;
            else
                mod.Direccion = TextBoxDireccion.Text;

            if (TextBoxCP2.Text.Length != 0)
                mod.Codpostal = TextBoxCP2.Text;
            else
                mod.Codpostal = TextBoxCP.Text;

            if (TextBoxTelefono2.Text.Length != 0)
                mod.Telefono = int.Parse(TextBoxTelefono2.Text);
            else
                mod.Telefono = int.Parse(TextBoxTelefono.Text);


            if (TextBoxFNacimiento2.Text.Length != 0)
            {
                DateTime fecha = Convert.ToDateTime(TextBoxFNacimiento2.Text.ToString());
                mod.Fnacimiento = fecha;
            }
            else
            {
                DateTime fecha = Convert.ToDateTime(TextBoxFNacimiento.Text.ToString());
                mod.Fnacimiento = fecha;
            }

            mod.guardar(mod, Session["email"].ToString());
            Inicializar(sender, e);
            Page_Load(sender, e);
        }
	}
}