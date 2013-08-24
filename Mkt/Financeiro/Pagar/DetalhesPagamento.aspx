<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetalhesPagamento.aspx.cs" Inherits="Mkt.Financeiro.DetalhesPagamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Pagamento do Documento a Pagar</h2>
    <p>Utilize o formulário abaixo para Pagar e Estornar um Documento a Pagar.</p>
    <br />
     <asp:FormView ID="frwPagamento" RenderOuterTable="False" runat="server" DataKeyNames="cod_fin" DataSourceID="sqlDoc" DefaultMode="Edit">
        <EditItemTemplate>
            <form class="form-inline">
            <fieldset>
                <asp:HiddenField ID="hdncodfin" Value='<%# Bind("cod_fin") %>' runat="server" />
                <label>Data Pagamento</label>
                <asp:TextBox ID="pagamentoTextBox" runat="server" Text='<%# Bind("dt_pagamento") %>' />
                <label>Tipo Baixa</label>
                <asp:DropDownList ID="TipoBxDDL" DataValueField="cod_tipo" DataTextField="nom_tipo" runat="server" DataSourceID="sqlTipo"></asp:DropDownList>
                <label>Valor Juros</label>
                <asp:TextBox ID="jurosTextBox" runat="server" Text='<%# Bind("vl_juros") %>' />
                <label>Valor Multa</label>
                <asp:TextBox ID="multaTextBox" runat="server" Text='<%# Bind("vl_multa") %>' />
                <label>Valor Despesa Bancaria</label>
                <asp:TextBox ID="despbancoTextBox" runat="server" Text='<%# Bind("vl_despbanco") %>' />
                <label>Valor Desconto</label>
                <asp:TextBox ID="descontoTextBox" runat="server" Text='<%# Bind("vl_desconto") %>' />
                <label>Valor Desconto Pontualidade</label>
                <asp:TextBox ID="TextBox" runat="server" Text='<%# Bind("vl_descpontual") %>' />
                <label>Numero Cheque</label>
                <asp:TextBox ID="chequeTextBox" runat="server" Text='<%# Bind("num_cheque") %>' />
                <label>Valor Pago</label>
                <asp:TextBox ID="vl_pagoTextBox" runat="server" Text='<%# Bind("vl_baixado") %>' />
                <br /><br />
                <asp:LinkButton ID="btnBaixar"   runat="server" CausesValidation="True"  CommandName="Update" Text="Baixar"   CssClass ="btn btn-primary" style="margin-right: 20px;" />
                <asp:LinkButton ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-warning"  />
                <asp:LinkButton ID="btnEstornar" runat="server" CausesValidation="False" CommandName="Update" Text="Estornar" CssClass="btn btn-danger"   style="margin-left: 20px;" />
             </fieldset>
            </form>
        </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT * FROM tab_finpagar (NOLOCK) WHERE cod_fin = @cod_fin" 
        UpdateCommand="UPDATE tab_finpagar
                        SET dt_pagamento   = @dt_pagamento,
                            cod_tpbaixa    = @cod_tpbaixa,
                            vl_juros       = @vl_juros,
                            vl_multa       = @vl_multa,
                            vl_despbanco   = @vl_despbanco,
                            vl_desconto    = @vl_desconto,
                            vl_descpontual = @vl_descpontual,
                            num_cheque     = @num_cheque,
                            vl_baixado     = @vl_baixado
                        WHERE cod_fin = @cod_fin">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="cod_fin" QueryStringField="p" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_fin"        Type ="Int32" />
            <asp:Parameter Name="dt_pagamento"   Type ="String" />
            <asp:Parameter Name="cod_tpbaixa"    Type ="Int32" />
            <asp:Parameter Name="vl_juros"       Type="Decimal" />
            <asp:Parameter Name="vl_multa"       Type  ="Decimal" />
            <asp:Parameter Name="vl_despbanco"   Type="Decimal" />
            <asp:Parameter Name="vl_desconto"    Type="Decimal" />
            <asp:Parameter Name="vl_descpontual" Type="Decimal" />
            <asp:Parameter Name="num_cheque"     Type="Int32" />
            <asp:Parameter Name="vl_original"    Type="Decimal" />
        </UpdateParameters>
     </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTipo" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT cod_tipo, nom_tipo FROM tab_fintipobaixa (NOLOCK) WHERE deletado = 0">
    </asp:SqlDataSource>
</asp:Content>
