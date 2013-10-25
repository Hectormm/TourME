using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace ClassLibrary2.CAD
{
    class CADExcursion
    {
        public int obtenerNuevaID()
        {
            int ID = 0;

            //Sacar la id de la última excursion y sumarle uno
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from EXCURSION order by ID DESC", c);
                da.Fill(db, "EXCURSION");
                DataTable t = new DataTable();
                t = db.Tables["EXCURSION"];
                DataRow fila = t.Rows[0];
                ID = int.Parse(fila[0].ToString())+1;
            }
            catch (Exception e)
            { }

            return ID;
        }

        public bool crearExcursion(int ID, string titulo, string ciudad, string organizador, 
            string longitud, string dificultad, int p_max, int p_act, string salida,
            string llegada, DateTime fecha, string descripcion, string imagen)
        {
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c=new SqlConnection(s);
            DataSet db = new DataSet();
            bool creada = false;

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from EXCURSION", c);
                da.Fill(db,"EXCURSION");
                DataTable t = new DataTable();
                t = db.Tables["EXCURSION"];
                DataRow nueva = t.NewRow();
                nueva[0] = ID;
                nueva[1] = titulo;
                nueva[2] = ciudad;
                nueva[3] = organizador;
                nueva[4] = longitud;
                nueva[5] = dificultad;
                nueva[6] = p_max;
                nueva[7] = p_act;
                nueva[8] = salida;
                nueva[9] = llegada;
                nueva[10] = fecha;
                nueva[11] = descripcion;
                nueva[12] = imagen;

                t.Rows.Add(nueva);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(db,"EXCURSION");
                creada = true;
            }
            catch (Exception e)
            {
                creada = false;
            }
            finally
            {
                c.Close();
            }

            return creada;
        }


        public bool guardarDatos(int ID, string titulo, string ciudad, string organizador, string longitud, string dificultad, int p_max, int p_act, string salida, string llegada, DateTime fecha, string descripcion, string imagen)
        {
            bool cambiada = false;

            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from EXCURSION where ID =" + ID.ToString(), c);
                da.Fill(db, "EXCURSION");
                DataTable t = db.Tables["EXCURSION"];
                t.Rows[0][0] = ID;
                t.Rows[0][1] = titulo;
                t.Rows[0][2] = ciudad;
                t.Rows[0][3] = organizador;
                t.Rows[0][4] = longitud;
                t.Rows[0][5] = dificultad;
                t.Rows[0][6] = p_max;
                t.Rows[0][7] = p_act;
                t.Rows[0][8] = salida;
                t.Rows[0][9] = llegada;
                t.Rows[0][10] = fecha;
                t.Rows[0][11] = descripcion;
                t.Rows[0][12] = imagen;

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(db,"EXCURSION");
                cambiada = true;
            }
            catch (Exception e)
            {
                cambiada = false;
            }
            finally
            {
                c.Close();
            }

            return cambiada;
        }

        public ArrayList recuperarDatos(int id)
        {
            ArrayList a = new ArrayList();
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from EXCURSION where ID ="+ id.ToString(), c);
                da.Fill(db, "EXCURSION");
                DataTable t = new DataTable();
                t = db.Tables["EXCURSION"];
                DataRow fila = t.Rows[0];
                
                for (int i = 1; i <= 12; i++)
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

        internal bool BorrarExcursion(string ID)
        {
            bool borrada = false;

            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from EXCURSION where ID =" + ID, c);
                da.Fill(db, "EXCURSION");
                DataTable t = new DataTable();
                t = db.Tables["EXCURSION"];
                t.Rows[0].Delete();
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(db, "EXCURSION");
                borrada = true;
            }
            catch (Exception e)
            {
            }
            finally
            {
                c.Close();
            }

            return borrada;
        }

        internal bool AnyadirUsuario(int ID, string user)
        {
            bool anyadido = false;
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from PARTICIPA", c);
                da.Fill(db, "PARTICIPA");
                DataTable t = new DataTable();
                t = db.Tables["PARTICIPA"];
                DataRow nueva = t.NewRow();
                nueva[0] = ID;
                nueva[1] = user;
                t.Rows.Add(nueva);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(db, "PARTICIPA");
                anyadido = true;
            }
            catch (Exception e)
            {
            }
            finally
            {
                c.Close();
            }

            return anyadido;
        }

        internal bool buscaParticipante(int ID, string user)
        {
            bool encontrado = false;
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();
            ArrayList a = new ArrayList();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT Excursion, Organizador FROM PARTICIPA WHERE (Organizador = '" + user + "') AND (Excursion = '" + ID + "')", c);
                da.Fill(db, "PARTICIPA");
                DataTable t = new DataTable();
                t = db.Tables["PARTICIPA"];
                for (int i = 0; i < t.Rows.Count; i++)
                    a.Add(t.Rows[i][0]);
                if (a.Count != 0)
                    encontrado = true;
            }
            catch (Exception e)
            {
            }
            finally
            {
                c.Close();
            }

            return encontrado;
        }

        internal bool quitarUsuario(int ID, string user)
        {
            bool borrado = false;
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();
            ArrayList a = new ArrayList();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT Excursion, Organizador FROM PARTICIPA WHERE (Organizador = '" + user + "') AND (Excursion = '" + ID + "')", c);
                da.Fill(db, "PARTICIPA");
                DataTable t = new DataTable();
                t = db.Tables["PARTICIPA"];
                for (int i = 0; i < t.Rows.Count; i++)
                    a.Add(t.Rows[i][0]);
                if (a.Count != 0)
                {
                    t.Rows[0].Delete();
                    SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                    da.Update(db, "PARTICIPA");
                    borrado = true;
                }
            }
            catch (Exception e)
            {
            }
            finally
            {
                c.Close();
            }

            return borrado;
        }

        internal void setActual(int ID, int p_act)
        {
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from EXCURSION where ID =" + ID.ToString(), c);
                da.Fill(db, "EXCURSION");
                DataTable t = db.Tables["EXCURSION"];
                t.Rows[0][7] = p_act;
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(db, "EXCURSION");
            }
            catch (Exception e)
            {
            }
            finally
            {
                c.Close();
            }
        }

        internal bool borrarParticipantes(int ID)
        {
            string s = "data source=.\\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\\Database1.mdf;User Instance=true";
            SqlConnection c = new SqlConnection(s);
            DataSet db = new DataSet();
            bool borrados = false;

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT Excursion, Organizador FROM PARTICIPA WHERE (Excursion = "+ID.ToString()+")", c);
                da.Fill(db, "PARTICIPA");
                DataTable t = db.Tables["PARTICIPA"];
                for(int i = 0; i< t.Rows.Count; i++)
                    t.Rows[i].Delete();
                borrados = true;
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(db, "PARTICIPA");
            }
            catch (Exception e)
            {
            }
            finally
            {
                c.Close();
            }
            return borrados;
        }
    }
}
