using System;
using System.Net.Mail;
using TourMe;

namespace ClassLibrary2.Perfil
{
    public partial class Recuperacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonRecuperar_Click1(object sender, EventArgs e)
        {
            try
            {
                ccJoin.ValidateCaptcha(TextBoxCaptcha.Text);
                if (!ccJoin.UserValidated)
                {
                    //Inform user that his input was wrong ...
                    return;
                }
                else
                {
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                    MailMessage message = new MailMessage();
                    MailMessage contestacion = new MailMessage();

                    ENCliente user = new ENCliente();
                    string pass = user.Obtener_Password(TextBoxEmail.Text.ToString()).ToString();
                    //Enviamos un correo de confirmacion
                    MailAddress fromAddress = new
                    MailAddress("tourmehada@gmail.com", "TourME");
                    MailAddress toAddress = new MailAddress(TextBoxEmail.Text);
                    contestacion.From = fromAddress;
                    contestacion.To.Add(toAddress);
                    contestacion.Subject = "Recuperacion de contraseña";
                    contestacion.Body = "Su contraseña es " + pass;

                    smtpClient.EnableSsl = true;
                    smtpClient.Credentials = new
                    System.Net.NetworkCredential("tourmehada", "tourme123");
                    smtpClient.Send(contestacion);

                    Panel3.Visible = false;
                    Panel2.Visible = true;

                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
            }
        }
    }
}