<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="evaluacion_usuarios.aspx.vb" Inherits="SistemaEvaluacion.evaluacion_usuarios" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <script type="text/javascript" src="<%= ResolveUrl("~/Scripts/funciones_evaluacion.js") %>"></script>
    	<form method="post" action="">
    		<asp:HiddenField runat="server" ID="id_empleado" />
               		
            <div class = "evaluar_t_title">
            	Datos del Evaluado
            </div>
            <table class = "evaluar_t1">
            	<tr>
                	<td class = "evaluar_t1_cab">
                    	Nombre: 
                    </td>
                    <td class = "evaluar_t1_dato">
                    	<%= nombre_evaluado%>
                    </td>
                </tr>
            	<tr>
                	<td class = "evaluar_t1_cab">
                    	Cargo: 
                    </td>
                    <td class = "evaluar_t1_dato">
	                    <%= cargo_evaluado%>
                    </td>
                </tr>
                <tr>
                	<td class = "evaluar_t1_cab">
                    	Periodo de evaluaci&oacute;n:
                    </td>
                    <td class = "evaluar_t1_dato">
                    	<%= Session("ano").ToString + " " + Session("semestre").ToString %>
                    </td>
                </tr>
            	<tr>
                	<td class = "evaluar_t1_cab">
                    	Fecha de evaluaci&oacute;n:
                    </td>
                    <td class = "evaluar_t1_dato">
                    	<%= DateTime.Today.ToString("dd-12-2015") %>
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
                    	REGULAR
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
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a1"  value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a1"  value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a1" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a1" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a1" value="1" />
                    </td>
                	<td class = "casilla_nota">
                    	<asp:TextBox runat="server" ReadOnly="true" ID="g1_a1_nota" CssClass="nota_input"></asp:TextBox>
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.2
                    </td>
                	<td class = "t2_pregunta">
                    	Presentaci&oacute;n de los trabajos encargados
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a2" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a2" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a2" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a2" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a2" value="1" />
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_a2_nota" CssClass="nota_input"></asp:TextBox>                
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.3
                    </td>
                	<td class = "t2_pregunta">
                    	Producto generado a través de trabajo de altura a las instrucciones percibidas.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a3" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a3" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a3" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a3" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a3" value="1" />
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_a3_nota" CssClass="nota_input"></asp:TextBox>
                    </td>                                                                                                                                            
                </tr>
				<tr>
                	<td class = "t2_subcab">
                    	a.4
                    </td>
                	<td class = "t2_pregunta">
                    	Necesidad de Supervisión (incidencia en el trabajo)
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a4" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a4" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a4" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a4" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_a4" value="1" />
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_a4_nota" CssClass="nota_input"></asp:TextBox>
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (a.1 + a.2 + a.3 + a.4) / 4
                    </td>
                	<td class = "casilla_nota_sub">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_a_nota" CssClass="nota_input"></asp:TextBox>                  
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
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b1" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b1" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b1" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b1" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b1" value="1" />
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_b1_nota" CssClass="nota_input"></asp:TextBox>    
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.2
                    </td>
                	<td class = "t2_pregunta">
                    	Capacidad de realizar tareas no programadas
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b2" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b2" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b2" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b2" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b2" value="1" />
                    </td>
                	<td class = "casilla_nota">
                    	<asp:TextBox runat="server" ReadOnly="true" ID="g1_b2_nota" CssClass="nota_input"></asp:TextBox>                  
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.3
                    </td>
                	<td class = "t2_pregunta">
                    	Iniciativa para enfrentar el trabajo encomendado o para solucionar problemas que se le presentan
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b3" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b3" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b3" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b3" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b3" value="1" />
                    </td>
                	<td class = "casilla_nota">
                    	<asp:TextBox runat="server" ReadOnly="true" ID="g1_b3_nota" CssClass="nota_input"></asp:TextBox>                     
                    </td>                                                                                                                                            
                </tr>
				<tr>
                	<td class = "t2_subcab">
                    	b.4
                    </td>
                	<td class = "t2_pregunta">
                    	Demuestra energía y entusiasmo en el trabajo al que está asignado.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b4" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b4" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b4" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b4" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_b4" value="1" />
                    </td>
                	<td class = "casilla_nota">
                    	<asp:TextBox runat="server" ReadOnly="true" ID="g1_b4_nota" CssClass="nota_input"></asp:TextBox>                     
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (b.1 + b.2 + b.3 + b.4) / 4
                    </td>
                	<td class="casilla_nota_sub">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_b_nota" CssClass="nota_input" value="-"></asp:TextBox>                      
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
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c1" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c1" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c1" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c1" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c1" value="1" />
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_c1_nota" CssClass="nota_input"></asp:TextBox>                        
                    </td>                                                                                                                                            
                </tr>
                <tr>
                	<td class = "t2_subcab">
                    	c.2.
                    </td>
                	<td class = "t2_pregunta">
                    	Aprovechamiento del tiempo
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c2" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c2" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c2" value="3" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c2" value="2" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c2" value="1" />
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_c2_nota" CssClass="nota_input"></asp:TextBox>                     
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	c.3.
                    </td>
                	<td class = "t2_pregunta">
                    	Capacidad de organizaci&oacute;n y planificaci&oacute;n.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c3" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c3" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c3" value="3" />                    	
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c3" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c3" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_c3_nota" CssClass="nota_input"></asp:TextBox>                      
                    </td>                                                                                                                                            
                </tr>
				<tr>
                	<td class = "t2_subcab">
                    	c.4.
                    </td>
                	<td class = "t2_pregunta">
                    	Se adapta a los requerimientos de fechas planificadas por supervisión de su área.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c4" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c4" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c4" value="3" />                    	
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c4" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g1_c4" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_c4_nota" CssClass="nota_input"></asp:TextBox>                      
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (c.1 + c.2 + c.3 + c.4) / 4
                    </td>
                	<td class="casilla_nota_sub">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_c_nota" CssClass="nota_input" value = "-"></asp:TextBox>    
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
                        <asp:TextBox runat="server" ReadOnly="true" ID="g1_nota" CssClass="nota_input" value = "-"></asp:TextBox>    
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
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a1" value="5" />                                        
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a1" value="4" />                                        
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a1" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a1" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a1" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_a1_nota" CssClass="nota_input"></asp:TextBox>                      
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.2
                    </td>
                	<td class = "t2_pregunta">
                    	Comparte con sus pares los conocimientos adquiridos
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a2" value="5" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a2" value="4" />                                        
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a2" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a2" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a2" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_a2_nota" CssClass="nota_input"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	a.3
                    </td>
                	<td class = "t2_pregunta">
                    	Disposici&oacute;n para colaborar con sus compa&ntilde;eros
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a3" value="5" />
                    </td>
                	<td class = "casilla_radio">
                       	<input type="radio" name="g2_a3" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a3" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a3" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a3" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_a3_nota" CssClass="nota_input"></asp:TextBox>                         
                    </td>                                                                                                                                            
                </tr>
				<tr>
                	<td class = "t2_subcab">
                    	a.4
                    </td>
                	<td class = "t2_pregunta">
                    	Muestra asertividad, empatía, sociabilidad, amabilidad y respeto en el trato con sus pares.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a4" value="5" />
                    </td>
                	<td class = "casilla_radio">
                       	<input type="radio" name="g2_a4" value="4" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a4" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a4" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_a4" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_a4_nota" CssClass="nota_input"></asp:TextBox>                         
                    </td>                                                                                                                                            
                </tr>
				
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (a.1 + a.2 + a.3 + a.4) / 4
                    </td>
                	<td class = "casilla_nota_sub">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_a_nota" CssClass="nota_input" value="-"></asp:TextBox>                       
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
                    	Inter&eacute;s por conocer y aplicar nuevos métodos, técnicas o procedimientos de trabajo.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b1" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b1" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b1" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b1" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b1" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_b1_nota" CssClass="nota_input"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.2
                    </td>
                	<td class = "t2_pregunta">
                    	Inter&eacute;s por asumir mayores responsabilidades.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b2" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b2" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b2" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b2" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b2" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_b2_nota" CssClass="nota_input"></asp:TextBox>                        
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	b.3
                    </td>
                	<td class = "t2_pregunta">
                    	Flexibilidad y adaptabilidad frente a los cambios.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b3" value="5" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b3" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b3" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b3" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b3" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_b3_nota" CssClass="nota_input"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>
				<tr>
                	<td class = "t2_subcab">
                    	b.4
                    </td>
                	<td class = "t2_pregunta">
                    	Atenci&oacute;n de requerimientos de usuarios
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b4" value="5" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b4" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b4" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b4" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_b4" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_b4_nota" CssClass="nota_input"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>
          		<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (b.1 + b.2 + b.3 + b.4) / 4
                    </td>
                	<td class="casilla_nota_sub">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_b_nota" CssClass="nota_input" value="-"></asp:TextBox>                       
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
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c1" value="5" />
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c1" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c1" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c1" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c1" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_c1_nota" CssClass="nota_input"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>
                <tr>
                	<td class = "t2_subcab">
                    	c.2.
                    </td>
                	<td class = "t2_pregunta">
                    	Calidad de dominio de su trabajo
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c2" value="5" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c2" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c2" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c2" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c2" value="1" />                    
                    </td>
                	<td class = "casilla_nota">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_c2_nota" CssClass="nota_input"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td class = "t2_subcab">
                    	c.3.
                    </td>
                	<td class = "t2_pregunta">
                    	Apoyo a sus pares o a la jefatura
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c3" value="5" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c3" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c3" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c3" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c3" value="1" />                    
                    </td>
                	<td class = "casilla_nota"> 
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_c3_nota" CssClass="nota_input"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>
				<tr>
                	<td class = "t2_subcab">
                    	c.4.
                    </td>
                	<td class = "t2_pregunta">
                    	Interés por perfeccionarse y mantenerse actualizado en temáticas propias de su disciplina.
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c4" value="5" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c4" value="4" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c4" value="3" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c4" value="2" />                    
                    </td>
                	<td class = "casilla_radio">
                    	<input type="radio" name="g2_c4" value="1" />                    
                    </td>
                	<td class = "casilla_nota"> 
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_c4_nota" CssClass="nota_input"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (c.1 + c.2 + c.3 + c.4) / 4
                    </td>
                	<td class="casilla_nota_sub">
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_c_nota" CssClass="nota_input" value="-"></asp:TextBox>                        
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
                        <asp:TextBox runat="server" ReadOnly="true" ID="g2_nota" CssClass="nota_input" value="-"></asp:TextBox>                       
                    </td>                                                                                                                                            
                </tr>          
         </table>
   
   		<div class = "obs_titulo">
        	OBSERVACIONES GENERALES
        </div>
        <asp:TextBox ID="observaciones" TextMode="MultiLine" runat="server" CssClass="text_observaciones" placeholder="Describa alg&uacute;n aspecto a destacar en el funcionario o que considere la evaluaci&oacute;n no da cuenta de ello."></asp:TextBox>

        <div class = "obs_titulo">
        	COMPROMISO DE MEJORA
        </div>
        <asp:TextBox ID="compromiso_mejora" TextMode="MultiLine" runat="server" CssClass="text_observaciones" placeholder="Respuesta obligatoria"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" CssClass="enviar_evaluacion" 
                Text="Enviar Evaluación" />
