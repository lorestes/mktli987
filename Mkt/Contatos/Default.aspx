<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mkt.Contatos.Default" %>
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
    <h2>Contatos</h2>
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
    <asp:ListView ID="lvwContatos" runat="server" DataKeyNames="cod_contato" DataSourceID="sqlContato">
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
                    <asp:Label ID="nom_contatoLabel" runat="server" Text='<%# Eval("nom_contato") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="tel1Label" runat="server" Text='<%# Eval("tel1") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="tel2Label" runat="server" Text='<%# Eval("tel2") %>' />
                </td>
                <td style="vertical-align: middle;">
                    <asp:Label ID="emailLabel1" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td style="vertical-align: middle; text-align: center;">
                    <a class="btn btn-inverse btn-small" href="Detalhes.aspx?p=<%# Eval("cod_contato") %>"><i class="icon icon-plus icon-white"></i> Detalhes</a>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr id="Tr1" runat="server">
                       <th style="width: 33%">Nome</th>
                       <th style="width: 16%">Telefone</th>
                       <th style="width: 16%">Celular</th>
                       <th style="width: 20%">e-mail</th>
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
    <asp:SqlDataSource ID="sqlContato" runat="server" DataSourceMode="DataSet" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="select * from tab_contato where deletado = 0">
    </asp:SqlDataSource>
</asp:Content>

