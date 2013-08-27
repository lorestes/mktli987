using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Cidades
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcurar_Click(object sender, EventArgs e)
        {
            sqlCidade.FilterExpression = "nom_cidade LIKE '%{0}%'";
            sqlCidade.FilterParameters.Clear();
            sqlCidade.FilterParameters.Add("query", txtProcurar.Text);
            lvwCidades.DataBind();
        }

        protected void lvwCidades_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}