&nbsp;</form><br />
        
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/evaluacion/seleccionarEvaluado.aspx">Volver (la evaluación no se guardará)</asp:HyperLink>


        <div class = "div_barra">
	        <hr class="barra_evaluacion" />
    	</div>
            
        <div class = "aclaracion_tit">
        	Notas para el evaluador:
        </div>
        
        <ol>
        	<li class="aclaracion_item">
            	Al evaluar, conc&eacute;ntrese estrictamente en el periodo que se ha establecido para apreciar el rendimiento del trabajador.
            </li>
            <li class="aclaracion_item">
            	Lea cuidadosamente el significado de los rangos de evaluaci&oacute;n indicados en el cuadro: Rangos de Evaluaci&oacute;n y Puntaje.
            </li>
            <li class="aclaracion_item">
            	H&aacute;gase el prop&oacute;sito de dejar observaciones que faciliten la retroalimentaci&oacute;n del sistema.
            </li>
        </ol>
        
        <table class = "tabla_rangos">
        	<tr>
            	<td colspan="3" class = "rangos_cab">
                	RANGOS DE EVALUACI&Oacute;N Y PUNTAJE
                </td>
            </tr>
        	<tr>
            	<td class = "rangos_valor">
                	5
                </td>
                <td class="rangos_nombre">
                	MUY BUENO
                </td>
                <td class="rangos_desc">
                	El rasgo, cualidad o competencia evaluada est&aacute; extraordinariamente desarrollada en el comportamiento del trabajador o acad&eacute;mico, <strong>excediendo los requerimientos que exige el desarrollo del cargo.</strong>
                </td>
            </tr>
        	<tr>
            	<td class="rangos_valor">
                	4
                </td>
                <td class="rangos_nombre">
                	BUENO
                </td>
                <td class="rangos_desc">
                	El rasgo, cualidad o competencia evaluada se presenta de manera notoria, <strong>satisfaciendo completamente los requerimientos exigidos para el desarrollo del cargo.</strong>
                </td>
            </tr>
            <tr>
            	<td class="rangos_valor">
                	3
                </td>
                <td class="rangos_nombre">
                	REGULAR
                </td>
                <td class="rangos_desc">
                	El rasgo, cualidad o competencia evaluada tiene un desarrollo normal y es observable en el comportamiento del trabajador o acad&eacute;mico. <strong>Generalmente satisface los requerimentos del cargo.</strong>
                </td>
            </tr>
        	<tr>
            	<td class="rangos_valor">
                	2
                </td>
                <td class="rangos_nombre">
                	INSUFICIENTE
                </td>
                <td class="rangos_desc">
                	El rasgo, cualidad o competencia evaluada se presenta en forma medianamente desarrollada de manera ocasional en el comportamiento del titular del cargo. <strong>Su desempe&ntilde;o es inferior a los requerimientos que exige el desarrollo de su cargo.</strong>
                </td>
            </tr>
        	<tr>
            	<td class="rangos_valor">
                	1
                </td>
                <td class="rangos_nombre">
                	DEFICIENTE
                </td>
                <td class="rangos_desc">
                	El rasgo, cualidad o competencia evaluada se presenta de forma incipiente o poco desarrollada en el comportamiento del trabajador o acad&eacute;mico. <strong>No cumple con los requerimientos que exige el desarrollo del cargo.</strong>
                </td>
            </tr>                        
        </table>    
    


</asp:Content>