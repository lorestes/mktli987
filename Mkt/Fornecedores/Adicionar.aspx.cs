﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mkt.Fornecedores
{
    public partial class Adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Fornecedores");
        }

        protected void frwNovoFornecedor_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/Fornecedores");
        }
    }
}