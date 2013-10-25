using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TourMe
{
    public class ENPedido
    {

        private int numpedido;
        public int Numpedido
        {
            get { return numpedido; }
            set { numpedido = value; }
        }

        private DateTime fecha;
        public DateTime Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string comentario;
        public string Comentario
        {
            get { return comentario; }
            set { comentario = value; }
        }

        public ENPedido(/*int codigoprod,int cantidad*/)
        {
            // De momento no hace falta
        }

        //
        public int CalculaCantidadPedidos()
        {
            CADPedido ped = new CADPedido();
            return ped.CalculaCantidadPedidos();
        }

        //
        public int CalculaCantidadLineasPedido()
        {
            CADPedido ped = new CADPedido();
            return ped.CalculaCantidadLineasPedido();
        }

        //
        public void CrearLineaPedido(int numped, int codigoprod, int cant)
        {
            CADPedido ped = new CADPedido();
            ped.CrearLineaPedido(numped, codigoprod, cant);
        }

        // Precio de una linea de pedido
        public decimal CalcularPrecioLineaPedido(int cod)
        {
            ENProducto prod = new ENProducto(cod.ToString());
            decimal precio;

            precio = prod.CalcularExistenciasProducto() * prod.getPvp();
            return precio;
        }

        // Devuelve el numero de pedido del usuario actual
       /** public int ObtenerNumpedidoActual(String email)
        {
            CADPedido ped = new CADPedido();
            return ped.ObtenerNumpedidoActual(email);
        }*/

        //Devuelve una lista con todas las lineas del carrito (imagen,precio,cantidad)
        public ArrayList ListarLineasPedido(int numped)
        {
            ArrayList l = new ArrayList();
            CADPedido ped = new CADPedido();
            return ped.ListarLineasPedido(numped);
        }

        //Añadir al carrito (Insertar un nuevo pedido en la bd)
        public void AnyadirCarrito(String email, int cantidad, String comentario, int codigo_producto)
        {
            if (comentario.Length > 50) // El campo comentario de la base de datos tiene 50 caracteres
                comentario = comentario.Substring(1,50);

                ENProducto prod = new ENProducto();
                if (prod.ExisteProducto(codigo_producto.ToString()))
                {
                    CADPedido ped = new CADPedido();
                    int numpedido = ComprobarPedido(email);
                    if (numpedido == -1)// Es el primer producto que añadimos a la cesta
                    {
                        numpedido = CalculaCantidadPedidos() + 1;
                        ped.AnyadirCarrito(email, comentario, codigo_producto, cantidad, numpedido);
                    }
                    else
                        ped.CrearLineaPedido(numpedido, codigo_producto, cantidad);
                }
        }

        // Devuelve el numero de pedido no confirmado, -1 si no existe
        public int ComprobarPedido(String email)
        {
            CADPedido ped = new CADPedido();
            int numped = ped.ComprobarPedido(email);

            //if (numped == -1)
             //   numped = ped.CalculaCantidadPedidos() + 1;

            return numped;
        }

        public bool BorrarProducto(int linea)
        {
            CADPedido ped = new CADPedido();
            return ped.BorrarProducto(linea);
        }

        public bool confirmarPedido(string email)
        {
            bool confirmado = false;
            CADPedido ped = new CADPedido();
            try
            {
                //ped.quitarStock(email);
                ped.confirmarPedido(email);
                confirmado = true;
            }
            catch (Exception e) { }
            return confirmado;
        }
    }
}
