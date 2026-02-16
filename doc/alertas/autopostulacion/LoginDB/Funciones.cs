using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Net;


namespace AutoPostulacion.LoginDb
{
    [Serializable]
    public class Actividad
    {
        public string resultados_esperados { get; set; }
        public string indicadores { get; set; }
        public string resultados_reales { get; set; }
        public string fuentes { get; set; }

    }
    public class Funciones
    {

        public static string conectarMail()
        {
            string cadena = "tx0MFWCG55OvJYcY6H/Bw1N7/Jlcsk1O";
            string cadena1 = Desencriptar(cadena);
            return cadena1;
        }
        private static string Encriptar(string Input)
        {

            byte[] IV = ASCIIEncoding.ASCII.GetBytes("qualityi"); //La clave debe ser de 8 caracteres
            byte[] EncryptionKey = Convert.FromBase64String("rpaSPvIvVLlrcmtzPU9/c67Gkj7yL1S5"); //No se puede alterar la cantidad de caracteres pero si la clave
            byte[] buffer = Encoding.UTF8.GetBytes(Input);
            TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
            des.Key = EncryptionKey;
            des.IV = IV;

            return Convert.ToBase64String(des.CreateEncryptor().TransformFinalBlock(buffer, 0, buffer.Length)); ;

        }
        private static string Desencriptar(string Input)
        {

            byte[] IV = ASCIIEncoding.ASCII.GetBytes("qualityi"); //La clave debe ser de 8 caracteres
            byte[] EncryptionKey = Convert.FromBase64String("rpaSPvIvVLlrcmtzPU9/c67Gkj7yL1S5"); //No se puede alterar la cantidad de caracteres pero si la clave
            byte[] buffer = Convert.FromBase64String(Input);
            TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
            des.Key = EncryptionKey;
            des.IV = IV;
            return Encoding.UTF8.GetString(des.CreateDecryptor().TransformFinalBlock(buffer, 0, buffer.Length));

        }

        public static string EncriptarURL(string Input)
        {
            string query = Encriptar(Input);
            query = query.Replace("+", "-").Replace("/", "_").Replace("=", ".");
            return HttpUtility.UrlEncode(query);
        }

        public static string DesencriptarURL(string Input)
        {
            string query = HttpUtility.HtmlDecode(Input);
            query = query.Replace("-", "+").Replace("_", "/").Replace(".", "=");
            return Desencriptar(query);
        }

        public static string Dc_sender(string Input)
        {
            return Desencriptar(Input);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static string Ec_sender(string Input)
        {
            return Encriptar(Input);
        }

        public static void EnviarCorreo(string MailBody,string MailTo)
        {
            MailMessage correo = new MailMessage();
            correo.From = new MailAddress("no.reply@uisek.edu.ec", "Matrícula Universidad Internacional SEK", System.Text.Encoding.UTF8);
            correo.Subject = "Información Proceso Matrícula";
            correo.SubjectEncoding = System.Text.Encoding.UTF8;
            //correo.Body = "Solicitud de Beca Universidad Internacional SEK.\n NO RESPONDA A ESTE EMAIL.\n En caso de dudas contacte al departamento técnico.";
            correo.Body = MailBody;
            correo.BodyEncoding = System.Text.Encoding.UTF8;
            string encabezado = "<html><head> " +
                                          "<style type=\"text/css\">.style3 { width:30%;  } .style2 {color:red;}.style4 {border:0;} .titulo{text-align:center;}</style>" +
                                          "</head>" +
                                          "<body class=\"style4\">" +
                                          "<form id=\"form1\" runat=\"server\">" +
                                          "<div><img src='https://www.usek.cl/Admision2018/principal/images/ser-mejores.png' width='100px'></img></div>" + 
                                          "<div class=\"titulo\"><h3>SOLICITUD DE BECA</h3></div>";
            System.Net.Mime.ContentType mimeType = new System.Net.Mime.ContentType("text/html");

            AlternateView alternate = AlternateView.CreateAlternateViewFromString(MailBody, mimeType);
            correo.AlternateViews.Add(alternate);
            correo.IsBodyHtml = false;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("no.reply@uisek.edu.ec", Funciones.conectarMail());
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Esto es para que vaya a través de SSL que es obligatorio con GMail 
            client.Send(correo.From.ToString(),MailTo,correo.Subject,correo.Body);
        }
        public static string obtenerAnioAcademicoActual()
        {
            string aux = string.Empty;
            int anio = DateTime.Now.Year;
            int mes = DateTime.Now.Month;
            if (mes > 9 && mes < 13)
                anio++;
            aux = anio.ToString();
            return aux;
        }

        public static void subirArchivoFTP(string FilePath, string RemotePath, string Login, string Password)
        {
            using (FileStream fs = new FileStream(FilePath, FileMode.Open, FileAccess.Read, FileShare.Read))
            {
                string url = Path.Combine(RemotePath, Path.GetFileName(FilePath));

                // Creo el objeto ftp
                FtpWebRequest ftp = (FtpWebRequest)FtpWebRequest.Create(url);

                // Fijo las credenciales, usuario y contraseña
                ftp.Credentials = new NetworkCredential(Login, Password);

                // Le digo que no mantenga la conexión activa al terminar.
                ftp.KeepAlive = false;

                // Indicamos que la operación es subir un archivo...
                ftp.Method = WebRequestMethods.Ftp.UploadFile;

                // … en modo binario … (podria ser como ASCII)
                ftp.UseBinary = true;

                // Indicamos la longitud total de lo que vamos a enviar.
                ftp.ContentLength = fs.Length;

                // Desactivo cualquier posible proxy http.
                // Ojo pues de saltar este paso podría usar 
                // un proxy configurado en iexplorer
                ftp.Proxy = null;

                // Pongo el stream al inicio
                fs.Position = 0;

                // Configuro el buffer a 2 KBytes
                int buffLength = 2048;
                byte[] buff = new byte[buffLength];

                int contentLen;

                // obtener el stream del socket sobre el que se va a escribir.
                using (Stream strm = ftp.GetRequestStream())
                {
                    // Leer del buffer 2kb cada vez
                    contentLen = fs.Read(buff, 0, buffLength);

                    // mientras haya datos en el buffer ….
                    while (contentLen != 0)
                    {
                        // escribir en el stream de conexión
                        //el contenido del stream del fichero
                        strm.Write(buff, 0, contentLen);
                        contentLen = fs.Read(buff, 0, buffLength);
                    }
                }
            }
        }
  
        public static bool CrearDirFTP(string folder,string pathFTP,string userFTP,string passFTP)
        {
            bool success = false;

            System.Net.FtpWebRequest ftp_web_request = null;
            System.Net.FtpWebResponse ftp_web_response = null;

            string ftp_path = pathFTP + folder;

            try
            {
                ftp_web_request = (FtpWebRequest)WebRequest.Create(ftp_path);
                ftp_web_request.Method = WebRequestMethods.Ftp.MakeDirectory;
                ftp_web_request.Credentials = new NetworkCredential(userFTP, passFTP);

                ftp_web_response = (FtpWebResponse)ftp_web_request.GetResponse();

                string ftp_response = ftp_web_response.StatusDescription;
                string status_code = Convert.ToString(ftp_web_response.StatusCode);

                ftp_web_response.Close();

                success = true;
            }
            catch (Exception Ex)
            {
                string status = Convert.ToString(Ex);
            }

            return success;
        }

    }

   
}
