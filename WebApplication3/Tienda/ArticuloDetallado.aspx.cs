using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace TourMe.Tienda
{
    public partial class DetalleProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String cod_prod = Request.QueryString["cod"];
            ENProducto prod = new ENProducto(cod_prod);

            if (prod.ExisteProducto(cod_prod))
            {
                //Devuelve una lista con todos los campos nulos si el codigo es erroneo
                ArrayList detalles = prod.ListarDetallesProducto(cod_prod);

                // Crear cantidades dropdownlist
             //   for (int i = 1; i <= prod.CalcularExistenciasProducto(); i++)
               //     DropDownListCantidad.Items.Add(i.ToString());


                // Asignar campos para el producto (la lista ordenada como las columnas)
                // Ocultar opciones de compra si no estamos logeados
                if (detalles[0].ToString() != null)
                    NReferencia.Text += detalles[0].ToString();
                else NReferencia.Visible = false;
                if (detalles[1].ToString() != null)
                    NombreFicha.Text += detalles[1].ToString();
                else NombreFicha.Visible = false;
                if (detalles[2].ToString() != null)
                    Marca.Text += detalles[2].ToString();
                else Marca.Visible = false;
                if (detalles[3].ToString() != null)
                    Modelo.Text += detalles[3].ToString();
                else Modelo.Visible = false;
                if (detalles[4].ToString() != null)
                    descripcionlabel.Text += detalles[4].ToString();
                else descripcionlabel.Visible = false;
                if (detalles[5].ToString() != null)
                    Materiales.Text += detalles[5].ToString();
                else Materiales.Visible = false;
                if (detalles[6].ToString() != null)
                    Tipo.Text += detalles[6].ToString();
                else Tipo.Visible = false;

                if (prod.ExisteProducto(cod_prod))
                    Precio.Text += prod.getPvp().ToString() + "€";
                else Precio.Visible = false;
                if (prod.ExisteProducto(cod_prod))
                    Image1.ImageUrl = "../images/Tienda/Productos/" + prod.getImagen1();
                else Image1.Visible = false;
            }
            else
                Response.Redirect("../Error.aspx");

            //Ocultar labels de compra
            ocultarOpcionesCompra();
            
        }

        private void ocultarOpcionesCompra()
        {
            String usuarioActual = null;
            ENPedido ped = new ENPedido();

            if (Session.Count != 0)
            {
                usuarioActual = Session["email"].ToString();
                if (ped.ComprobarPedido(usuarioActual) != -1)// Existe ya un pedido sin confirmar para el user actual
                    TextAreaComentario.Visible = false;
            }

            if (usuarioActual == null)
            {
                Añadiralcarrito.Visible = false;
                Label1.Visible = false;
                Label2.Visible = false;
                DropDownListCantidad.Visible = false;
                ircarritoLink.Visible = false;
                seguircompraLink.Visible = false;
                TextAreaComentario.Visible = false;
            }
            else
            {
                avisoLabel.Visible = false;
                registroLabel.Visible = false;
                registroLink.Visible = false;
                inicioLabel.Visible = false;
                inicioLink.Visible = false;
            }
        }

        protected void ircarritoLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

        protected void seguircompraLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx");//¿consulta anterior?
        }

        protected void Añadiralcarrito_Click(object sender, ImageClickEventArgs e)
        {
            ENPedido ped = new ENPedido();
            int cod_prod = int.Parse(Request.QueryString["cod"]);
            String email = Session["email"].ToString();

            int antes = ped.CalculaCantidadLineasPedido();//Cantidad lineas pedido antes de insertar
            if (email != null)
                ped.AnyadirCarrito(email,int.Parse(DropDownListCantidad.SelectedItem.Value),TextAreaComentario.Value,cod_prod);

            int ahora = ped.CalculaCantidadLineasPedido();//Cantidad lineas pedido despues de insertar
            Label1.Visible = false; // Label "Añadir al carrito"
            if (antes < ahora)//Si se ha insertado
                añadidoOkLabel.Text = "El producto ha sido añadido a la cesta";
            else
                añadidoOkLabel.Text = "No se puede añadir. Intentelo más tarde";
        }

        protected void registroLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Registro.aspx");
        }

        protected void inicioLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default/Default.aspx");
        }
    }
}