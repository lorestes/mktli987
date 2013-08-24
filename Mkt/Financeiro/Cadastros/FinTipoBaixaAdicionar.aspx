<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="FinTipoBaixaAdicionar.aspx.cs" Inherits="Mkt.Financeiro.FinTipoBaixaAdicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Cadastrar Tipo Baixa</h2>
    <p>Preencha o formulário abaixo para cadastrar uma nova Tipo Baixa.</p>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:FormView ID="frwNovoTipo" RenderOuterTable="false" runat="server" DataKeyNames="cod_tipo" DataSourceID="sqlNovoTipo" DefaultMode="Insert">
        <InsertItemTemplate>
            <div class="form form-horizontal">
               <div class="control-group">
                    <label class="control-label">Tipo Baixa</label>
                    <div class="controls">
                        <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("nom_tipo") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="descricaoTextBox" runat="server" ErrorMessage="Tipo Baixa deve ser preenchido."></asp:RequiredFieldValidator>
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
    <asp:SqlDataSource ID="sqlNovoTipo" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        InsertCommand="INSERT INTO [tab_fintipobaixa] ([nom_tipo], [deletado]) VALUES (@nom_tipo, 0)">
        <InsertParameters>
            <asp:Parameter Name="nom_tipo" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

