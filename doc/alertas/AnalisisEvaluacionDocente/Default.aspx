<%@ Page Title="Inicio" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h1>Sistema de evaluación docente</h1>
    <p>Este sistema permite ver los resultados de las encuestas:</p>
    <ul>
        <li>Evaluación Docente de Estudiantes</li>
        <li>Autoevaluación Docente</li>
        <%If (Session("nivel") = "0" Or Session("nivel") = "1" Or Session("nivel") = "2") Then%>
            <li>Evaluación Jefes de Carrera</li>
        <%End If%>
    </ul>
</asp:Content>
