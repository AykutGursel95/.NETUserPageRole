<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="UserRoleTesting.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>aykutgursel@gmail.com</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="scripts/jquery-3.0.0.js"></script>
    <script src="scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="float: right">
            <a href="Login.aspx" class="btn btn-light">Çıkış Yap</a>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Menü</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Anasayfa <span class="sr-only">(current)</span></a>
                    </li>
                    <asp:Repeater ID="rptMenu" runat="server">
                        <itemtemplate>
                            <li class="nav-item">
                                <a class="nav-link" href="<%# Eval("PageURL") %>">   <%# Eval("PageName") %></a>
                            </li>
                        </itemtemplate>
                    </asp:Repeater>

                    
                  
                </ul>
            </div>
        </nav>

    </div>
    </form>
</body>
</html>
