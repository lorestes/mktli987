<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Detalhes.aspx.cs" Inherits="Mkt.Financeiro.Pagar.Detalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Documento a Pagar</h2>
    <p>Utilize o formulário abaixo para visualizar e editar todas as informações sobre o Documento a Pagar.</p>
    <br />
     <asp:FormView ID="frwNovoDoc" RenderOuterTable="False" runat="server" OnItemUpdated="frwNovoDoc_ItemUpdated" DataKeyNames="cod_fin" DataSourceID="sqlDoc" DefaultMode="Edit">
        <EditItemTemplate>
            <form class="form-inline">
            <fieldset>
                <label><h4>Detalhes do Documento:</h4></label>
                <asp:HiddenField ID="hdncodfin" Value='<%# Bind("cod_fin") %>' runat="server" />
                <label>Fornecedor</label>
                <asp:DropDownList ID="fornecDDL" DataValueField="cod_fornec" DataTextField="nom_fornec" runat="server" DataSourceID="sqlFornec"></asp:DropDownList>
                <label>Histórico</label>
                <asp:DropDownList ID="historicoDDL" DataValueField="cod_hist" DataTextField="descricao" runat="server" DataSourceID="sqlHistorico"></asp:DropDownList>
                <label>Documento</label>
                <asp:TextBox ID="documentoTextBox" runat="server" Text='<%# Bind("numdocumento") %>' />
                <label>Emissão</label>
                <asp:TextBox ID="emissaoTextBox" runat="server" Text='<%# Bind("dt_emissao") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="emissaoTextBox" runat="server" ErrorMessage="Emissão deve ser preenchido."></asp:RequiredFieldValidator>
                <label>Vencimento</label>
                <asp:TextBox ID="vencimentoTextBox" runat="server" Text='<%# Bind("dt_vencimento") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="vencimentoTextBox" runat="server" ErrorMessage="Vencimento deve ser preenchido."></asp:RequiredFieldValidator>
                <label>Valor</label>
                <asp:TextBox ID="valorTextBox" runat="server" Text='<%# Bind("vl_original") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="valorTextBox" runat="server" ErrorMessage="Valor deve ser preenchido."></asp:RequiredFieldValidator>
                <label>Observação</label>
                <asp:TextBox ID="obsTextBox" TextMode="MultiLine" style="width: 400px; height:100px; resize:none;" runat="server" Text='<%# Bind("obs") %>' />                

                <br /><br />
                <label><h4>Detalhes do Pagamento:</h4></label>
                <label>Tipo</label>
                <asp:DropDownList ID="StatusDropDownList" runat="server" Text='<%# Bind("status") %>' >
                    <asp:ListItem Selected ="True" Text ="Aberto" Value="ABERTO" />
                    <asp:ListItem Text ="Baixado" Value="BAIXADO" />
                    <asp:ListItem Text ="Cancelado" Value="CANCELADO" />
                </asp:DropDownList>
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
                    <div class="row-fluid">
                        <div class="span2">
                            <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Salvar" Style="margin-right: 20px;" SkinID="Salvar" />
                        </div>
                        <div class="span2">
                            <asp:LinkButton ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" SkinID="Cancelar" />
                        </div>
                    </div> 
            </fieldset>
            </form>
        </EditItemTemplate>
    </asp:FormView>
    
    <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT * FROM tab_finpagar WHERE cod_fin = @cod_fin" 
        UpdateCommand="UPDATE tab_finpagar
                        SET cod_fornec     = @cod_fornec,
                            cod_hist       = @cod_hist,
                            numdocumento   = @numdocumento,
                            dt_emissao     = @dt_emissao,
                            dt_vencimento  = @dt_vencimento,
                            vl_original    = @vl_original,
                            obs            = @observacao,
                            status         = @status,
                            dt_pagamento   = @dt_pagamento,
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
            <asp:ControlParameter ControlID="ctl00$contentPlaceHolder$frwNovoDoc$fornecDDL" Name="cod_fornec"  Type="Int32" />
            <asp:ControlParameter ControlID="ctl00$contentPlaceHolder$frwNovoDoc$TipoBxDDL" Name="cod_tpbaixa" Type ="Int32" />
            <asp:ControlParameter ControlID="ctl00$contentPlaceHolder$frwNovoDoc$historicoDDL" Name="cod_hist" Type="Int32" />
            <asp:Parameter Name="cod_fin"        Type="Int32" />
            <asp:Parameter Name="numdocumento"   Type="String" />
            <asp:Parameter Name="dt_emissao"     Type="String" />
            <asp:Parameter Name="dt_vencimento"  Type="String" />
            <asp:Parameter Name="vl_original"    Type="Decimal" />
            <asp:Parameter Name="observacao"     Type="String" />
            <asp:Parameter Name="status"         Type="String" />
            <asp:Parameter Name="dt_pagamento"   Type ="String" />
            <asp:Parameter Name="vl_juros"       Type="Decimal" />
            <asp:Parameter Name="vl_multa"       Type  ="Decimal" />
            <asp:Parameter Name="vl_despbanco"   Type="Decimal" />
            <asp:Parameter Name="vl_desconto"    Type="Decimal" />
            <asp:Parameter Name="vl_descpontual" Type="Decimal" />
            <asp:Parameter Name="num_cheque"     Type="Int32" />
            <asp:Parameter Name="vl_original"    Type="Decimal" />
        </UpdateParameters>
     </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlFornec" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT cod_fornec = cod_pessoa, nom_fornec = razaosocial FROM tab_pessoa (NOLOCK) WHERE tipo_pessoa IN ('F','A') and deletado = 0">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlHistorico" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT cod_hist, descricao FROM tab_finhistorico (NOLOCK) WHERE tipo = 'P' and deletado = 0">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTipo" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT cod_tipo, nom_tipo FROM tab_fintipobaixa (NOLOCK) WHERE deletado = 0">
    </asp:SqlDataSource>
    
</asp:Content>
