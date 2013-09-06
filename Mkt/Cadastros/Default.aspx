<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mkt.Cadastros.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Cadastros</h2>
    <br />
            <a class="btn btn-inverse" href="/Cadastros/Cidades"><i class="icon icon-forward icon-white"></i> Cidades</a>
        <br/><br/>
            <a class="btn btn-inverse" href="/Cadastros/Financeiro/FinHistoricoDefault.aspx"><i class="icon icon-forward icon-white"></i> Histórico Financeiro</a>
        <br/><br/>
            <a class="btn btn-inverse" href="/Cadastros/Financeiro/FinTipoBaixaDefault.aspx"><i class="icon icon-forward icon-white"></i> Tipo Baixa</a>

</asp:Content>
