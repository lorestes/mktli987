<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="Mkt.Financeiro.Pagar.Adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery.mask.min.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <script type="text/javascript">
        $(function () {
            $('#emissaoTextBox, #vencimentoTextBox').mask('99/99/9999');
        });
    </script>
    <h2>Cadastrar Documento a Pagar</h2>
    <p>Preencha o formulário abaixo para cadastrar um novo Documento a Pagar.</p>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:FormView ID="frwNovoDoc" RenderOuterTable="false" runat="server" DataKeyNames="cod_fin" DataSourceID="sqlNovoDoc" DefaultMode="Insert">
        <InsertItemTemplate>
            <div class="form form-horizontal">
               <div class="control-group">
                    <label class="control-label">Fornecedor</label>
                    <div class="controls">
                        <asp:DropDownList ID="fornecDDL" DataValueField="cod_fornec" DataTextField="nom_fornec" runat="server" DataSourceID="sqlFornec"></asp:DropDownList>
                    </div>
                </div> 
               <div class="control-group">
                    <label class="control-label">Histórico</label>
                    <div class="controls">
                        <asp:DropDownList ID="historicoDDL" DataValueField="cod_hist" DataTextField="descricao" runat="server" DataSourceID="sqlHistorico"></asp:DropDownList>
                    </div>
                </div> 
               <div class="control-group">
                    <label class="control-label">Documento</label>
                    <div class="controls">
                        <asp:TextBox ID="docTextBox" runat="server" Text='<%# Bind("numdocumento") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="docTextBox" runat="server" ErrorMessage="Documento deve ser preenchido."></asp:RequiredFieldValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Emissão</label>
                    <div class="controls">
                        <asp:TextBox ID="emissaoTextBox" ClientIDMode="Static" runat="server" Text='<%# Bind("dt_emissao") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="emissaoTextBox" runat="server" ErrorMessage="Emissão deve ser preenchido."></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationExpression="^\d{2}\/\d{2}\/\d{4}$" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Emissão deve estar em formato de data (dd/mm/aaaa)." ControlToValidate="emissaoTextBox"></asp:RegularExpressionValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Vencimento</label>
                    <div class="controls">
                        <asp:TextBox ID="vencimentoTextBox" ClientIDMode="Static" runat="server" Text='<%# Bind("dt_vencimento") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="vencimentoTextBox" runat="server" ErrorMessage="Vencimento deve ser preenchido."></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationExpression="^\d{2}\/\d{2}\/\d{4}$" ControlToValidate="vencimentoTextBox" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Vencimento deve estar no formato de data (dd/mm/aaaa)."></asp:RegularExpressionValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Valor</label>
                    <div class="controls">
                        <asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("vl_original") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ValorTextBox" runat="server" ErrorMessage="Valor deve ser preenchido."></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valor deve ser um numero válido, com duas casas decimais." ControlToValidate="ValorTextBox" ValidationExpression="^\d+([,]\d{1,2})?$"></asp:RegularExpressionValidator>

                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Observação</label>
                    <div class="controls">
                        <asp:TextBox ID="obsTextBox" TextMode="MultiLine" style="width: 400px; height:100px; resize:none;" runat="server" Text='<%# Bind("obs") %>' />
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="obsTextBox" runat="server" ErrorMessage="Observação deve ser preenchido."></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
               <div class="control-group">
                    <br /><br />
                    <div class="controls">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Cadastar" CssClass="btn btn-primary" style="margin-right: 20px;" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-danger" />
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </asp:FormView> 
    <asp:SqlDataSource ID="sqlNovoDoc" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        InsertCommand="INSERT INTO [tab_finpagar] ([cod_fornec], [cod_operador], [cod_hist], [status], [numdocumento], [dt_lcto], [dt_emissao], [dt_vencimento], [vl_original], [origem], [obs]) 
                            VALUES (@cod_fornec, @cod_operador, @cod_hist, 'ABERTO', @numdocumento, GETDATE(), @dt_emissao, @dt_vencimento, @vl_original, 'MANUAL', @observacao)">
        <InsertParameters>
            <asp:ControlParameter Name="cod_fornec" ControlID="ctl00$contentPlaceHolder$frwNovoDoc$fornecDDL" Type="Int32" />
            <asp:Parameter Name="cod_operador"  Type="Int32" />
            <asp:ControlParameter Name="cod_hist" ControlID="ctl00$contentPlaceHolder$frwNovoDoc$historicoDDL"  Type="Int32" />
            <asp:Parameter Name="numdocumento"  Type="String" />
            <asp:Parameter Name="dt_emissao"    Type="String" />
            <asp:Parameter Name="dt_vencimento" Type="String" />
            <asp:Parameter Name="vl_original"   Type="Decimal" />
            <asp:Parameter Name="observacao"    Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlFornec" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT cod_fornec = cod_pessoa, nom_fornec = razaosocial FROM tab_pessoa (NOLOCK) WHERE tipo_pessoa IN ('F','A') and deletado = 0">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlHistorico" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT cod_hist, descricao FROM tab_finhistorico (NOLOCK) WHERE tipo = 'P' and deletado = 0">
    </asp:SqlDataSource>
</asp:Content>
