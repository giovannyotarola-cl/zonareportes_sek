using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace AutoPostulacion.WS
{
    /// <summary>
    /// Descripción breve de DatosDocumentosWs
    /// </summary>
    //[WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class DatosDocumentosWs : System.Web.Services.WebService
    {

        [WebMethod]

        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void datosContratos()
        {
            List<MyClass> lst = new List<MyClass>();            
            string sql = " ";
            DataSet ds;
            string Rut = "1=1";
            string sJSON = "";

            /*sql = sql + " select RutaArchivo, Ano from SEK_REGISTRO_POSTULACION_ONLINE ";
            sql = sql + " where Ano = '2018' ";
            sql = sql + " and Periodo = '1' ";
            sql = sql + " and Tipo in ('PAG','DPA','CON') ";*/

            sql = "exec [sp_get_datos_contratos] 1";

            ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", Rut, sql);


            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string est_contrato = "";
                string est_anx_contrato = "";
                string est_pagare = "";
                string est_postulante = "";

                if (ds.Tables[0].Rows[i]["EST_CONTRATO"].ToString().ToUpper() == "PENDIENTE")
                {
                    est_contrato = "<span style='color:#d28c33'>" + ds.Tables[0].Rows[i]["EST_CONTRATO"].ToString().ToUpper() + "</span>";
                }
                else if (ds.Tables[0].Rows[i]["EST_CONTRATO"].ToString().ToUpper() == "APROBADO")
                {
                    est_contrato = "<span style='color:#00a651'>" + ds.Tables[0].Rows[i]["EST_CONTRATO"].ToString().ToUpper() + "</span>";
                }
                else if (ds.Tables[0].Rows[i]["EST_CONTRATO"].ToString().ToUpper() == "RECHAZADO")
                {
                    est_contrato = "<span style='color:#ed1c24'>" + ds.Tables[0].Rows[i]["EST_CONTRATO"].ToString().ToUpper() + "</span>";
                }
                else
                {
                    est_contrato = "<span style='color:#d28c33'>" + ds.Tables[0].Rows[i]["EST_CONTRATO"].ToString().ToUpper() + "</span>";
                }

                if (ds.Tables[0].Rows[i]["EST_ANX_CONTRATO"].ToString().ToUpper() == "PENDIENTE")
                {
                    est_anx_contrato = "<span style='color:#d28c33'>" + ds.Tables[0].Rows[i]["EST_ANX_CONTRATO"].ToString().ToUpper() + "</span>";
                }
                else if (ds.Tables[0].Rows[i]["EST_ANX_CONTRATO"].ToString().ToUpper() == "APROBADO")
                {
                    est_anx_contrato = "<span style='color:#00a651'>" + ds.Tables[0].Rows[i]["EST_ANX_CONTRATO"].ToString().ToUpper() + "</span>";
                }
                else if (ds.Tables[0].Rows[i]["EST_ANX_CONTRATO"].ToString().ToUpper() == "RECHAZADO")
                {
                    est_anx_contrato = "<span style='color:#ed1c24'>" + ds.Tables[0].Rows[i]["EST_ANX_CONTRATO"].ToString().ToUpper() + "</span>";
                }
                else
                {
                    est_anx_contrato = "<span style='color:#d28c33'>" + ds.Tables[0].Rows[i]["EST_ANX_CONTRATO"].ToString().ToUpper() + "</span>";
                }


                if (ds.Tables[0].Rows[i]["EST_PAGARE"].ToString().ToUpper() == "PENDIENTE")
                {
                    est_pagare = "<span style='color:#d28c33'>" + ds.Tables[0].Rows[i]["EST_PAGARE"].ToString().ToUpper() + "</span>";
                }
                else if (ds.Tables[0].Rows[i]["EST_PAGARE"].ToString().ToUpper() == "APROBADO")
                {
                    est_pagare = "<span style='color:#00a651'>" + ds.Tables[0].Rows[i]["EST_PAGARE"].ToString().ToUpper() + "</span>";
                }
                else if (ds.Tables[0].Rows[i]["EST_PAGARE"].ToString().ToUpper() == "RECHAZADO")
                {
                    est_pagare = "<span style='color:#ed1c24'>" + ds.Tables[0].Rows[i]["EST_PAGARE"].ToString().ToUpper() + "</span>";
                }
                else
                {
                    est_pagare = "<span style='color:#d28c33'>" + ds.Tables[0].Rows[i]["EST_PAGARE"].ToString().ToUpper() + "</span>";
                }

                if (ds.Tables[0].Rows[i]["EST_POSTULANTE"].ToString().ToUpper() == "PENDIENTE")
                {
                    est_postulante = "<span style='color:#d28c33'>" + ds.Tables[0].Rows[i]["EST_POSTULANTE"].ToString().ToUpper() + "</span>";
                }
                else if (ds.Tables[0].Rows[i]["EST_POSTULANTE"].ToString().ToUpper() == "APROBADO")
                {
                    est_postulante = "<span style='color:#00a651'>" + ds.Tables[0].Rows[i]["EST_POSTULANTE"].ToString().ToUpper() + "</span>";
                }
                else if (ds.Tables[0].Rows[i]["EST_POSTULANTE"].ToString().ToUpper() == "RECHAZADO")
                {
                    est_postulante = "<span style='color:#ed1c24'>" + ds.Tables[0].Rows[i]["EST_POSTULANTE"].ToString().ToUpper() + "</span>";
                }
                else
                {
                    est_postulante = "<span style='color:#d28c33'>" + ds.Tables[0].Rows[i]["EST_POSTULANTE"].ToString().ToUpper() + "</span>";
                }


                lst.Add(new MyClass()
                {
                    Rut = "<a href=' http://educore.usek.cl/app/formulario.aspx?rut=" + ds.Tables[0].Rows[i]["COD_ALUMNO"].ToString() + "' target='_blank'>" + ds.Tables[0].Rows[i]["RUT"].ToString() + "</a>",
                    //Rut =  ds.Tables[0].Rows[i]["RUT"].ToString(),
                    Nombre = ds.Tables[0].Rows[i]["NOMBRE"].ToString(),
                    CodAlumno = ds.Tables[0].Rows[i]["COD_ALUMNO"].ToString(),
                    Sexo = ds.Tables[0].Rows[i]["SEXO"].ToString(),
                    Mail = ds.Tables[0].Rows[i]["MAIL"].ToString(),
                    Fonoact = ds.Tables[0].Rows[i]["FONOACT"].ToString(),
                    Region = ds.Tables[0].Rows[i]["REGION"].ToString(),
                    Comuna = ds.Tables[0].Rows[i]["COMUNA"].ToString(),
                    Facultad = ds.Tables[0].Rows[i]["FACULTAD"].ToString(),
                    Carrera = ds.Tables[0].Rows[i]["CARRERA"].ToString(),
                    Cohorte = ds.Tables[0].Rows[i]["COHORTE"].ToString(),
                    Jornada = ds.Tables[0].Rows[i]["JORNADA"].ToString(),
                    Estado = ds.Tables[0].Rows[i]["ESTADO"].ToString(),
                    DescripEstacad = ds.Tables[0].Rows[i]["DESCRIP_ESTACAD"].ToString(),
                    EstContrato = est_contrato,
                    EstAnxContrato = est_anx_contrato,
                    EstPagare = est_pagare,
                    EstadoPostul = est_postulante,
                    VerEstado = "<center><button type='button' class='btn btn-info btn-xs bto-ver' onClick='mostrardoc(\"" + ds.Tables[0].Rows[i]["RUT"].ToString() + "\")'>Ver</ button ></ center>",
                    matriculado = ds.Tables[0].Rows[i]["MATRICULADO"].ToString(),
                    FecMatricula = ds.Tables[0].Rows[i]["FEC_MAT"].ToString()                
                });              
            }

            var mydata = new DataTable() { aaData = lst, iTotalDisplayRecords = lst.Count, iTotalRecords = lst.Count };
            JavaScriptSerializer js = new JavaScriptSerializer();
            js.MaxJsonLength = int.MaxValue;
            Context.Response.Write(js.Serialize(mydata));
        }



        public class MyClass
        {            
            public string Rut { get; set; }        
            public string Nombre { get; set; }
            public string CodAlumno { get; set; }
            public string Sexo { get; set; }
            public string Mail { get; set; }
            public string Fonoact { get; set; }
            public string Region { get; set; }
            public string Comuna { get; set; }
            public string Facultad { get; set; }
            public string Carrera { get; set; }
            public string Cohorte { get; set; }
            public string Jornada { get; set; }
            public string Estado { get; set; }
            public string DescripEstacad { get; set; }
            public string EstContrato { get; set; }
            public string EstAnxContrato { get; set; }
            public string EstPagare { get; set; }
            public string EstadoPostul { get; set; }
            public string VerEstado { get; set; }
            public string matriculado { get; set; }
            public string FecMatricula { get; set; }

        }

        public class DataTable
        {
            public int iTotalRecords { get; set; }

            public int iTotalDisplayRecords { get; set; }

            public List<MyClass> aaData { get; set; }
        }
    }
}
