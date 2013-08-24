using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Financeiro
{
    public partial class FinTipoBaixaDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcurar_Click(object sender, EventArgs e)
        {
            sqlTipo.FilterExpression = "nom_tipo LIKE '%{0}%'";
            sqlTipo.FilterParameters.Clear();
            sqlTipo.FilterParameters.Add("query", txtProcurar.Text);
            lvwTipo.DataBind();
        }
    }
}