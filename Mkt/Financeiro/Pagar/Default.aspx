<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mkt.Financeiro.Pagar.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <script>
        $(function () {
            $('#txtProcurar').keypress(function (e) {
                if (e.which == 13)
                    $('#btnProcurar').click();
            });
        });
    </script>
    <h2>Documentos a Pagar</h2>
    <br />
    <div class="row">
        <div class="span4">
            <a class="btn btn-inverse" href="Adicionar.aspx"><i class="icon icon-plus-sign icon-white"></i> Cadastrar</a>
        </div>
        <div class="span8" style="text-align: right;">
            <asp:TextBox ID="txtProcurar" ClientIDMode="Static" CssClass="input-medium search-query" placeholder="Pesquisar..." runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtProcurar" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:Button ID="btnProcurar" ClientIDMode="Static" runat="server" Text="Button" OnClick="btnProcurar_Click" style="display: none;" />
        </div>
    </div>
    <br />
    <asp:ListView ID="lvwFinanceiro" runat="server" DataSourceID="sqlFinanceiro">
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td>Nenhum registro encontrado.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr>
                <td style="vertical-align: middle;">
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="razaosocialLabel" runat="server" Text='<%# Eval("razaosocial") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="nom_fantasiaLabel" runat="server" Text='<%# Eval("nom_fantasia") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="numdocumentoLabel" runat="server" Text='<%# Eval("numdocumento") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="dt_vencimentoLabel" runat="server" Text='<%# Eval("dt_vencimento") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="vl_originalLabel" runat="server" Text='<%# Eval("vl_original") %>' />
                </td>
                <td style="vertical-align: middle; text-align: center;">
                    <a class="btn btn-inverse btn-small" href="Detalhes.aspx?p=<%# Eval("cod_fin") %>"><i class="icon icon-plus icon-white"></i> Detalhes</a>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr id="Tr1" runat="server">
                       <th style="width: 08%">Status</th>
                       <th style="width: 30%">Razão Social</th>
                       <th style="width: 15%">Nome Fantasia</th>
                       <th style="width: 12%">Documento</th>
                       <th style="width: 10%">Vencimento</th>
                       <th style="width: 10%">Valor</th>
                       <th style="width: 15%"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </tbody>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="sqlFinanceiro" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>"
        SelectCommand="SELECT tfpg.cod_fin, tfpg.Status, tpes.razaosocial, tpes.nom_fantasia, tfpg.numdocumento, dt_vencimento = CONVERT(VARCHAR(10), tfpg.dt_vencimento, 103), tfpg.vl_original 
                         FROM tab_finpagar tfpg (NOLOCK)
                        INNER JOIN tab_pessoa tpes (NOLOCK) ON tpes.cod_pessoa = tfpg.cod_fornec">
    </asp:SqlDataSource>
</asp:Content>

