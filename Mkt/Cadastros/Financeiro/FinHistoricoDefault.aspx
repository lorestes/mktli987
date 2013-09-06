<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="FinHistoricoDefault.aspx.cs" Inherits="Mkt.Financeiro.Default" %>
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
    <h2>Histórico Financeiro</h2>
    <br />
    <div class="row">
        <div class="span4">
            <a class="btn btn-inverse" href="FinHistoricoAdicionar.aspx"><i class="icon icon-plus-sign icon-white"></i> Cadastrar</a>
        </div>
        <div class="span8" style="text-align: right;">
            <asp:TextBox ID="txtProcurar" ClientIDMode="Static" CssClass="input-medium search-query" placeholder="Pesquisar..." runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtProcurar" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:Button ID="btnProcurar" ClientIDMode="Static" runat="server" Text="Button" OnClick="btnProcurar_Click" style="display: none;" />
        </div>
    </div>
    <br />
    <asp:ListView ID="lvwHistorico" runat="server" DataKeyNames="cod_hist" DataSourceID="sqlHistorico">
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>Nenhum registro encontrado.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr>
                <td style="vertical-align: middle;">
                    <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("descricao") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="tipoLabel" runat="server" Text='<%# (String)Eval("tipo") == "P" ? "Pagar" : "Receber"  %>' />
                </td>
                <td style="vertical-align: middle; text-align: center;">
                    <a class="btn btn-inverse btn-small" href="FinHistoricoDetalhes.aspx?p=<%# Eval("cod_hist") %>"><i class="icon icon-plus icon-white"></i> Detalhes</a>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr id="Tr1" runat="server">
                       <th style="width: 65%">Nome Historico</th>
                       <th style="width: 20%">Tipo</th>
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
    <asp:SqlDataSource ID="sqlHistorico" runat="server" DataSourceMode="DataSet" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="select * from tab_finhistorico where deletado = 0">
    </asp:SqlDataSource>
</asp:Content>

