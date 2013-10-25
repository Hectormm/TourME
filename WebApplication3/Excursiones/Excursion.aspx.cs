using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using ClassLibrary2.EN;

namespace TourMe.Excrusion
{
    public partial class Exc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string email = "", dificultad, organizador = "";
            string ID = Request.QueryString["ID"];
            ENExcursion ex = new ENExcursion();
            try
            {
                ex.recuperarDatos(int.Parse(ID));
            }
            catch (Exception exce)
            {
                Response.Redirect("Excursiones.aspx");
                string error = exce.Message;
            }

            if (ID != "" && ID != null)
            {   
                ENCliente cl = new ENCliente();
                email = ex.getOrganizador();
                LabelTitulo.Text = ex.getTitulo();
                LabelCiudad.Text = ex.getCiudad();
                foreach (string i in cl.Listar_Nombre_Apellidos(email))
                    organizador += i + " ";
                LinkOrganizador.Text = organizador;
                dificultad = ex.getDificultad();
                if (dificultad == "Fácil") LabelDiff.ForeColor = System.Drawing.Color.Green;
                else if (dificultad == "Moderado") LabelDiff.ForeColor = System.Drawing.Color.Blue;
                else if (dificultad == "Avanzado") LabelDiff.ForeColor = System.Drawing.Color.Red;
                LabelDiff.Text = dificultad;
                LabelFecha.Text = ex.getFecha().Day.ToString() + "/" + ex.getFecha().Month.ToString() + "/" + ex.getFecha().Year.ToString();
                LabelLlegada.Text = ex.getLlegada();
                LabelLong.Text = ex.getLongitud();
                LabelPersAct.Text = ex.getActual().ToString();
                LabelPersMax.Text = ex.getMax().ToString();
                LabelSalida.Text = ex.getSalida();
                LabelDesc.Text = ex.getDescripcion();
                Image1.ImageUrl = ex.getImagen();

                string DescripcionFB = "";
                Page.Title = ex.getTitulo();
                DescripcionFB = "Organizador: "+organizador+"\nDescripción: "+ex.getDescripcion();
                Page.MetaDescription = DescripcionFB;
            }

            if (Session.Count != 0)
            {
                if (Session["email"].Equals(email))
                    ButtonLog.Text = "Modificar excursión";
                else
                    if (ex.buscaParticipante(Session["email"].ToString()))
                        ButtonLog.Text = "Salir";
                    else
                        ButtonLog.Text = "Apúntate";
            }
            else
            {
                ButtonLog.Text = "Entra y apúntate";
                ButtonLog.Click += ButtonLog_Click;
            }

        }

        protected void ButtonLog_Click(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"];

            if (ID != "" && ID != null)
            {
                if (Session.Count != 0)
                {
                    ENExcursion ex = new ENExcursion();
                    ex.recuperarDatos(int.Parse(ID));
                    if (Session["email"].Equals(ex.getOrganizador()))
                        Response.Redirect("ModificarEx.aspx?ID=" + Server.UrlEncode(ID));
                    else
                        if (ex.buscaParticipante(Session["email"].ToString()))
                        {
                            if (ex.quitarUsuario(Session["email"].ToString()))
                                Response.Redirect("Excursion.aspx?ID=" + Server.UrlEncode(ID));
                        }
                        else
                            if (ex.AnyadirUsuario(Session["email"].ToString()))
                                Response.Redirect("Excursion.aspx?ID=" + Server.UrlEncode(ID));
                }
                else
                    Response.Redirect("~/Default/Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Excursiones.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"];
            ENExcursion ex = new ENExcursion();
            ex.recuperarDatos(int.Parse(ID));
            Response.Redirect("~/Perfil/PerfilUsuario.aspx?user=" + Server.UrlEncode(ex.getOrganizador()));
        }
    }
}