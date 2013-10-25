using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace TourMe
{
    public class ENCliente
    {
        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string password;
        public string Password
        {
            get { return  password; }
            set {  password = value; }
        }


        private string nombre;
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string getNombre(){ return nombre;}

        private string apellidos;
        public string Apellidos
        {
            get { return apellidos; }
            set { apellidos = value; }
        }

        private string DNI;
        public string Dni
        {
            get { return DNI; }
            set { DNI = value; }
        }

        private string direccion;
        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        private string direccion2;
        public string Direccion2
        {
            get { return direccion2; }
            set { direccion2 = value; }
        }

        private string codpostal;   
        public string Codpostal
        {
            get { return codpostal; }
            set { codpostal = value; }
        }

        private int telefono;
        public int Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }

        private DateTime fnacimiento;
        public DateTime Fnacimiento
        {
            get { return fnacimiento; }
            set { fnacimiento = value; }
        }

        public ArrayList ListarLogin()
        {
            ArrayList a = new ArrayList();
            CADCliente c = new CADCliente();
            a = c.ListarLogin();
            return a;
        } 

        public ArrayList ListarEmails()
        {
            ArrayList a = new ArrayList();
            CADCliente c = new CADCliente();
            a = c.ListarLogin();
            return a;
        }

        public void GuardarRegistro()
        {
            CADCliente c = new CADCliente();
            c.GuardarRegistro(this);
        }

        public ArrayList MostrarPerfil(string email)
        {
            ArrayList a = new ArrayList();
            CADCliente c = new CADCliente();
            a = c.MostrarPerfil(email);
            return a;
        }

        public ArrayList Listar_Nombre_Apellidos(string email)
        {
            ArrayList a = new ArrayList();
            CADCliente c = new CADCliente();
            a = c.Listar_Nombre_Apellidos(email);
            return a;
        }

        public ArrayList Obtener_Password(string email)
        {
            ArrayList a = new ArrayList();
            CADCliente c = new CADCliente();
            a = c.Obtener_Password(email);
            return a;

        }


        public bool login(string email, string pass)
        {
            bool logueado = false;
            CADCliente c = new CADCliente();
            logueado = c.login(email, pass);

            return logueado;
        }

        public void guardar(ENCliente en, string email)
        {
            CADCliente c = new CADCliente();
            c.guardar(en, email);
        }

        public void Cambiar_pass(string email, string nuevoPass)
        {
            CADCliente c = new CADCliente();
            c.Cambiar_pass(email, nuevoPass);
        }

    }
}