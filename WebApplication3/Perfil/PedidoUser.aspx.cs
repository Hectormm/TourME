using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClassLibrary2.Perfil
{
    public partial class PedidoUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                string id = Request.QueryString["ID"];
                string email = Session["email"].ToString();

                SqlDataSource1.SelectCommand = "SELECT DETALLES.nombre, LINPED.cantidad, DETALLES.marca, DETALLES.modelo, LINPED.precio FROM DETALLES INNER JOIN LINPED ON DETALLES.codigo_producto = LINPED.codigo_producto INNER JOIN PEDIDO ON LINPED.numpedido = PEDIDO.numpedido INNER JOIN PRODUCTO ON DETALLES.codigo_producto = PRODUCTO.codigo_producto AND LINPED.codigo_producto = PRODUCTO.codigo_producto WHERE PEDIDO.numpedido='" + id + "'";

            }
            else
            {
                Response.Redirect("../Default/Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Perfil/Perfil.aspx");
        }
    }
}
