<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserRoleTesting.Default" %>

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
    <div style="margin: 10px;">
        <div style="float:left">
            &nbsp;<b><asp:Label ID="Label1" runat="server" Text=""></asp:Label></b>
        </div>
        <div style="float:right">
            <a href="Login.aspx" class="btn btn-light">Giriş Yap</a>
        </div>
        <br/>

        <p>
          
            <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Kullanıcılar
            </a>
         <%--   <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                Roller
            </button>--%>
            
        </p>
        <div class="collapse" id="collapseExample">
            <div class="card card-body">
                <asp:RadioButtonList ID="rdlUsers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdlUsers_SelectedIndexChanged"></asp:RadioButtonList>
            </div>
        </div><br/>
        <div >
            <div class="card card-body">
                <asp:CheckBoxList ID="cblRoles" runat="server" OnSelectedIndexChanged="cblRoles_SelectedIndexChanged"></asp:CheckBoxList>
            </div>
        </div>
        
        <br/>
        
        <asp:Button ID="btnSaveRole" CssClass="btn btn-success" runat="server" Text="Rolleri Kaydet" Width="260px" OnClick="btnSaveRole_Click" />

        <br />
        <br />
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>

    </div>
    </form>
</body>
</html>
