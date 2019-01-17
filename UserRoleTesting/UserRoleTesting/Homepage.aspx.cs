using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserRoleTesting
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
                Response.Redirect("Login.aspx");

            var userName = Session["User"];
            using (AykutSoftEntities db = new AykutSoftEntities())
            {
                var menuList = (from u in db.Users
                                join ur in db.UserRoles on u.Id equals ur.UserId
                                join pr in db.PageRoles on ur.RoleId equals pr.RoleId
                                join p in db.Pages on pr.PageId equals p.Id
                                where  u.UserName == userName
                                select new
                                {
                                    PageName = p.PageName,
                                    PageURL = p.PageURL
                                }).ToList();

                rptMenu.DataSource = menuList;
                rptMenu.DataBind();
            }

        }
    }
}