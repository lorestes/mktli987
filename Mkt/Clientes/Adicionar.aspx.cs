using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Clientes
{
    public partial class Adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Clientes");
        }

        protected void frwNovoCliente_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/Clientes");
        }

    }
}