<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UserRoleTesting.Login" %>

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
    <div style="margin: 15px">
        
            <div class="form-group">
                <asp:TextBox ID="txtUserName"  class="form-control" placeholder="Kullanıcı Adı"  runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPassword" class="form-control" TextMode="Password"  placeholder="Parola" runat="server"></asp:TextBox>
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" />
                <label class="form-check-label" for="exampleCheck1">Hatırla</label>
            </div>
            <asp:Button ID="brnLogin"  class="btn btn-primary" runat="server" Text="Giriş Yap" OnClick="brnLogin_Click" />
    </div>
    </form>
</body>
</html>
