using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Web.Security;          

namespace Mkt.Cidades
{
    public partial class Detalhes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string estado = ((HiddenField)frwNovoCidade.FindControl("hdnCodEstado")).Value;
            ((DropDownList)frwNovoCidade.FindControl("ufDDL")).Items.FindByValue(estado).Selected = true;
        }

     

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
                Response.Redirect("~/Cidades");
            
        }

        protected void frwNovoCidade_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("~/Cidades");
        }

    }
}