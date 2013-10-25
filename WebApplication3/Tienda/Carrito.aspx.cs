using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using TourMe;
using System.Collections;
using System.Net.Mail;

namespace ClassLibrary2.Tienda
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                ENCliente cl = new ENCliente();
                ArrayList a = new ArrayList();
                SqlDataSource1.SelectCommand = "SELECT PRODUCTO.imagen1,DETALLES.nombre, LINPED.cantidad, LINPED.precio, LINPED.codigo_producto, LINPED.linea, LINPED.numpedido FROM LINPED INNER JOIN PEDIDO ON LINPED.numpedido = PEDIDO.numpedido INNER JOIN DETALLES ON LINPED.codigo_producto = DETALLES.codigo_producto INNER JOIN PRODUCTO ON LINPED.codigo_producto = PRODUCTO.codigo_producto AND DETALLES.codigo_producto = PRODUCTO.codigo_producto  AND PEDIDO.confirmado = 0  WHERE (PEDIDO.email = '" + Session["email"].ToString() + "')";
                a = cl.MostrarPerfil(Session["email"].ToString());
                string nombre = a[2].ToString();
                string apellidos = a[3].ToString();
                string dir = a[5].ToString();
                string cp = a[6].ToString();

                LabelN.Text = nombre + " " + apellidos;
                LabelD.Text = dir;
                LabelCP.Text = cp;

                int productos = GridView1.Rows.Count;
                float total = 0;
                for (int i = 1; i < GridView1.Rows.Count; i++)
                {
                    int m = int.Parse(GridView1.Rows[i].Cells[1].Text);
                    float n = float.Parse(GridView1.Rows[i].Cells[2].Text);
                    total += m * n;
                }
                PrecioTotal.Text = total.ToString();
                ProductoTotal.Text = productos.ToString();
            }
            else
            {
                PCarrito.Visible = false;
                PanelNoLog.Visible = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ENPedido pedido = new ENPedido();
            //int codProducto = int.Parse(GridView1.SelectedRow.Cells[3].ToString());

           /* int codProducto = 0;
            int.TryParse(GridView1.SelectedRow.Cells[3].Text, out codProducto);

            int linea = 0;
            int.TryParse(GridView1.SelectedRow.Cells[4].Text, out linea);

            int num = 0;
            int.TryParse(GridView1.SelectedRow.Cells[5].Text, out num);*/

            int linea = int.Parse(GridView1.SelectedValue.ToString());

            if (pedido.BorrarProducto(linea)) 
            {
                Response.Redirect("Carrito.aspx");      
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ENPedido ped = new ENPedido();
            //int linea = int.Parse(GridView1.SelectedRow.Cells[4].ToString());
            //try
            //{

            string email = Session["email"].ToString();
            
            if(ped.confirmarPedido(email))
            {
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                MailMessage message = new MailMessage();
                MailMessage contestacion = new MailMessage();

                ENCliente user = new ENCliente();
                //Enviamos un correo de confirmacion
                MailAddress fromAddress = new
                MailAddress("tourmehada@gmail.com", "TourME");
                MailAddress toAddress = new MailAddress(email);
                contestacion.From = fromAddress;
                contestacion.To.Add(toAddress);
                contestacion.Subject = "Confirmación de su Pedido en Tourme";
                contestacion.Body = "Su pedido ha sido confirmado, con la máxima brevedad se procederá a su envio";

                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new
                System.Net.NetworkCredential("tourmehada", "tourme123");
                smtpClient.Send(contestacion);

                Response.Redirect("Tienda.aspx");
            }
   
           // int num = int.Parse(GridView1.SelectedRow.Cells[5].ToString());
            //ped.confirmarPedido(linea, num);




        }
    }
}