<%@ Page Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="RevisionArchivos3.aspx.cs" Inherits="AutoPostulacion.RevisionArchivos3" %>

<asp:Content ID="RevisionArchivo3" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="Content/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="Content/dashboard.css" />
    <script src="Scripts/jquery-1.11.2.js"></script>
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Content/jquery.dataTables.min.css"></script>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 8pt;
        }

        table {
            border: 1px solid #ccc;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border-color: #ccc;
            }
    </style>
    <div class="container-fluid">
        <div class="row">
            <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
                <h1 style="border-color: rgb(135, 103, 91) rgb(135, 103, 91) rgb(149, 112, 99) !important;">Dashboard</h1>

                <section class="row text-center placeholders">
                    <div class="col-6 col-sm-3 placeholder">
                        <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail" style="filter: saturate(0.9) brightness(0.8);">
                        <h4>Label</h4>
                        <div class="text-muted" style="color: rgb(210, 194, 188) !important;">Something else</div>
                    </div>
                </section>

                <h2>Registros</h2>
                <div class="table table-striped">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                </div>
            </main>
        </div>
    </div>
</asp:Content>