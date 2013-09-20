using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Financeiro
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnProcurar_Click(object sender, EventArgs e)
        {
            sqlHistorico.FilterExpression = "descricao LIKE '%{0}%'";
            sqlHistorico.FilterParameters.Clear();
            sqlHistorico.FilterParameters.Add("query", txtProcurar.Text);
            lvwHistorico.DataBind();
        }
    }
}