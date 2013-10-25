using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary2.EN;

namespace TourMe.Excursion
{
    public partial class Modificar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Si el usuario esta logeado se le permite seguir
            if (Session.Count != 0)
            {
                //Se obtiene la ID de la excursion
                string ID = Request.QueryString["ID"];
                //Se comprueba si es correcta
                if (ID != "" && ID != null)
                {
                    //Se obtienen los datos de la BD
                    ENExcursion ex = new ENExcursion();
                    ex.recuperarDatos(int.Parse(ID));
                    //Si el usuario es el organizador se le permite seguir
                    if (Session["email"].ToString().Equals(ex.getOrganizador()))
                    {
                        string unidad = "", organizador = "", longitud = "";

                        ENCliente cl = new ENCliente();
                        //Se obtienen los datos indirectos
                        //como el nombre + apellidos del organizador
                        foreach (string i in cl.Listar_Nombre_Apellidos(Session["email"].ToString()))
                            organizador += i + " ";
                        //La longitud (distancia + unidad)
                        string aux = ex.getLongitud();
                        int j = 0;
                        while (aux[j].ToString() != " ")
                        {
                            longitud += aux[j];
                            j++;
                        }
                        j++;
                        for (int i = j; i < aux.Length; i++)
                            unidad += aux[i];

                        if (!Page.IsPostBack)
                        {
                            //Y se rellenan los campos con los datos correspondientes
                            TBTitulo.Text = ex.getTitulo();
                            TBCiudad.Text = ex.getCiudad();
                            LabelOrganizador.Text = organizador;
                            DDLDiff.SelectedValue = ex.getDificultad();
                            TBLlegada.Text = ex.getLlegada();
                            TBLong.Text = longitud;
                            DDLDist.SelectedValue = unidad;
                            LabelPersAct.Text = ex.getActual().ToString();
                            TBPersMax.Text = ex.getMax().ToString();
                            TBSalida.Text = ex.getSalida();
                            TBDesc.Text = ex.getDescripcion();
                            DDLDia.SelectedValue = ex.getFecha().Day.ToString();
                            DDLMes.SelectedValue = ex.getFecha().Month.ToString();
                            DDLAnyo.SelectedValue = ex.getFecha().Year.ToString();
                            ImageExc.ImageUrl = ex.getImagen();
                        }
                    }
                    else //Si el usuario no era el organizador se muestra el error
                    //y abandona la pagina
                    {
                        ButtonEr1.Visible = true;
                        ButtonEr2.Visible = false;
                        ModPanel.Visible = false;
                        ModEr1.Visible = true;
                        LabelEr11.Text = "Permiso denegado.";
                        LabelEr12.Text = "Usted no es el organizador de la excursión.";
                    }
                }
                else  //Si la ID no es correcta se muestra el error
                {
                    ButtonEr1.Visible = false;
                    ButtonEr2.Visible = true;
                    ModPanel.Visible = false;
                    ModEr1.Visible = false;
                    LabelEr11.Text = "No encontrada.";
                    LabelEr12.Text = "La excursión seleccionada no esixte.";
                }
            }
            else  //Si el usuario no esta logueado se muestra el error
            {     //y se le lleva a la pagina de login o registro
                ModPanel.Visible = false;
                PanelNoLog.Visible = true;
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

        protected void ButtonModEx_Click(object sender, EventArgs e)
        {
            //Se obtiene la ID de la excursion
            string ID = Request.QueryString["ID"];
            ENExcursion ex = new ENExcursion();
            //Se rellenan los campos indirectos
            //como fecha con las DDL
            DateTime fecha = new DateTime(int.Parse(DDLAnyo.SelectedItem.ToString()),
                                          int.Parse(DDLMes.SelectedItem.ToString()),
                                          int.Parse(DDLDia.SelectedItem.ToString()));
            //La longitud (distancia + unidad)
            string longitud = TBLong.Text + " " + DDLDist.SelectedItem.ToString();
            //La url de la imagen
            string url = "";
            if (FUImagen.HasFile)
            {
                string tipo = FUImagen.PostedFile.ContentType;
                if (tipo.Equals("image/bmp") || tipo.Equals("image/x-png") || tipo.Equals("image/gif") || tipo.Equals("image/pjpeg") || tipo.Equals("image/bmp"))
                    url = SaveFile(FUImagen.PostedFile);
                else
                    url = "senderismo.jpg";
            }
            else
                url = "senderismo.jpg";

            //Se guardan los datos
            ex.setID(int.Parse(ID));
            ex.setTitulo(TBTitulo.Text);
            ex.setCiudad(TBCiudad.Text);
            ex.setOrganizador(Session["email"].ToString());
            ex.setLongitud(longitud);
            ex.setDificultad(DDLDiff.SelectedItem.ToString());
            if (TBPersMax.Text != "")
                ex.setMax(int.Parse(TBPersMax.Text));
            else ex.setMax(-1);
            ex.setSalida(TBSalida.Text);
            ex.setLlegada(TBLlegada.Text);
            ex.setFecha(fecha);
            ex.setDescripcion(TBDesc.Text);
            ex.setImagen(url);
            //Si los campos son correctos
            if (compruebaCampos(ex))
            {
                //Y se guardan en la BD correctamente
                if (ex.guardarDatos())
                {
                    //Se notifica al usuario
                    //Y se le lleva a la pagina de excursiones
                    ButtonEr1.Visible = true;
                    ButtonEr2.Visible = false;
                    ModPanel.Visible = false;
                    ModEr1.Visible = true;
                    LabelEr11.Text = "Completado.";
                    LabelEr12.Text = "La excursión se ha modificado con éxito.";
                }
                else  //Si no se ha creado
                {     //se notifica al usuario 
                      //y se le devuelve a la excursion
                    ButtonEr1.Visible = true;
                    ButtonEr2.Visible = false;
                    ModPanel.Visible = false;
                    ModEr1.Visible = true;
                    LabelEr11.Text = "No se ha podido modificar la excurión.";
                    LabelEr12.Text = "Por favor, intentelo de nuevo más tarde.";
                }
            }
        }

        protected void Error1(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"];
            Response.Redirect("Excursion.aspx?ID=" + Server.UrlEncode(ID));
        }

        protected void Error2(object sender, EventArgs e)
        {
            Response.Redirect("Excursiones.aspx");
        }

        protected void ButtonBorrarEx_Click(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"];
            ENExcursion ex = new ENExcursion();
            ex.setID(int.Parse(ID));
            if (ex.BorrarExcursion())
            {
                ButtonEr1.Visible = false;
                ButtonEr2.Visible = true;
                ModPanel.Visible = false;
                ModEr1.Visible = true;
                LabelEr11.Text = "Completado.";
                LabelEr12.Text = "Excursión eliminada con éxito.";
            }
            else
            {
                ButtonEr1.Visible = true;
                ButtonEr2.Visible = false;
                ModPanel.Visible = false;
                ModEr1.Visible = true;
                LabelEr11.Text = "No se ha podido eliminar la excursión";
                LabelEr12.Text = "Por favor, intentelo de nuevo más tarde";
            }
        }
    }
}