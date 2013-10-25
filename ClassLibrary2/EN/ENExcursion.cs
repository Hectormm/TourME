using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary2.CAD;
using System.Collections;

namespace ClassLibrary2.EN
{
    public class ENExcursion
    {
        public ENExcursion() 
        { 
            CADExcursion ex = new CADExcursion();

            titulo = ciudad = organizador = longitud = dificultad = salida = llegada = "";
            fecha = new DateTime();
            p_max = p_act = 0;
            ID = ex.obtenerNuevaID();
            //ex.crearExcursion(ID, titulo, ciudad, organizador, longitud, dificultad, p_max, p_act, salida, llegada, fecha,imgurl,descripcion);
        }

        public string getTitulo() { return titulo; }
        public string getCiudad() { return ciudad; }
        public string getOrganizador() { return organizador; }
        public string getLongitud() { return longitud; }
        public string getDificultad() { return dificultad; }
        public string getSalida() { return salida; }
        public string getLlegada() { return llegada; }
        public DateTime getFecha() { return fecha; }
        public string getImagen() { return imgurl; }
        public string getDescripcion() { return descripcion; }
        public int getID() { return ID; }
        public int getMax() { return p_max; }
        public int getActual() { return p_act; }

        public void setTitulo(string t) { titulo = t; }
        public void setCiudad(string t) { ciudad = t; }
        public void setOrganizador(string t) { organizador = t; }
        public void setLongitud(string t) { longitud = t; }
        public void setDificultad(string t) { dificultad = t; }
        public void setSalida(string t) { salida= t; }
        public void setLlegada(string t) { llegada = t; }
        public void setFecha(DateTime t) { fecha = t; }
        public void setMax(int m) { p_max = m; }
        public void setActual(int a) 
        { 
            p_act = a;
            CADExcursion ex = new CADExcursion();
            ex.setActual(ID,p_act);
        }
        public void setID(int ID){ this.ID = ID; }
        public void setDescripcion(string desc) { descripcion = desc; }
        public void setImagen(string url) { imgurl = url; }

        public bool crearExcursion()
        {
            CADExcursion ex = new CADExcursion();
            p_act++;
            return ex.crearExcursion(ID, titulo, ciudad, organizador, longitud, dificultad, p_max, p_act, salida, llegada, fecha,descripcion,imgurl);
        }

        public bool guardarDatos()
        {
            CADExcursion ex = new CADExcursion();
            return ex.guardarDatos(ID, titulo, ciudad, organizador, longitud, dificultad, p_max, p_act, salida, llegada, fecha, descripcion, imgurl);
        }

        public void recuperarDatos(int id)
        {
            ID = id;
            ArrayList a;
            CADExcursion ex = new CADExcursion();

            a = ex.recuperarDatos(id);

            if (a.Count != 0)
            {
                titulo = a[0].ToString();
                ciudad = a[1].ToString();
                organizador = a[2].ToString();
                longitud = a[3].ToString();
                dificultad = a[4].ToString();
                p_max = int.Parse(a[5].ToString());
                p_act = int.Parse(a[6].ToString());
                salida = a[7].ToString();
                llegada = a[8].ToString();
                string aux = "";
                for (int i = 0; i < 10; i++)
                    aux += a[9].ToString()[i];
                string dia = aux[0].ToString()+aux[1].ToString();
                string mes = aux[3].ToString() + aux[4].ToString();
                string anyo = aux[6].ToString() + aux[7].ToString() + aux[8].ToString() + aux[9].ToString();
                fecha = new DateTime(int.Parse(anyo), int.Parse(mes), int.Parse(dia));
                descripcion = a[10].ToString();
                imgurl = "~/images/";
                imgurl += a[11].ToString();
            }
            else
            { 
                //Error //TODO Devolver booleano y comprobar fuera.
            }
            
        }

        public bool BorrarExcursion()
        {
            CADExcursion e = new CADExcursion();
            if (e.borrarParticipantes(ID))
                return e.BorrarExcursion(ID.ToString());
            else
                return false;
        }

        public bool AnyadirUsuario(string user)
        {   
            CADExcursion cl = new CADExcursion();
            bool anyadido = false;
            p_act++;
            if (p_act <= p_max)
            {
                anyadido = cl.AnyadirUsuario(ID, user);
                cl.setActual(ID, p_act);
            } 
            else p_act--;

            return anyadido;
        }

        public bool buscaParticipante(string user)
        {
            CADExcursion ex = new CADExcursion();
            return ex.buscaParticipante(ID, user);
        }

        public bool quitarUsuario(string user)
        {
            bool quitado = false;
            CADExcursion ex = new CADExcursion();
            p_act--;
            if (p_act >= 1)
            {
                quitado = ex.quitarUsuario(ID, user);
                ex.setActual(ID, p_act);
            }
            else p_act++;
            return quitado;
        }

        private string titulo, ciudad, organizador, longitud, dificultad, salida, llegada;
        private string descripcion, imgurl;
        private int p_max,p_act, ID;
        private DateTime fecha;
    }
}
