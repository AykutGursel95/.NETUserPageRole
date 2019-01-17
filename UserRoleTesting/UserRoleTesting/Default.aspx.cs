using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserRoleTesting
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (AykutSoftEntities db = new AykutSoftEntities())
            {
                if (!Page.IsPostBack)
                {
                    rdlUsers.DataSource = db.Users.Select(x => x.UserName).ToList();
                    rdlUsers.DataBind();

                    cblRoles.DataSource = db.Roles.Select(x => x.Name).ToList();
                    cblRoles.DataBind();
                }

                userName = rdlUsers.SelectedValue;
            }

        }

        private string userName;
        protected void rdlUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            cblRoles.ClearSelection();
            Label1.Text = "Seçili Kullanıcı "+ userName;

            using (AykutSoftEntities db = new AykutSoftEntities())
            {
                var userRoles = (from r in db.Roles
                                 join ur in db.UserRoles on r.Id equals ur.RoleId
                                 join u in db.Users on ur.UserId equals u.Id
                                 where u.UserName == userName
                                 select new
                                 {
                                     roleName = r.Name
                                 }).ToList();

                List<ListItem> cblList = cblRoles.Items.Cast<ListItem>().ToList();

                foreach (var cb in cblList)
                {
                    foreach (var userRole in userRoles)
                    {
                        if (cb.Text == userRole.roleName)
                        {
                            cb.Selected = true;
                            break;
                        }
                        else
                        {
                            cb.Selected = false;
                        }
                    }
                }


            }

        }

        protected void cblRoles_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSaveRole_Click(object sender, EventArgs e)
        {
            if (rdlUsers.SelectedIndex == -1)
            {
                Literal1.Text= "<div class='alert alert-secondary' role='alert'>"+
                "Lütfen Kullanıcı Seçimi Yapın!"+
                "</ div >";
                return;
            }
            else
            {
                Literal1.Text = "<div class='alert alert-success' role='alert'>" +
                                "Başarılı" +
                                "</ div >";

                using (AykutSoftEntities db = new AykutSoftEntities())
                {
                    var userId = db.Users.Where(x => x.UserName == userName).Select(u => u.Id).First();

                    var deleteUserRoles = db.UserRoles.Where(x => x.UserId == userId).ToList();
                    db.UserRoles.RemoveRange(deleteUserRoles);
                    db.SaveChanges();

                    for (int i = 0; i < cblRoles.Items.Count; i++)
                    {
                        if (cblRoles.Items[i].Selected)
                        {
                            string roleName = cblRoles.Items[i].Value;
                            var selectedRoleId = db.Roles.Where(x => x.Name == roleName).Select(s => s.Id).First();
                            UserRoles ur = new UserRoles()
                            {
                                RoleId = selectedRoleId,
                                UserId = userId,
                                CreateDate = DateTime.Now
                            };

                            db.UserRoles.Add(ur);
                        }
                    }
 
                    db.SaveChanges();

                }

                cblRoles.ClearSelection();
                rdlUsers.ClearSelection();
                Label1.Text = string.Empty;
                return;
            }
        }
    }
}