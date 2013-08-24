<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetalhesDocumento.aspx.cs" Inherits="Mkt.Financeiro.Pagar.DetalhesDocumento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Detalhes do Documento a Pagar</h2>
    <p>Utilize o formulário abaixo para visualizar e editar todas as informações sobre o Documento a Pagar.</p>
    <br />
     <asp:FormView ID="frwNovoDoc" RenderOuterTable="False" runat="server" DataKeyNames="cod_fin" DataSourceID="sqlDoc" DefaultMode="Edit">
        <EditItemTemplate>
            <form class="form-inline">
            <fieldset>
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
                <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Salvar Alterações" CssClass="btn btn-primary" style="margin-right: 20px;" />
                <asp:LinkButton ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-danger" />
             </fieldset>
            </form>
        </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT * FROM tab_finpagar WHERE cod_fin = @cod_fin" 
        UpdateCommand="UPDATE tab_finpagar
                        SET cod_fornec    = @cod_fornec,
                            cod_hist      = @cod_hist,
                            numdocumento  = @numdocumento,
                            dt_emissao    = @dt_emissao,
                            dt_vencimento = @dt_vencimento,
                            vl_original   = @vl_original,
                            obs           = @observacao
                        WHERE cod_fin = @cod_fin">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="cod_fin" QueryStringField="p" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_fin"       Type="Int32" />
            <asp:Parameter Name="cod_fornec"    Type="Int32" />
            <asp:Parameter Name="cod_operador"  Type="Int32" />
            <asp:Parameter Name="cod_hist"      Type="Int32" />
            <asp:Parameter Name="numdocumento"  Type="String" />
            <asp:Parameter Name="dt_emissao"    Type="String" />
            <asp:Parameter Name="dt_vencimento" Type="String" />
            <asp:Parameter Name="vl_original"   Type="Decimal" />
            <asp:Parameter Name="observacao"    Type="String" />
        </UpdateParameters>
     </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlFornec" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT cod_fornec = cod_pessoa, nom_fornec = razaosocial FROM tab_pessoa (NOLOCK) WHERE tipo_pessoa IN ('F','A') and deletado = 0">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlHistorico" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT cod_hist, descricao FROM tab_finhistorico (NOLOCK) WHERE tipo = 'P' and deletado = 0">
    </asp:SqlDataSource>
</asp:Content>
