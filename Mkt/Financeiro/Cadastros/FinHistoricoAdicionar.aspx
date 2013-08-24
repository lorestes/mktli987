<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="FinHistoricoAdicionar.aspx.cs" Inherits="Mkt.Financeiro.FinHistoricoAdicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery.mask.min.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <h2>Cadastrar Histórico Financeiro</h2>
    <p>Preencha o formulário abaixo para cadastrar um novo Histórico Financeiro.</p>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:FormView ID="frwNovoHistorico" RenderOuterTable="false" runat="server" DataKeyNames="cod_hist" DataSourceID="sqlNovoHistorico" DefaultMode="Insert">
        <InsertItemTemplate>
            <div class="form form-horizontal">
               <div class="control-group">
                    <label class="control-label">Descrição do Histórico</label>
                    <div class="controls">
                        <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="descricaoTextBox" runat="server" ErrorMessage="Histórico Financeiro deve ser preenchido."></asp:RequiredFieldValidator>
                    </div>
                </div>
                    <label class="control-label">Tipo</label>
                    <div class="controls">
                        <asp:DropDownList ID="tipoDropDownList" runat="server" Text='<%# Bind("tipo") %>' >
                            <asp:ListItem Selected ="True" Text ="Pagar" Value="P" />
                            <asp:ListItem Text ="Receber" Value="R" />
                        </asp:DropDownList>
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
    <asp:SqlDataSource ID="sqlNovoHistorico" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        InsertCommand="INSERT INTO [tab_finhistorico] ([descricao], [tipo], [deletado]) VALUES (@descricao, @tipo, 0)">
        <InsertParameters>
            <asp:Parameter Name="descricao" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
