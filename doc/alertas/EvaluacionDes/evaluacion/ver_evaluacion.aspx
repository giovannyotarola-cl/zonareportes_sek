<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ver_evaluacion.aspx.vb" Inherits="SistemaEvaluacion.ver_evaluacion" MasterPageFile="~/Site.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="<%= ResolveUrl("~/Scripts/visor_evaluacion.js") %>"></script>

    <asp:FormView ID="FormView1" runat="server" 
        DataSourceID="Source_VistaEncuesta">
        
        <ItemTemplate>
            <div class = "evaluar_t_title">
            	Datos del Evaluado
            </div>
            <table class = "evaluar_t1">
            	<tr>
                	<td class = "evaluar_t1_cab">
                    	Nombre: 
                    </td>
                    <td class = "evaluar_t1_dato">
                    	<asp:Label ID="EvaluadoLabel" runat="server" Text='<%# Bind("Evaluado") %>' />
                    </td>
                </tr>
            	<tr>
                	<td class = "evaluar_t1_cab">
                    	Cargo: 
                    </td>
                    <td class = "evaluar_t1_dato">
                        <asp:Label ID="CargoEvaluadoLabel" runat="server" Text='<%# Bind("CargoEvaluado") %>' />
                    </td>
                </tr>
                <tr>
                	<td class = "evaluar_t1_cab">
                    	Periodo de evaluaci&oacute;n:
                    </td>
                    <td class = "evaluar_t1_dato">
                    	<%= Session("ano").ToString + " - " + Session("semestre").ToString %>
                    </td>
                </tr>
            	<tr>
                	<td class = "evaluar_t1_cab">
                    	Fecha de evaluaci&oacute;n:
                    </td>
                    <td class = "evaluar_t1_dato">
                        <asp:Label ID="fechaLabel" runat="server" Text='<%# Bind("fecha") %>' />
                    </td>
                </tr>                            
            </table>
            
            <table class = "evaluar_t2">
            	<tr>
                	<td colspan="2" class = "t2_titulo">
						RENDIMIENTO LABORAL
                    </td>
                	<td class = "tipo_nota">
                    	MUY BUENO
                    </td>
                	<td class = "tipo_nota">
                    	BUENO
                    </td>
                	<td class = "tipo_nota">
                    	ACEPTABLE
                    </td>
                	<td class = "tipo_nota">
                    	INSUFICIENTE
                    </td>
                	<td class = "tipo_nota">
                    	DEFICIENTE
                    </td>
                	<td class = "tipo_nota">
                    	NOTA
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a)
                    </td>
                	<td class = "t2_subcab">
                    	Calidad
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.1
                    </td>
                	<td class = "t2_pregunta">
                    	Trabajos técnicamente correctos y confiables
                    </td>
                	<td class = "casilla_radio" id="1_a1_5">
                    </td>
                	<td class = "casilla_radio" id="1_a1_4">
                    </td>
                	<td class = "casilla_radio" id="1_a1_3">
                    </td>
                	<td class = "casilla_radio" id="1_a1_2">
                    </td>
                	<td class = "casilla_radio" id="1_a1_1">	
                    </td>
                	<td class = "casilla_nota">
                    	<asp:Label ID="G1_a1Label" runat="server" Text='<%# Bind("G1_a1") %>' />
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.2
                    </td>
                	<td class = "t2_pregunta">
                    	Presentaci&oacute;n de los trabajos encomendados
                    </td>
                	<td class = "casilla_radio" id="1_a2_5">
                    </td>
                	<td class = "casilla_radio"  id="1_a2_4">
                    </td>
                	<td class = "casilla_radio" id="1_a2_3">
                    </td>
                	<td class = "casilla_radio" id="1_a2_2">
                    </td>
                	<td class = "casilla_radio"  id="1_a2_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G1_a2Label" runat="server" Text='<%# Bind("G1_a2") %>' />            
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.3
                    </td>
                	<td class = "t2_pregunta">
                    	Necesidad de Supervisi&oacute;n (independencia en el trabajo)
                    </td>
                	<td class = "casilla_radio"  id="1_a3_5">
                    </td>
                	<td class = "casilla_radio" id="1_a3_4">
                    </td>
                	<td class = "casilla_radio"  id="1_a3_3">
                    </td>
                	<td class = "casilla_radio"  id="1_a3_2">
                    </td>
                	<td class = "casilla_radio"  id="1_a3_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G1_a3Label" runat="server" Text='<%# Bind("G1_a3") %>' />
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (a.1 + a.2 + a.3) / 3
                    </td>
                	<td class = "casilla_nota_sub">
                         <asp:Label ID="G1_aLabel" runat="server" Text='<%# Bind("G1_a") %>' />                
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b)
                    </td>
                	<td class = "t2_subcab">
                    	Cantidad y Voluntad
                    </td>
                	<td>
                     </td>
                	<td>
                     </td>
                	<td>
                     </td>
                	<td>
                     </td>
                	<td>
                     </td>
                	<td>
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.1
                    </td>
                	<td class = "t2_pregunta">
                    	Capacidad de realizar tareas programadas
                    </td>
                	<td class = "casilla_radio" id="1_b1_5">
                    </td>
                	<td class = "casilla_radio" id="1_b1_4">
                    </td>
                	<td class = "casilla_radio" id="1_b1_3">
                    </td>
                	<td class = "casilla_radio" id="1_b1_2">
                    </td>
                	<td class = "casilla_radio" id="1_b1_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G1_b1Label" runat="server" Text='<%# Bind("G1_b1") %>' />  
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.2
                    </td>
                	<td class = "t2_pregunta">
                    	Capacidad de realizar tareas no programadas
                    </td>
                	<td class = "casilla_radio" id="1_b2_5">
                    </td>
                	<td class = "casilla_radio" id="1_b2_4">
                    </td>
                	<td class = "casilla_radio" id="1_b2_3">
                    </td>
                	<td class = "casilla_radio" id="1_b2_2">
                    </td>
                	<td class = "casilla_radio" id="1_b2_1">
                    </td>
                	<td class = "casilla_nota">
                    	<asp:Label ID="G1_b2Label" runat="server" Text='<%# Bind("G1_b2") %>' />                
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.3
                    </td>
                	<td class = "t2_pregunta">
                    	Iniciativa para enfrentar el trabajo encomendado o para solucionar problemas que se le presenten
                    </td>
                	<td class = "casilla_radio" id="1_b3_5">
                    </td>
                	<td class = "casilla_radio" id="1_b3_4">
                    </td>
                	<td class = "casilla_radio" id="1_b3_3">
                    </td>
                	<td class = "casilla_radio" id="1_b3_2">
                    </td>
                	<td class = "casilla_radio" id="1_b3_1">
                    </td>
                	<td class = "casilla_nota">
                    	<asp:Label ID="G1_b3Label" runat="server" Text='<%# Bind("G1_b3") %>' />                    
                    </td>                                                                                                                                            
                </tr>
            		<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (b.1 + b.2 + b.3) / 3
                    </td>
                	<td class="casilla_nota_sub">
                        <asp:Label ID="G1_bLabel" runat="server" Text='<%# Bind("G1_b") %>' />                    
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	c)
                    </td>
                	<td class = "t2_subcab">
                    	Oportunidad
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>                                                                                                                                            
                </tr>
                <tr>
                	<td class = "t2_subcab">
                    	c.1.
                    </td>
                	<td class = "t2_pregunta">
                    	Cumplimiento de plazos en tareas programadas
                    </td>
                	<td class = "casilla_radio" id="1_c1_5">
                    </td>
                	<td class = "casilla_radio" id="1_c1_4">
                    </td>
                	<td class = "casilla_radio" id="1_c1_3">
                    </td>
                	<td class = "casilla_radio" id="1_c1_2">
                    </td>
                	<td class = "casilla_radio" id="1_c1_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G1_c1Label" runat="server" Text='<%# Bind("G1_c1") %>' />                     
                    </td>                                                                                                                                            
                </tr>
                <tr>
                	<td class = "t2_subcab">
                    	c.2.
                    </td>
                	<td class = "t2_pregunta">
                    	Aprovechamiento del tiempo
                    </td>
                	<td class = "casilla_radio" id="1_c2_5">
                    </td>
                	<td class = "casilla_radio" id="1_c2_4">
                    </td>
                	<td class = "casilla_radio" id="1_c2_3">
                    </td>
                	<td class = "casilla_radio" id="1_c2_2">
                    </td>
                	<td class = "casilla_radio" id="1_c2_1">
                    </td>
                	<td class = "casilla_nota">
                       <asp:Label ID="G1_c2Label" runat="server" Text='<%# Bind("G1_c2") %>' />                  
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	c.3.
                    </td>
                	<td class = "t2_pregunta">
                    	Planificaci&oacute;n del trabajo
                    </td>
                	<td class = "casilla_radio" id="1_c3_5">
                    </td>
                	<td class = "casilla_radio" id="1_c3_4">
                    </td>
                	<td class = "casilla_radio" id="1_c3_3">
                    </td>
                	<td class = "casilla_radio" id="1_c3_2">
                    </td>
                	<td class = "casilla_radio" id="1_c3_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G1_c3Label" runat="server" Text='<%# Bind("G1_c3") %>' />                   
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (c.1 + c.2 + c.3) / 3
                    </td>
                	<td class="casilla_nota_sub">
                        <asp:Label ID="G1_cLabel" runat="server" Text='<%# Bind("G1_c") %>' />  
                    </td>                                                                                                                                            
                </tr>                
                <tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class="casilla_subfactor">
                    	NOTA FACTOR<br />
                        Promedio Subfactor<br />
                        (a+b+c)/3
                    </td>
                	<td class="casilla_nota_fac">
                        <asp:Label ID="G1_promedioLabel" runat="server" Text='<%# Bind("G1_promedio") %>' />   
                    </td>                                                                                                                                            
                </tr>
                <tr>
                	<td colspan="8">&nbsp;</td>
                </tr>   
                <tr>
                	<td colspan="8">&nbsp;</td>
                </tr>               
                <tr>
                	<td colspan="2" class = "t2_titulo">
						COMPETENCIAS LABORALES
                    </td>
                	<td class = "tipo_nota">
                    	MUY BUENO
                    </td>
                	<td class = "tipo_nota">
                    	BUENO
                    </td>
                	<td class = "tipo_nota">
                    	ACEPTABLE
                    </td>
                	<td class = "tipo_nota">
                    	INSUFICIENTE
                    </td>
                	<td class = "tipo_nota">
                    	DEFICIENTE
                    </td>
                	<td class = "tipo_nota">
                    	NOTA
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a)
                    </td>
                	<td class = "t2_subcab">
                    	Relaciones interpersonales
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.1
                    </td>
                	<td class = "t2_pregunta">
                    	Disposici&oacute;n para trabajar en equipo
                    </td>
                	<td class = "casilla_radio" id="2_a1_5">
                    </td>
                	<td class = "casilla_radio" id="2_a1_4">
                    </td>
                	<td class = "casilla_radio" id="2_a1_3">
                    </td>
                	<td class = "casilla_radio" id="2_a1_2">
                    </td>
                	<td class = "casilla_radio" id="2_a1_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G2_a1Label" runat="server" Text='<%# Bind("G2_a1") %>' />                     
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.2
                    </td>
                	<td class = "t2_pregunta">
                    	Comparte con sus pares los conocimientos adquiridos
                    </td>
                	<td class = "casilla_radio" id="2_a2_5">
                    </td>
                	<td class = "casilla_radio" id="2_a2_4">
                    </td>
                	<td class = "casilla_radio" id="2_a2_3">
                    </td>
                	<td class = "casilla_radio" id="2_a2_2">
                    </td>
                	<td class = "casilla_radio" id="2_a2_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G2_a2Label" runat="server" Text='<%# Bind("G2_a2") %>' />                     
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.3
                    </td>
                	<td class = "t2_pregunta">
                    	Disposici&oacute;n para colaborar con sus compa&ntilde;eros
                    </td>
                	<td class = "casilla_radio" id="2_a3_5">
                    </td>
                	<td class = "casilla_radio" id="2_a3_4">
                    </td>
                	<td class = "casilla_radio" id="2_a3_3">
                    </td>
                	<td class = "casilla_radio" id="2_a3_2">
                    </td>
                	<td class = "casilla_radio" id="2_a3_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G2_a3Label" runat="server" Text='<%# Bind("G2_a3") %>' />                        
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (a.1 + a.2 + a.3) / 3
                    </td>
                	<td class = "casilla_nota_sub">
                        <asp:Label ID="G2_aLabel" runat="server" Text='<%# Bind("G2_a") %>' />                 
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b)
                    </td>
                	<td class = "t2_subcab">
                    	Inter&eacute;s por el trabajo y voluntad de servicio
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.1
                    </td>
                	<td class = "t2_pregunta">
                    	Inter&eacute;s por asumir mayores responsabilidades
                    </td>
                	<td class = "casilla_radio" id="2_b1_5">
                    </td>
                	<td class = "casilla_radio" id="2_b1_4">
                    </td>
                	<td class = "casilla_radio" id="2_b1_3">
                    </td>
                	<td class = "casilla_radio" id="2_b1_2">
                    </td>
                	<td class = "casilla_radio" id="2_b1_1">
                    </td>
                	<td class = "casilla_nota">
                         <asp:Label ID="G2_b1Label" runat="server" Text='<%# Bind("G2_b1") %>' />                      
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.2
                    </td>
                	<td class = "t2_pregunta">
                    	Inter&eacute;s por conocer y aplicar nuevos m&eacute;todos, t&eacute;cnicas o procedimientos de trabajo
                    </td>
                	<td class = "casilla_radio" id="2_b2_5">
                    </td>
                	<td class = "casilla_radio" id="2_b2_4">
                    </td>
                	<td class = "casilla_radio" id="2_b2_3">
                    </td>
                	<td class = "casilla_radio" id="2_b2_2">
                    </td>
                	<td class = "casilla_radio" id="2_b2_1">
                    	                 
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G2_b2Label" runat="server" Text='<%# Bind("G2_b2") %>' />                       
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.3
                    </td>
                	<td class = "t2_pregunta">
                    	Atenci&oacute;n de requerimientos de usuarios
                    </td>
                	<td class = "casilla_radio" id="2_b3_5">
                    </td>
                	<td class = "casilla_radio" id="2_b3_4">
                    </td>
                	<td class = "casilla_radio" id="2_b3_3">                  	                
                    </td>
                	<td class = "casilla_radio" id="2_b3_2">
                    </td>
                	<td class = "casilla_radio" id="2_b3_1">                 	                   
                    </td>
                	<td class = "casilla_nota">
                       <asp:Label ID="G2_b3Label" runat="server" Text='<%# Bind("G2_b3") %>' />                     
                    </td>                                                                                                                                            
                </tr>
          		<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (b.1 + b.2 + b.3) / 3
                    </td>
                	<td class="casilla_nota_sub">
                       <asp:Label ID="G2_bLabel" runat="server" Text='<%# Bind("G2_b") %>' />                       
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	c)
                    </td>
                	<td class = "t2_subcab">
                    	Conocimiento
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>
                	<td>
                    </td>                                                                                                                                            
                </tr>
                <tr>
                	<td class = "t2_subcab">
                    	c.1.
                    </td>
                	<td class = "t2_pregunta">
                    	Grado de aplicac&oacute;n de la informaci&oacute;n
                    </td>
                	<td class = "casilla_radio" id="2_c1_5">
                    </td>
                	<td class = "casilla_radio" id="2_c1_4">
                    </td>
                	<td class = "casilla_radio" id="2_c1_3">
                    </td>
                	<td class = "casilla_radio" id="2_c1_2">                  	
                    </td>
                	<td class = "casilla_radio" id="2_c1_1">
                    </td>
                	<td class = "casilla_nota">
                       <asp:Label ID="G2_c1Label" runat="server" Text='<%# Bind("G2_c1") %>' />                   
                    </td>                                                                                                                                            
                </tr>
                <tr>
                	<td class = "t2_subcab">
                    	c.2.
                    </td>
                	<td class = "t2_pregunta">
                    	Grado de dominio de su trabajo
                    </td>
                	<td class = "casilla_radio" id="2_c2_5">
                    </td>
                	<td class = "casilla_radio" id="2_c2_4">
                    </td>
                	<td class = "casilla_radio" id="2_c2_3">
                    </td>
                	<td class = "casilla_radio" id="2_c2_2">
                    </td>
                	<td class = "casilla_radio" id="2_c2_1">
                    </td>
                	<td class = "casilla_nota">
                         <asp:Label ID="G2_c2Label" runat="server" Text='<%# Bind("G2_c2") %>' />               
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	c.3.
                    </td>
                	<td class = "t2_pregunta">
                    	Apoyo a sus pares o a la jefatura
                    </td>
                	<td class = "casilla_radio" id="2_c3_5">
                    </td>
                	<td class = "casilla_radio" id="2_c3_4">
                    </td>
                	<td class = "casilla_radio" id="2_c3_3">
                    </td>
                	<td class = "casilla_radio" id="2_c3_2">
                    </td>
                	<td class = "casilla_radio" id="2_c3_1">
                    </td>
                	<td class = "casilla_nota"> 
                        <asp:Label ID="G2_c3Label" runat="server" Text='<%# Bind("G2_c3") %>' />                      
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (c.1 + c.2 + c.3) / 3
                    </td>
                	<td class="casilla_nota_sub">
                        <asp:Label ID="G2_cLabel" runat="server" Text='<%# Bind("G2_c") %>' />                      
                    </td>                                                                                                                                            
                </tr>                
                <tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class="casilla_subfactor">
                    	NOTA FACTOR<br />
                        Promedio Subfactor<br />
                        (a+b+c)/3
                    </td>
                	<td class="casilla_nota_fac">
                         <asp:Label ID="G2_promedioLabel" runat="server" Text='<%# Bind("G2_promedio") %>' />                      
                    </td>                                                                                                                                            
                </tr>          
         </table>
   
   		<div class = "obs_titulo">
        	OBSERVACIONES GENERALES
        </div>
        <div class = "ver_observacion">
            <asp:Label ID="observacionesLabel" runat="server" Text='<%# Bind("observaciones") %>' />
        </div>

        <div class = "obs_titulo">
        	COMPROMISO DE MEJORA
        </div>
        <div class = "ver_observacion">
            <asp:Label ID="mejoraLabel" runat="server" Text='<%# Bind("compromiso_mejora") %>' />
        </div>
        
        <% If confirmable = True Then %> 
        <div>
            <asp:HyperLink ID="Link_confirmar" runat="server" NavigateUrl='<%# Eval("id_encuesta", "confirmarEvaluacion.aspx?evaluacion={0}") %>'>Confirmar evaluación</asp:HyperLink>
        </div>
        <% End If%>

        </ItemTemplate>
    </asp:FormView>

     <br /><br /><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/evaluacion/seleccionarEvaluado.aspx">Volver</asp:HyperLink>

    <asp:SqlDataSource ID="Source_VistaEncuesta" runat="server" ConnectionString="<%$ ConnectionStrings:cadenaConexion %>" 
    SelectCommand="SELECT dbo.Evaluacion_Encuesta.id_evaluador, dbo.Evaluacion_Encuesta.id_empleado, dbo.Evaluacion_Encuesta.fecha, dbo.Evaluacion_Encuesta.estado, dbo.Evaluacion_Encuesta.ano, dbo.Evaluacion_Encuesta.semestre, dbo.Evaluacion_Encuesta.id as id_encuesta, dbo.Evaluacion_Encuesta.G1_a1, dbo.Evaluacion_Encuesta.G1_a2, dbo.Evaluacion_Encuesta.G1_a3, dbo.Evaluacion_Encuesta.G1_a, dbo.Evaluacion_Encuesta.G1_b, dbo.Evaluacion_Encuesta.G1_b1, dbo.Evaluacion_Encuesta.G1_b2, dbo.Evaluacion_Encuesta.G1_b3, dbo.Evaluacion_Encuesta.G1_c, dbo.Evaluacion_Encuesta.G1_c1, dbo.Evaluacion_Encuesta.G1_c2, dbo.Evaluacion_Encuesta.G1_c3, dbo.Evaluacion_Encuesta.G1_promedio, dbo.Evaluacion_Encuesta.G2_a, dbo.Evaluacion_Encuesta.G2_a1, dbo.Evaluacion_Encuesta.G2_a2, dbo.Evaluacion_Encuesta.G2_a3, dbo.Evaluacion_Encuesta.G2_b, dbo.Evaluacion_Encuesta.G2_b1, dbo.Evaluacion_Encuesta.G2_b2, dbo.Evaluacion_Encuesta.G2_b3, dbo.Evaluacion_Encuesta.G2_c, dbo.Evaluacion_Encuesta.G2_c1, dbo.Evaluacion_Encuesta.G2_c2, dbo.Evaluacion_Encuesta.G2_c3, dbo.Evaluacion_Encuesta.G2_promedio, dbo.Evaluacion_Encuesta.observaciones, dbo.Evaluacion_Encuesta.compromiso_mejora, dbo.Evaluacion_Users.nombre + ' ' + dbo.Evaluacion_Users.apellidos AS Evaluador, dbo.Evaluacion_Users.cargo AS CargoEvaluador, Evaluacion_Users_1.nombre + ' ' + Evaluacion_Users_1.apellidos AS Evaluado, Evaluacion_Users_1.cargo AS CargoEvaluado FROM dbo.Evaluacion_Encuesta INNER JOIN dbo.Evaluacion_Users ON dbo.Evaluacion_Encuesta.id_evaluador = dbo.Evaluacion_Users.id INNER JOIN dbo.Evaluacion_Users AS Evaluacion_Users_1 ON dbo.Evaluacion_Encuesta.id_empleado = Evaluacion_Users_1.id WHERE (dbo.Evaluacion_Encuesta.id = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="evaluacion" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>