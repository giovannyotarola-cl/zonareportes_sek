<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ver_evaluacion.aspx.vb" Inherits="SistemaEvaluacion.ver_evaluacion" MasterPageFile="~/Site.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="<%= ResolveUrl("~/Scripts/visor_evaluacion.js") %>"></script>
    <div class="frmEvaluacion">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="Source_VistaEncuesta" CssClass="frmEvaluacion">
        <ItemTemplate>
            <div class = "evaluar_t_title">
                Datos del Evaluado
            </div>
            <table class = "evaluar_t1 tablaSinBordes" border="0">
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
                        <asp:Label ID="PeriodoEvaluadoLabel" runat="server" Text='<%# Bind("periodo")%>' ></asp:Label>
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
                    	Presentaci&oacute;n de los trabajos encargados
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
                    	Producto generado a través de trabajo de altura a las instrucciones percibidas. 
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
                	<td class = "t2_subcab">
                    	a.4
                    </td>
                	<td class = "t2_pregunta">
                    	Necesidad de Supervisi&oacute;n (independencia en el trabajo)
                    </td>
                	<td class = "casilla_radio"  id="1_a4_5">
                    </td>
                	<td class = "casilla_radio" id="1_a4_4">
                    </td>
                	<td class = "casilla_radio"  id="1_a4_3">
                    </td>
                	<td class = "casilla_radio"  id="1_a4_2">
                    </td>
                	<td class = "casilla_radio"  id="1_a4_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G1_a4Label" runat="server" Text='<%# Bind("G1_a4") %>' />
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (a.1 + a.2 + a.3 + a.4) / 4
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
                	<td class = "t2_subcab">
                    	b.4
                    </td>
                	<td class = "t2_pregunta">
                    	Demuestra energía y entusiasmo en el trabajo al que está asignado.
                    </td>
                	<td class = "casilla_radio" id="1_b4_5">
                    </td>
                	<td class = "casilla_radio" id="1_b4_4">
                    </td>
                	<td class = "casilla_radio" id="1_b4_3">
                    </td>
                	<td class = "casilla_radio" id="1_b4_2">
                    </td>
                	<td class = "casilla_radio" id="1_b4_1">
                    </td>
                	<td class = "casilla_nota">
                    	<asp:Label ID="G1_b4Label" runat="server" Text='<%# Bind("G1_b4") %>' />                    
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (b.1 + b.2 + b.3 + b.4) / 4
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
                    	Capacidad de organización y planificación.
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
                	<td class = "t2_subcab">
                    	c.4.
                    </td>
                	<td class = "t2_pregunta">
                    	Se adapta a los requerimientos de fechas planificadas por supervisión de su área.
                    </td>
                	<td class = "casilla_radio" id="1_c4_5">
                    </td>
                	<td class = "casilla_radio" id="1_c4_4">
                    </td>
                	<td class = "casilla_radio" id="1_c4_3">
                    </td>
                	<td class = "casilla_radio" id="1_c4_2">
                    </td>
                	<td class = "casilla_radio" id="1_c4_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G1_c4Label" runat="server" Text='<%# Bind("G1_c4") %>' />                   
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (c.1 + c.2 + c.3 + c.4) / 4
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
                	<td class = "t2_subcab">
                    	a.4
                    </td>
                	<td class = "t2_pregunta">
                    	Muestra asertividad, empatía, sociabilidad, amabilidad y respeto en el trato con sus pares.
                    </td>
                	<td class = "casilla_radio" id="2_a4_5">
                    </td>
                	<td class = "casilla_radio" id="2_a4_4">
                    </td>
                	<td class = "casilla_radio" id="2_a4_3">
                    </td>
                	<td class = "casilla_radio" id="2_a4_2">
                    </td>
                	<td class = "casilla_radio" id="2_a4_1">
                    </td>
                	<td class = "casilla_nota">
                        <asp:Label ID="G2_a4Label" runat="server" Text='<%# Bind("G2_a4") %>' />                        
                    </td>                                                                                                                                            
                </tr>
            	<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (a.1 + a.2 + a.3 + a.4) / 4
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
                    	nterés por conocer y aplicar nuevos métodos, técnicas o procedimientos de trabajo. 
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
                    	Interés por asumir mayores responsabilidades. 
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
                    	Flexibilidad y adaptabilidad frente a los cambios. 
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
                	<td class = "t2_subcab">
                    	b.4
                    </td>
                	<td class = "t2_pregunta">
                    	Atención de requerimientos de usuarios.
                    </td>
                	<td class = "casilla_radio" id="2_b4_5">
                    </td>
                	<td class = "casilla_radio" id="2_b4_4">
                    </td>
                	<td class = "casilla_radio" id="2_b4_3">                  	                
                    </td>
                	<td class = "casilla_radio" id="2_b4_2">
                    </td>
                	<td class = "casilla_radio" id="2_b4_1">                 	                   
                    </td>
                	<td class = "casilla_nota">
                       <asp:Label ID="G2_b4Label" runat="server" Text='<%# Bind("G2_b4") %>' />                     
                    </td>                                                                                                                                            
                </tr>
          		<tr>
                	<td colspan="5">
                    </td>
                	<td colspan="2" class = "casilla_subfactor">
                    	Promedio Subfactor<br /> (b.1 + b.2 + b.3 + b.4) / 4
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
                    	Calidad de dominio de su trabajo 
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
                	<td class = "t2_subcab">
                    	c.4.
                    </td>
                	<td class = "t2_pregunta">
                    	Interés por perfeccionarse y mantenerse actualizado en temáticas propias de su disciplina. 
                    </td>
                	<td class = "casilla_radio" id="2_c4_5">
                    </td>
                	<td class = "casilla_radio" id="2_c4_4">
                    </td>
                	<td class = "casilla_radio" id="2_c4_3">
                    </td>
                	<td class = "casilla_radio" id="2_c4_2">
                    </td>
                	<td class = "casilla_radio" id="2_c4_1">
                    </td>
                	<td class = "casilla_nota"> 
                        <asp:Label ID="G2_c4Label" runat="server" Text='<%# Bind("G2_c4") %>' />                      
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
        </ItemTemplate>
    </asp:FormView>
        <table class="tabla_rangos">
            <tr>
                <td colspan="3" class="rangos_cab">RANGOS DE EVALUACI&Oacute;N Y PUNTAJE
                </td>
            </tr>
            <tr>
                <td class="rangos_valor">5
                </td>
                <td class="rangos_nombre">MUY BUENO
                </td>
                <td class="rangos_desc">El rasgo, cualidad o competencia evaluada est&aacute; extraordinariamente desarrollada en el comportamiento del trabajador o acad&eacute;mico, <strong>excediendo los requerimientos que exige el desarrollo del cargo.</strong>
                </td>
            </tr>
            <tr>
                <td class="rangos_valor">4
                </td>
                <td class="rangos_nombre">BUENO
                </td>
                <td class="rangos_desc">El rasgo, cualidad o competencia evaluada se presenta de manera notoria, <strong>satisfaciendo completamente los requerimientos exigidos para el desarrollo del cargo.</strong>
                </td>
            </tr>
            <tr>
                <td class="rangos_valor">3
                </td>
                <td class="rangos_nombre">REGULAR
                </td>
                <td class="rangos_desc">El rasgo, cualidad o competencia evaluada tiene un desarrollo normal y es observable en el comportamiento del trabajador o acad&eacute;mico. <strong>Generalmente satisface los requerimentos del cargo.</strong>
                </td>
            </tr>
            <tr>
                <td class="rangos_valor">2
                </td>
                <td class="rangos_nombre">INSUFICIENTE
                </td>
                <td class="rangos_desc">El rasgo, cualidad o competencia evaluada se presenta en forma medianamente desarrollada de manera ocasional en el comportamiento del titular del cargo. <strong>Su desempe&ntilde;o es inferior a los requerimientos que exige el desarrollo de su cargo.</strong>
                </td>
            </tr>
            <tr>
                <td class="rangos_valor">1
                </td>
                <td class="rangos_nombre">DEFICIENTE
                </td>
                <td class="rangos_desc">El rasgo, cualidad o competencia evaluada se presenta de forma incipiente o poco desarrollada en el comportamiento del trabajador o acad&eacute;mico. <strong>No cumple con los requerimientos que exige el desarrollo del cargo.</strong>
                </td>
            </tr>
        </table>
    </div>
    <% If confirmable = True Then %> 
        <div>
            <asp:Button ID="btnAceptarEv" runat="server" Text="Aceptar Evaluación" CssClass="btnInputNuevo "/>
            <asp:Button ID="btnRechazarEv" runat="server" Text="Rechazar Evaluación" CssClass="btnInputNuevo "/>
        </div>
    <% End If%>
     <br /><br /><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/evaluacion/seleccionarEvaluado.aspx">Volver</asp:HyperLink>

    <asp:SqlDataSource ID="Source_VistaEncuesta" runat="server" ConnectionString="<%$ ConnectionStrings:cadenaConexion %>" 
    SelectCommand="SELECT dbo.SEK_EvDes_Encuesta.id_evaluador, dbo.SEK_EvDes_Encuesta.id_empleado, dbo.SEK_EvDes_Encuesta.fecha, dbo.SEK_EvDes_Encuesta.estado,CAST(dbo.SEK_EvDes_Encuesta.ano as varchar(4))+'-'+CAST(dbo.SEK_EvDes_Encuesta.semestre as varchar(1)) as periodo, dbo.SEK_EvDes_Encuesta.ano, dbo.SEK_EvDes_Encuesta.semestre, dbo.SEK_EvDes_Encuesta.id as id_encuesta, dbo.SEK_EvDes_Encuesta.G1_a1, dbo.SEK_EvDes_Encuesta.G1_a2, dbo.SEK_EvDes_Encuesta.G1_a3, dbo.SEK_EvDes_Encuesta.G1_a4, dbo.SEK_EvDes_Encuesta.G1_a, dbo.SEK_EvDes_Encuesta.G1_b, dbo.SEK_EvDes_Encuesta.G1_b1, dbo.SEK_EvDes_Encuesta.G1_b2, dbo.SEK_EvDes_Encuesta.G1_b3, dbo.SEK_EvDes_Encuesta.G1_b4, dbo.SEK_EvDes_Encuesta.G1_c, dbo.SEK_EvDes_Encuesta.G1_c1, dbo.SEK_EvDes_Encuesta.G1_c2, dbo.SEK_EvDes_Encuesta.G1_c3, dbo.SEK_EvDes_Encuesta.G1_c4, dbo.SEK_EvDes_Encuesta.G1_promedio, dbo.SEK_EvDes_Encuesta.G2_a, dbo.SEK_EvDes_Encuesta.G2_a1, dbo.SEK_EvDes_Encuesta.G2_a2, dbo.SEK_EvDes_Encuesta.G2_a3, dbo.SEK_EvDes_Encuesta.G2_a4, dbo.SEK_EvDes_Encuesta.G2_b, dbo.SEK_EvDes_Encuesta.G2_b1, dbo.SEK_EvDes_Encuesta.G2_b2, dbo.SEK_EvDes_Encuesta.G2_b3, dbo.SEK_EvDes_Encuesta.G2_b4, dbo.SEK_EvDes_Encuesta.G2_c, dbo.SEK_EvDes_Encuesta.G2_c1, dbo.SEK_EvDes_Encuesta.G2_c2, dbo.SEK_EvDes_Encuesta.G2_c3, dbo.SEK_EvDes_Encuesta.G2_c4, dbo.SEK_EvDes_Encuesta.G2_promedio, dbo.SEK_EvDes_Encuesta.observaciones, dbo.SEK_EvDes_Encuesta.compromiso_mejora, dbo.SEK_EvDes_Users.nombre AS Evaluador, dbo.SEK_EvDes_Users.cargo AS CargoEvaluador, SEK_EvDes_Users_1.nombre AS Evaluado, SEK_EvDes_Users_1.cargo AS CargoEvaluado FROM dbo.SEK_EvDes_Encuesta INNER JOIN dbo.SEK_EvDes_Users ON dbo.SEK_EvDes_Encuesta.id_evaluador = dbo.SEK_EvDes_Users.id INNER JOIN dbo.SEK_EvDes_Users AS SEK_EvDes_Users_1 ON dbo.SEK_EvDes_Encuesta.id_empleado = SEK_EvDes_Users_1.id WHERE (dbo.SEK_EvDes_Encuesta.id = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="evaluacion" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>