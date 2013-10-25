using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;

namespace TourMe
{
    public partial class ProductosTienda : System.Web.UI.Page
    {
        //Familia actual
        String familia;

        protected void Page_Load(object sender, EventArgs e)
        {
            familia = Request.QueryString["par"];
            ENProducto prod = new ENProducto();            

            //Establecer la consulta a la base de datos
            SqlDataSource1.SelectCommand = prod.SeleccionarConsulta(familia);
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();

            //Resaltar el link de la familia en la que estamos
           // String link = familia + "Link";

            // Configurar el site map
            if (familia == null)
                SiteMapLabel.Text = "Todos los artículos";
            else if (familia == "Tiendas")
                SiteMapLabel.Text = "Tiendas de campaña";
            else
                SiteMapLabel.Text = familia;
        }

        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode(BuscarBox.Text));
        }

        protected void CalzadoLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Calzado"));
        }

        protected void CamisetasLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Camisetas"));
        }

        protected void PantalonesLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Pantalones"));
        }

        protected void MochilasLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Mochilas"));
        }

        protected void BastonesLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Bastones"));
        }

        protected void AccesoriosLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Accesorios"));
        }

        protected void GuantesLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Guantes"));
        }

        protected void CantimplorasLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Cantimploras"));
        }

        protected void GorrosLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Gorros"));
        }

        protected void AbrigosLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Abrigos"));
        }

        protected void TiendasLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?par=" + Server.UrlEncode("Tiendas"));
        }

        protected void alCarritoLink_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

    }
}