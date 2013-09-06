<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="FinTipoBaixaDefault.aspx.cs" Inherits="Mkt.Financeiro.FinTipoBaixaDefault" %>
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
    <h2>Tipo Baixa</h2>
    <br />
    <div class="row">
        <div class="span4">
            <a class="btn btn-inverse" href="FinTipoBaixaAdicionar.aspx"><i class="icon icon-plus-sign icon-white"></i> Cadastrar</a>
        </div>
        <div class="span8" style="text-align: right;">
            <asp:TextBox ID="txtProcurar" ClientIDMode="Static" CssClass="input-medium search-query" placeholder="Pesquisar..." runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtProcurar" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:Button ID="btnProcurar" ClientIDMode="Static" runat="server" Text="Button" OnClick="btnProcurar_Click" style="display: none;" />
        </div>
    </div>
    <br />
    <asp:ListView ID="lvwTipo" runat="server" DataKeyNames="cod_tipo" DataSourceID="sqlTipo">
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
                    <asp:Label ID="nom_tipoLabel" runat="server" Text='<%# Eval("nom_tipo") %>' />
                </td>
                <td style="vertical-align: middle; text-align: center;">
                    <a class="btn btn-inverse btn-small" href="FinTipoBaixaDetalhes.aspx?p=<%# Eval("cod_tipo") %>"><i class="icon icon-plus icon-white"></i> Detalhes</a>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr id="Tr1" runat="server">
                       <th style="width: 85%">Tipo Baixa</th>
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
    <asp:SqlDataSource ID="sqlTipo" runat="server" DataSourceMode="DataSet" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="select * from tab_fintipobaixa where deletado = 0">
    </asp:SqlDataSource>
</asp:Content>
