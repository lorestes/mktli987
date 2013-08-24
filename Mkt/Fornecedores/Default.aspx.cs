using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Fornecedores
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnProcurar_Click(object sender, EventArgs e)
        {
            sqlFornecedores.FilterExpression = "razaosocial LIKE '%{0}%' OR nom_fantasia LIKE '%{0}%'";
            sqlFornecedores.FilterParameters.Clear();
            sqlFornecedores.FilterParameters.Add("query", txtProcurar.Text);
            lvwFornecedores.DataBind();
        }
    }
}