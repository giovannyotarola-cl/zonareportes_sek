using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using Servipag;

[WebService(Namespace = "http://zonareportes.usek.cl/servipag/SVP_GenericService.wsdl")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public class Service : System.Web.Services.WebService
{
    public Service () {

        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string ConsultaDeuda() {

        consultaDeudaBinding Deuda = new consultaDeudaBinding();
        consultarDeudaRequest_TYPE DeudaReq = new consultarDeudaRequest_TYPE();
        consultarDeudaResponse_TYPE DeudaRes = new consultarDeudaResponse_TYPE();

        notificaPagoBinding Pago = new notificaPagoBinding();
        notificarPagoRequest_TYPE PagoReq = new notificarPagoRequest_TYPE();
        notificarPagoResponse_TYPE PagoRes = new notificarPagoResponse_TYPE();

        PagoReq.Identificador1 = "150607914";

        Pago.notificaPagoOp(PagoReq);

        return PagoRes.CodigoError;
    }
    
}