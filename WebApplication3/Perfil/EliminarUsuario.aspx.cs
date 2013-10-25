using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using TourMe;

namespace ClassLibrary2.Perfil
{
    public partial class EliminarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                Panel5.Visible = false;

            }
            else
            {
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
            }
        }

        protected void ButtonEliminar_Click(object sender, EventArgs e)
        {
            ENCliente user = new ENCliente();
            string pass = user.Obtener_Password(TextBoxEmail.Text.ToString()).ToString();

            if (pass == TextBoxPass.Text)
            {
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                MailMessage message = new MailMessage();
                MailMessage contestacion = new MailMessage();


                //Enviamos un correo de confirmacion
                MailAddress fromAddress = new
                MailAddress("tourmehada@gmail.com", "TourME");
                MailAddress toAddress = new MailAddress(TextBoxEmail.Text);
                contestacion.From = fromAddress;
                contestacion.To.Add(toAddress);
                contestacion.Subject = "Eliminacion de Usuario TourMe";
                contestacion.Body = "Se va a proceder a la eliminación de su usuario en Tourme. Si Usted no ha solicitado la eliminación pongase en contacto con: Tourmehada@gmail.com";

                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new
                System.Net.NetworkCredential("tourmehada", "tourme123");
                smtpClient.Send(contestacion);

                Panel3.Visible = false;
                Panel2.Visible = false;
            }
            else
            {
                LabelError.Visible = true;
                LabelError.Text = "Error en Usuario o Contraseña";
            }
     
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Perfil/Perfil.aspx");
        }
    }
}