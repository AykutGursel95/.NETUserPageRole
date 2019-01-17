using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserRoleTesting
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Session["User"] = null;
        }

        protected void brnLogin_Click(object sender, EventArgs e)
        {
            using (AykutSoftEntities db = new AykutSoftEntities())
            {
                var userControl = db.Users.Any(x => x.UserName == txtUserName.Text && x.Password == txtPassword.Text);

                if (userControl)
                {
                    Session["User"] = txtUserName.Text;
                    Response.Redirect("Homepage.aspx");
                }



            }
        }
    }
}