using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Contatos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcurar_Click(object sender, EventArgs e)
        {
            sqlContato.FilterExpression = "nom_contato LIKE '%{0}%' ";
            sqlContato.FilterParameters.Clear();
            sqlContato.FilterParameters.Add("query", txtProcurar.Text);
            lvwContatos.DataBind();
        }
    }
}