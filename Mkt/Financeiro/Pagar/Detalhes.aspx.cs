﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Financeiro.Pagar
{
    public partial class Detalhes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frwNovoDoc_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("/Financeiro/Pagar");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Financeiro/Pagar");
        }
    }
}