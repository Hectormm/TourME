using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace TourMe
{
    public class ENProducto
    {
        // Atributos privados
        private int codigo_producto;
        private string familia;
        private string descripcion1;
        private string descripcion2;
        private decimal pvp;
        private string ufventa;
        private string imagen1;
        private string imagen2;
        private string existencias;

        // Getters/Setters
        public int getCodigoProducto() { return codigo_producto; }
        public void setCodigoProducto(int cod) { codigo_producto = cod; }

        public string getFamilia() { return familia; }
        public void setFamilia(string fam) { familia = fam; }

        public string getDescripcion1() { return descripcion1; }
        public void setDescripcion1(string des) { descripcion1 = des; }

        public string getDescripcion2() { return descripcion2; }
        public void setDescripcion2(string des) { descripcion2 = des; }

        public decimal getPvp() { return pvp; }
        public void setPvp(decimal p) { pvp = p; }

        public string getUFVenta() { return ufventa; }
        public void setUFVenta(string ufv) { ufventa = ufv; }

        public string getImagen1() { return imagen1; }
        public void setImagen1(string img) { imagen1 = img; }

        public string getImagen2() { return imagen2; }
        public void setImagen2(string img) { imagen2 = img; }

        public string getExistencias() { return existencias; }
        public void setExistencias(string ex) { existencias = ex; }

        //Constructor por defecto
        public ENProducto()
        {
            //Cuidado cuidado!!
        }

        //Constructor pasando codigo producto
        public ENProducto(String cod)
        {
            if (ExisteProducto(cod))
            {
                CADProducto c = new CADProducto();
                ArrayList lista = c.ListarProducto(cod);

                setCodigoProducto(int.Parse(lista[0].ToString()));
                setFamilia(lista[1].ToString());
                setDescripcion1(lista[2].ToString());
                setDescripcion2(lista[3].ToString());
                setPvp(decimal.Parse(lista[4].ToString()));
                setExistencias(lista[5].ToString());
                setUFVenta(lista[6].ToString());
                setImagen1(lista[7].ToString());
                setImagen2(lista[8].ToString());
            }
        }

        //
        public ArrayList ListarDetallesProducto(String cod)
        {
            if (ExisteProducto(cod))
            {
                ArrayList a = new ArrayList();
                CADProducto c = new CADProducto();
                a = c.ListarDetallesProducto(cod);
                return a;
            }

            // Valores por defecto
            ArrayList b = new ArrayList();
            for (int j = 0; j < 7; j++)//7 por la cantidad de columnas en detalles
                b.Add(null);

            return b;
        }

        //
        public ArrayList ListarProducto(String cod)
        {
            if (ExisteProducto(cod))
            {
                ArrayList a = new ArrayList();
                CADProducto c = new CADProducto();
                a = c.ListarProducto(cod);
                return a;
            }

            // Valores por defecto
            ArrayList b = new ArrayList();
            for (int j = 0; j < 7; j++)//7 por la cantidad de columnas en detalles
                b.Add(null);

            return b;
        }

        //
        public int CalcularExistenciasProducto()
        {
            if (ExisteProducto(codigo_producto.ToString()))
            {
                CADProducto prod = new CADProducto();
                return prod.CalcularExistenciasProducto(codigo_producto.ToString());
            }
            return -1;//CUIDADORRRLL
        }

        // Devuelve si existe el producto pasado por parametro
        public bool ExisteProducto(string cod)
        {
            CADProducto prod = new CADProducto();
            return prod.ExisteProducto(cod);
        }

        //Devuelve la consulta a la base de datos
        public string SeleccionarConsulta(string param)
        {
            string comando = "";

            //Seleccionar la consulta
            if (param == null)//Todos los productos (no es de ninguna familia)
                comando = "SELECT * FROM PRODUCTO";
            else if (param == "Calzado")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'CAL'";
            else if (param == "Camisetas")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'CAM'";
            else if (param == "Pantalones")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'PAN'";
            else if (param == "Mochilas")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'MOC'";
            else if (param == "Bastones")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'BAS'";
            else if (param == "Accesorios")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'ACC'";
            else if (param == "Abrigos")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'ABR'";
            else if (param == "Cantimploras")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'CAN'";
            else if (param == "Gorros")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'GOR'";
            else if (param == "Guantes")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'GUA'";
            else if (param == "Tiendas")
                comando = "SELECT * FROM PRODUCTO WHERE familia LIKE 'TCAM'";
            else//Busqueda por palabra
                comando = "SELECT * FROM PRODUCTO WHERE descripcion1 LIKE '%" + param
                            + "%' OR descripcion2 LIKE '%" + param + "%'";

            return comando;
        }
    }
}