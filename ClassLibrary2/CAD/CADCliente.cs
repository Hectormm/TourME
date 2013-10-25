using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

     
namespace TourMe
{

    public class CADCliente
    {
        ArrayList lista = new ArrayList();
        string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";

        public ArrayList ListarLogin()
        {
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("Select * from CLIENTE", c);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(dr["email"].ToString());
                lista.Add(dr["password"].ToString());
            } 
            dr.Close();
            c.Close();
            return lista;
        }


        public ArrayList ListarEmails()
        {
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("Select * from CLIENTE", c);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(dr["email"].ToString());
            }
            dr.Close();
            c.Close();
            return lista;
        }

        public void GuardarRegistro(ENCliente e)
        {
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("Insert Into Cliente(email,password,nombre,apellidos,DNI,direccion,codpostal,telefono, fnacimiento)"
            + " VALUES ('" + e.Email + "','" + e.Password + "','" + e.Nombre + "','" + e.Apellidos + "','" + e.Dni + "','" + e.Direccion + "','" + e.Codpostal + "','" + e.Telefono + "','" + e.Fnacimiento + "')", c);
            com.ExecuteNonQuery();
            c.Close();
        }

        public ArrayList MostrarPerfil(string email)
        {
            
            ArrayList a = new ArrayList();
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            c.Open();
            DataSet db = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from CLIENTE where email= '" + email + "'", c);
                da.Fill(db, "CLIENTE");
                DataTable t = new DataTable();
                t = db.Tables["CLIENTE"];
                DataRow fila = t.Rows[0];
                
                for (int i = 0; i <= 8; i++)
                    a.Add(fila[i].ToString());
            }
            catch (Exception e) 
            {
            }
            finally
            {
                c.Close();
            }
            return a;
        }


        public ArrayList Listar_Nombre_Apellidos(string email)
        {
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("Select nombre, apellidos from CLIENTE where email= '" + email +"'", c);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(dr["nombre"].ToString());
                lista.Add(dr["apellidos"].ToString());
            }
            dr.Close();
            c.Close();
            return lista;
        }

        public ArrayList Obtener_Password(string email)
        {
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("Select password from CLIENTE where email= '" + email + "'", c);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(dr["password"].ToString());
            }
            dr.Close();
            c.Close();
            return lista;

        }

        internal bool login(string email, string pass)
        {
            bool logueado = false;

            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("Select email,password from CLIENTE where email= '" + email + "' and password= '"+ pass +"'", c);
            SqlDataReader dr = com.ExecuteReader();

            if(dr.Read())
                if(dr["email"].ToString().Equals(email) && dr["password"].ToString().Equals(pass))
                    logueado = true;

            dr.Close();
            c.Close();
            return logueado;
        }

        public void guardar(ENCliente en, string email)
        {

            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("Update CLIENTE set nombre= '" + en.Nombre +
                                                         "', apellidos= '" + en.Apellidos +
                                                         "', DNI= '" + en.Dni +
                                                         "', direccion= '" + en.Direccion +
                                                         "', codpostal= '" + en.Codpostal +
                                                         "', telefono= '" + en.Telefono +
                                                         "', fnacimiento= '" + en.Fnacimiento +
                                                         "' where email='" + email + "'", c);
            SqlDataReader dr = com.ExecuteReader();
            c.Close();
        }

        public void Cambiar_pass(string email, string nuevoPass)
        {
           
            SqlConnection c = new SqlConnection(s);
            c.Open();
            SqlCommand com = new SqlCommand("Update CLIENTE set password= '" + nuevoPass +
                                                         "' where email='" + email + "'", c);
            SqlDataReader dr = com.ExecuteReader();
            c.Close();
        }


    }
}