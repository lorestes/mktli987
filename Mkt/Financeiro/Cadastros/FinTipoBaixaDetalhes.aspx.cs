using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Financeiro
{
    public partial class FinTipoBaixaDetalhes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Financeiro/Cadastros//FinTipoBaixaDefault.aspx");
        }

        protected void frwNovoTipo_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("~/Financeiro/Cadastros//FinTipoBaixaDefault.aspx");
        }
    }
}