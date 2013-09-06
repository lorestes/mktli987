using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Financeiro
{
    public partial class FinHistoricoDetalhes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Cadastros/Financeiro/FinHistoricoDefault.aspx");
        }

        protected void frwNovoHistorico_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("/Cadastros/Financeiro/FinHistoricoDefault.aspx");
        }
    }
}