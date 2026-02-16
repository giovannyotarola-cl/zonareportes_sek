using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace AutoPostulacion
{
    public partial class SiteMenuMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        protected void Page_Init(object sender, EventArgs e)
        {
            // El código siguiente ayuda a proteger frente a ataques XSRF
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Utilizar el token Anti-XSRF de la cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generar un nuevo token Anti-XSRF y guardarlo en la cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Establecer token Anti-XSRF
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validar el token Anti-XSRF
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Error de validación del token Anti-XSRF.");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["mostrar_menu"].ToString() == "0")
                {
                    menu_barra.Visible = false;
                    mainMenu.Visible = false;
                }
                else
                {
                    menu_barra.Visible = true;
                    mainMenu.Visible = true;
                    if (Session["Tipo_Usuario"].ToString() == "1")
                    {
                        menu_mant_carreras.Visible = true;
                        menu_config_periodo_matricula.Visible = true;
                        menu_actividad_alumnos.Visible = true;
                        menu_revision_archivos.Visible = true;
                        menu_subir_archivos.Visible = true;
                        menu_Lista_Solicitudes.Visible = true;
                    }
                    if (Session["Tipo_Usuario"].ToString() == "2")
                    {
                        menu_mant_carreras.Visible = false;
                        menu_config_periodo_matricula.Visible = false;
                        menu_actividad_alumnos.Visible = true;
                        menu_revision_archivos.Visible = true;
                        menu_subir_archivos.Visible = false;
                    }
                    if (Session["Tipo_Usuario"].ToString() == "3")
                    {
                        menu_mant_carreras.Visible = false;
                        menu_config_periodo_matricula.Visible = false;
                        menu_actividad_alumnos.Visible = true;
                        menu_revision_archivos.Visible = false;
                        menu_subir_archivos.Visible = true;
                    }
                }
                
            }
            catch
            {
                return;
            }

        }
        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }
}