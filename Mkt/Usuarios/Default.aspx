<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mkt.Usuários.Default" %>
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
    <h2>Usuários</h2>
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
    <asp:ListView ID="lvwUsuario" runat="server" DataKeyNames="UserId" DataSourceID="sqlUsuario">
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
                    <asp:Label ID="nom_contatoLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
                <td style="vertical-align: middle; text-align: center;">
                    <asp:Label ID="tel1Label" runat="server" Text='<%# Eval("LastActivityDate", "{0:dd/MM/yyyy HH:mm}h") %>' />
                </td>
                <td style="vertical-align: middle; text-align: center;">
                    <a class="btn btn-inverse btn-small" href="Detalhes.aspx?p=<%# Eval("UserId") %>"><i class="icon icon-plus icon-white"></i> Detalhes</a>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="table table-striped table-bordered table-hover table">
                <thead>
                    <tr id="Tr1" runat="server">
                       <th style="width: 65%">Nome de Usuário</th>
                       <th style="width: 20%; text-align:center">Última Atividade</th>
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
    <asp:SqlDataSource ID="sqlUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT UserId, UserName, LastActivityDate FROM vw_aspnet_Users">
    </asp:SqlDataSource>
</asp:Content>
