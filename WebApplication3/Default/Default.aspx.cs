using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace TourMe.Default
{
    public partial class Default2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                TextBoxEmail.Visible = false;
                TextBoxPassword.Visible = false;
                ButtonEntrar.Visible = false;
                ButtonLogout.Visible = true;
                HyperLinkPerfil.Visible = true; ;
                HyperLink3.Visible = false;
                Label6.Visible = false;
                HyperLink2.Visible = false;
                ENCliente cl = new ENCliente();
                string usuario = "";
                foreach(string s in cl.Listar_Nombre_Apellidos(Session["email"].ToString()))
                    usuario += s + " ";

                HyperLinkPerfil.Text = usuario;
                LabelUsuario.Text = "Bienvenido ";
            }
  
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ENCliente cliente = new ENCliente();
            ArrayList a = new ArrayList();
            a = cliente.ListarLogin();
            
            if(cliente.login(TextBoxEmail.Text,TextBoxPassword.Text))
            {
                TextBoxEmail.Visible = false;
                TextBoxPassword.Visible = false;
                ButtonEntrar.Visible = false;
                ButtonLogout.Visible = true;
                HyperLinkPerfil.Visible = true;
                HyperLink3.Visible = false;
                Label6.Visible = false;
                HyperLink2.Visible = false;
                ENCliente cl = new ENCliente();
                string usuario = "";
                foreach (string s in cl.Listar_Nombre_Apellidos(TextBoxEmail.Text))
                    usuario += s + " ";

                HyperLinkPerfil.Text = usuario;
                LabelUsuario.Text = "Bienvenido ";

                Session.Add("email", TextBoxEmail.Text);
                Session.Timeout = 60;
                
            }
            else
            {
                LabelErrorLogin.Visible = true;
                LabelErrorLogin.Text = "USUARIO O CONTRASEÑA ERRONEA";
            }
        }
        protected void ButtonLogout_Click(object sender, EventArgs e) 
        {
            if(Session.Count != 0)
                Session.Abandon();
            Response.Redirect("Default.aspx");
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID = GridView2.SelectedValue.ToString();
            Response.Redirect("../Excursiones/Excursion.aspx?ID=" + Server.UrlEncode(ID));
        }
    }
}
