using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Mkt
{
    public class BootstrapFormView : FormView
    {
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            this.Controls.Add(new HtmlForm());
            //writer.WriteLine("<form class=\"form form-horizontal\" >");
            base.Render(writer);
            //writer.WriteLine("</form>");
        }

    }
}