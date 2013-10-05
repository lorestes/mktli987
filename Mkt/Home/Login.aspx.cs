using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Home
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            string usuario = TextBoxUsuario.Text;
            string senha = TextBoxSenha.Text;

            if (Membership.ValidateUser(usuario, senha))
            {
                FormsAuthentication.SetAuthCookie(usuario, true);
                Response.Redirect("~/Home");
            }
            else
            {

            }

            //Como criar uma Role
            //Roles.CreateRole("sfdsa");
        }
    }
}