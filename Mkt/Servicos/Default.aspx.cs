using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Serviços
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcurar_Click(object sender, EventArgs e)
        {
            sqlServico.FilterExpression = "des_servico LIKE '%{0}%' ";
            sqlServico.FilterParameters.Clear();
            sqlServico.FilterParameters.Add("query", txtProcurar.Text);
            lvwServico.DataBind();
        }
    }
}