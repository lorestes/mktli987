using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Financeiro.Pagar
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcurar_Click(object sender, EventArgs e)
        {
            sqlFinanceiro.FilterExpression = "razaosocial LIKE '%{0}%' OR razaosocial LIKE '%{0}%' OR numdocumento LIKE '%{0}%'";
            sqlFinanceiro.FilterParameters.Clear();
            sqlFinanceiro.FilterParameters.Add("query", txtProcurar.Text);
            lvwFinanceiro.DataBind();
        }
    }
}