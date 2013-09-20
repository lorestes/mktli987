using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Usuarios
{
    public partial class Adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios");
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            Membership.CreateUser(UserName.Text, Password.Text, Email.Text);
            Response.Redirect("~/Usuarios");
        }
    }
}