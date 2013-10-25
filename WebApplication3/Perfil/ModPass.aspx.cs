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
    public partial class ModPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {

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

        protected void Button2_Click(object sender, EventArgs e)
        {
            bool passOK = false;
            ENCliente user = new ENCliente();
            ArrayList a = new ArrayList();
            a = user.Obtener_Password(Session["email"].ToString());


            if (TextBoxPassActual.Text == a[0].ToString())
            {
                if (TextBoxNuevoPass.Text == TextBoxNuevoPass2.Text)
                {
                    passOK = true;
                }
                else
                {
                    LabelError.Visible = true;
                    LabelError.Text = "La Contraseña no Coincide";
                }
            }
            else
            {
                LabelError.Visible = true;
                LabelError.Text = "Contraseña Actual Incorrecta";
            }


            if (passOK==true)
            {
                user.Cambiar_pass(Session["email"].ToString(), TextBoxNuevoPass.Text);
                Panel2.Visible = false;
                Panel3.Visible = true;
                string mensaje = "Su contraseña se ha cambiado correctamente.";
                LabelOK.Text = mensaje;
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil.aspx");
        }
    }
}