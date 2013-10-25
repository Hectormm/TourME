using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Globalization;

namespace TourMe
{
    public class CADPedido
    {
        string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";

        public int CalculaCantidadPedidos()
        {
            int total;
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("SELECT COUNT(*) AS num FROM PEDIDO", c);
            SqlDataReader dr = com.ExecuteReader();

            dr.Read();
            total = int.Parse(dr["num"].ToString());
            dr.Close();
            c.Close();
            return total;
        }

        public int CalculaCantidadLineasPedido()
        {
            int total;
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("SELECT MAX(LINEA) AS num FROM LINPED", c);
            SqlDataReader dr = com.ExecuteReader();

            dr.Read();
            total = int.Parse(dr["num"].ToString());
            dr.Close();
            c.Close();
            return total;
        }

        public void CrearLineaPedido(int numpedido, int codigo_producto, int cantidad)
        {
            NumberFormatInfo nfi = new CultureInfo("es-ES", true).NumberFormat;
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com;
            ENProducto enprod = new ENProducto(codigo_producto.ToString());//Datos de ese producto
            int linea = CalculaCantidadLineasPedido() + 1;
            decimal pvp = enprod.getPvp();
            string pvp2 = pvp.ToString("F02",CultureInfo.InvariantCulture);

        
            com = new SqlCommand("INSERT INTO linped(linea,precio,cantidad,numpedido,codigo_producto)"
                            + "VALUES ('" + linea + "','" + pvp2 + "','" + cantidad + "','" + numpedido + "','" + codigo_producto + "')", c);
            com.ExecuteNonQuery();
            c.Close();
        }

        //
        public void AnyadirCarrito(String email, String coment, int codigo_producto, int cantidad, int numped)
        {
                
            SqlConnection c = new SqlConnection(s);
            ENPedido ped = new ENPedido();
            c.Open();

            SqlCommand com = new SqlCommand("INSERT INTO pedido(numpedido,fecha,email,comentario,confirmado)"
                                                + " VALUES ('" + numped + "','" + DateTime.UtcNow + "','" + email + "','" + coment + "','" + /*confirmado true/false*/0 + "')", c);
            com.ExecuteNonQuery();
            c.Close();

            ped.CrearLineaPedido(numped, codigo_producto, cantidad);
        }

        // Devuelve el numero de pedido del usuario actual ( Lo que tiene en la cesta )
       /* public int ObtenerNumpedidoActual(String email)
        {
            int numpedido;
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("SELECT numpedido FROM PEDIDO WHERE (email = '" + email + "') AND (confirmado = 0)", c);
            SqlDataReader dr = com.ExecuteReader();

            dr.Read();
            numpedido = int.Parse(dr["numpedido"].ToString());
            dr.Close();
            c.Close();
            return numpedido;
        }*/

        //Dado un numero de pedido devuelve una lista con las lineas del carrito (imagen, precio, cantidad)
        public ArrayList ListarLineasPedido(int numped)
        {
            ArrayList l = new ArrayList();
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com1 = new SqlCommand("SELECT PRODUCTO.imagen1 as img,precio,cantidad FROM LINPED,PRODUCTO WHERE (numpedido = '" + numped +
                                            "' and (PRODUCTO.codigo_producto = LINPED.codigo_producto", c);
            SqlDataReader dr = com1.ExecuteReader();

            while (dr.Read())
            {
                l.Add(dr["img"].ToString());
                l.Add(dr["precio"].ToString());
                l.Add(dr["cantidad"].ToString());
            }

            dr.Close();
            c.Close();
            return l;
        }

        public bool ExistePedido(int numped)
        {
            bool existe = false;
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com1 = new SqlCommand("SELECT COUNT(*) as exist FROM PEDIDO WHERE numpedido='"+numped+"'", c);
            SqlDataReader dr = com1.ExecuteReader();

            dr.Read();
            if (int.Parse(dr["exist"].ToString()) == 1)
                existe = true;

            dr.Close();
            c.Close();
            return existe;
        }

        // Devuelve el numero de pedido no confirmado, -1 si no existe
        public int ComprobarPedido(String email)
        {
            int result = -1;
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com1 = new SqlCommand("SELECT numpedido FROM PEDIDO WHERE email='"+email+"' and confirmado=0", c);
            SqlDataReader dr = com1.ExecuteReader();
            
            dr.Read();

            if (dr.HasRows)
                result = int.Parse(dr["numpedido"].ToString());

            dr.Close();
            c.Close();
            return result;
        }

        internal bool BorrarProducto(int linea)
        {
            //borra el prodcuto codproducto perteneciente a la linea y num
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com1 = new SqlCommand("DELETE FROM LINPED WHERE linea='" + linea + "'", c);
            SqlDataReader dr = com1.ExecuteReader();

            c.Close();

            return true;
        }

        internal void quitarStock(string email)
        {
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com1 = new SqlCommand("SELECT CANTIDAD, CODIGO_PRODUCTO FROM LINPED, PEDIDO WHERE EMAIL='" + email + "' AND CONFIRMADO=0 AND PEDIDO.NUMPEDIDO = LINPED.NUMPEDIDO", c);
            SqlDataReader dr = com1.ExecuteReader();
            while (dr.Read())
            {
                SqlCommand com2 = new SqlCommand("UPDATE PRODUCTO SET EXISTENCIAS=EXISTENCIAS - '" + dr["CANTIDAD"].ToString() + "' WHERE CODIGO_PRODUCTO='" + dr["CODIGO_PRODUCTO"].ToString() + "'", c);
                SqlDataReader dr2 = com2.ExecuteReader();
                dr2.Close();
            }

            c.Close();


        }

        internal bool confirmarPedido(string email)
        {
            //poner campo confirmado a 1
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com1 = new SqlCommand("UPDATE PEDIDO SET confirmado = 1  WHERE email='" + email + "'", c);
            SqlDataReader dr = com1.ExecuteReader();

            c.Close();

            return true;
        }
    }
}
