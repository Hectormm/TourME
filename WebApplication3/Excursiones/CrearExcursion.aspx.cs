using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using ClassLibrary2.EN;

namespace TourMe.Excursiones
{
    public partial class CrearExcursion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                ENCliente cl = new ENCliente();
                string organizador = "";
                foreach (string s in cl.Listar_Nombre_Apellidos(Session["email"].ToString()))
                    organizador += s + " ";
                LabelOrganizador.Text = organizador;
            }
            else
            {
                CreaExcursion.Visible = false;
                PanelNoLog.Visible = true;
            }
        }

        private bool compruebaCampos(ENExcursion e)
        {
            bool correcto = true;
            if (e.getDescripcion() == "")
            {
                ErrorDesc.Visible = true;
                correcto = false;
            }
            if (DateTime.Compare(e.getFecha(), DateTime.Today) == -1)
            {
                ErrorFecha.Visible = true;
                correcto = false;
            }
            if (e.getMax() < 1)
            {
                ErrorMax.Visible = true;
                correcto = false;
            }
            if (e.getSalida() == "")
            {
                ErrorSalida.Visible = true;
                correcto = false;
            }
            if (e.getTitulo() == "")
            {
                ErrorTitulo.Visible = true;
                correcto = false;
            }
            if (TBLong.Text == "")
            {
                ErrorLongitud.Visible = true;
                correcto = false;
            }
            return correcto;
        }

        public void Crear(object sender, EventArgs e)
        {
            
            ENExcursion ex = new ENExcursion();
            ex.setTitulo(TBTitulo.Text);
            ex.setCiudad(TBCiudad.Text);
            ex.setOrganizador(Session["email"].ToString());
            string longitud = TBLong.Text +" " + DDLDist.SelectedItem.ToString();
            ex.setLongitud(longitud);
            ex.setDificultad(DDLDiff.SelectedItem.ToString());
            if (TBPersMax.Text != "")
                ex.setMax(int.Parse(TBPersMax.Text));
            else ex.setMax(-1);
            ex.setSalida(TBSalida.Text);
            ex.setLlegada(TBLlegada.Text);
            DateTime fecha = new DateTime(int.Parse(DDLAnyo.SelectedItem.ToString()),
                                          int.Parse(DDLMes.SelectedItem.ToString()),
                                          int.Parse(DDLDia.SelectedItem.ToString()));
            ex.setFecha(fecha);
            ex.setDescripcion(TBDesc.Text);
            string url = "";
            if (FUImagen.HasFile)
            {
                string tipo = FUImagen.PostedFile.ContentType;
                if (tipo.Equals("image/bmp") || tipo.Equals("image/x-png") || tipo.Equals("image/gif") || tipo.Equals("image/pjpeg") || tipo.Equals("image/bmp"))
                {
                    url = SaveFile(FUImagen.PostedFile);
                }
                else
                {
                    url = "senderismo.jpg";
                }
            }
            else
            {
                url = "senderismo.jpg";
            }
            ex.setImagen(url);

            if (compruebaCampos(ex))
            {
                if (ex.crearExcursion())
                {
                    CreaExcursion.Visible = false;
                    ExcursionCreada.Visible = true;
                }
                else
                {
                    CreaExcursion.Visible = false;
                    CreaFallida.Visible = true;
                }
            }

        }

        string SaveFile(HttpPostedFile file)
        {
            string savePath = Server.MapPath("~/images/");
            string fileName = FUImagen.FileName;
            string pathToCheck = savePath + fileName;
            string tempfileName = "";
            if (System.IO.File.Exists(pathToCheck))
            {
                int counter = 2;
                while (System.IO.File.Exists(pathToCheck))
                {
                    tempfileName = counter.ToString() + fileName;
                    pathToCheck = savePath + tempfileName;
                    counter++;
                }

                fileName = tempfileName;
            }
            savePath += fileName;
            FUImagen.SaveAs(savePath);
            return fileName;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Excursiones.aspx");
        }

        protected void AceptarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Excursiones.aspx");
        }
    }
}