using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

namespace TourMe
{
    public class CADProducto
    {
        ArrayList lista = new ArrayList();

        string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";

        // Constructor
        public CADProducto()
        {
        }

        // Devuelve en una lista todos los detalles del producto pasado por parametro
        public ArrayList ListarDetallesProducto(String cod)
        {
            if (cod != null)
            {
                SqlConnection c = new SqlConnection(s);
                c.Open();
                SqlCommand com = new SqlCommand("SELECT * FROM DETALLES WHERE codigo_producto=" + cod, c);
                SqlDataReader dr = com.ExecuteReader();

                dr.Read();
                lista.Add(dr["codigo_producto"].ToString());
                lista.Add(dr["nombre"].ToString());
                lista.Add(dr["marca"].ToString());
                lista.Add(dr["modelo"].ToString());
                lista.Add(dr["descripcion"].ToString());
                lista.Add(dr["material"].ToString());
                lista.Add(dr["tipo"].ToString());


                dr.Close();
                c.Close();
            }
            return lista;
        }

        // Devuelve en una lista todos los atributos de la tabla productos de un producto
        public ArrayList ListarProducto(String cod)
        {
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM PRODUCTO WHERE codigo_producto=" + cod, c);
            SqlDataReader dr = com.ExecuteReader();

            dr.Read();
            lista.Add(dr["codigo_producto"].ToString());
            lista.Add(dr["familia"]);
            lista.Add(dr["descripcion1"].ToString());
            lista.Add(dr["descripcion2"].ToString());
            lista.Add(dr["pvp"].ToString());
            lista.Add(dr["existencias"].ToString());
            lista.Add(dr["UFVenta"].ToString());
            lista.Add(dr["imagen1"].ToString());
            lista.Add(dr["imagen2"].ToString());

            dr.Close();
            c.Close();
            return lista;
        }

        public int CalcularExistenciasProducto(String cod)
        {
            SqlConnection c = new SqlConnection(s);
            int cantidad;
            c.Open();

            SqlCommand com = new SqlCommand("SELECT existencias FROM PRODUCTO WHERE codigo_producto=" + cod, c);
            SqlDataReader dr = com.ExecuteReader();

            dr.Read();
            cantidad = int.Parse(dr["existencias"].ToString());

            dr.Close();
            c.Close();

            return cantidad;
        }

        public bool ExisteProducto(string cod)
        {
            SqlConnection c = new SqlConnection(s);
            bool existe = false;
            c.Open();

            SqlCommand com = new SqlCommand("SELECT COUNT(*) as exist FROM PRODUCTO WHERE codigo_producto=" + cod, c);
            SqlDataReader dr = com.ExecuteReader();

            dr.Read();
            if (int.Parse(dr["exist"].ToString()) == 1)// Encuentra producto
                existe = true;

            dr.Close();
            c.Close();
            return existe;
        }
    }
}
