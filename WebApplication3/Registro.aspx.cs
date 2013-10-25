using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace TourMe
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButton1Hombre_CheckedChanged(object sender, EventArgs e)
        {
  
        }

     
        protected void Button_Registrar_Click(object sender, EventArgs e)
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
                    bool registroOK = true;
                    bool guardar = false;
                    if (TextBoxNombre.Text == "") { Label_ErrorNombre.Text = "Rellene este campo"; registroOK = false; }
                    if (TextBoxApellidos.Text == "") { Label_ErrorApellidos.Text = "Rellene este campo"; registroOK = false; }
                    if (TextBoxEmail.Text == "") { Label_ErrorEmail.Text = "Rellene este campo"; registroOK = false; }
                    if (TextBoxDireccion.Text == "") { Label_ErrorDireccion.Text = "Rellene este campo"; registroOK = false; }
                    if (TextBoxTelefono.Text == "") { Label_ErrorTelefono.Text = "Rellene este campo"; registroOK = false; }
                    if (TextBoxCP.Text == "") { Label_ErrorCP.Text = "Rellene este campo"; registroOK = false; }
                    if (TextBoxContrasenya.Text == "") { Label_ErrorContrasenya.Text = "Rellene este campo"; registroOK = false; }
                    else if (TextBoxConfirmarContrasenya.Text != TextBoxContrasenya.Text) { Label_ErrorConfirmarContrasenya.Text = "Debe ser igual la contraseña"; registroOK = false; }

                    if (registroOK)
                    {

                        ENCliente cliente = new ENCliente();
                        ArrayList a = new ArrayList();
                        a = cliente.ListarLogin();
                        foreach (string s in a)
                        {
                            if (a[0].ToString() == TextBoxEmail.Text)
                            {
                                Label_ErrorEmail.Text = "Email ya Registrado"; registroOK = false;
                            }
                            else
                            {
                                guardar = true;
                            }
                        }
                        if (guardar == true)
                        {
                            cliente.Email = TextBoxEmail.Text;
                            cliente.Password = TextBoxContrasenya.Text;
                            cliente.Nombre = TextBoxNombre.Text;
                            cliente.Apellidos = TextBoxApellidos.Text;
                            cliente.Dni = TextBoxDNI.Text;
                            cliente.Direccion = TextBoxDireccion.Text;
                            cliente.Codpostal = TextBoxCP.Text;
                            cliente.Telefono = int.Parse(TextBoxTelefono.Text);
                            DateTime fecha = Convert.ToDateTime(TextBoxAnyo.Text.ToString());
                            cliente.Fnacimiento = fecha;
                            cliente.GuardarRegistro();
                            PanelRegistro.Visible = false;
                            Boton_Aceptar.Visible = true;
                            Boton_Registrar.Visible = false;
                            Label_RegistroCorrecto.Visible = true;
                            Session.Add("email", cliente.Email);
                            Session.Timeout = 60;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
            }
        }

    }
}