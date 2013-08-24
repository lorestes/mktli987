<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="FinTipoBaixaDetalhes.aspx.cs" Inherits="Mkt.Financeiro.FinTipoBaixaDetalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Detalhes do Tipo Baixa</h2>
    <p>Utilize o formulário abaixo para visualizar e editar todas as informações sobre o Tipo Baixa.</p>
    <br />
     <asp:FormView ID="frwNovoTipo" RenderOuterTable="False" runat="server" DataKeyNames="cod_tipo" DataSourceID="sqlTipo" DefaultMode="Edit">
        <EditItemTemplate>
            <form class="form-inline">
            <fieldset>
                <asp:HiddenField ID="hdncodhist" Value='<%# Bind("cod_tipo") %>' runat="server" />
                <label>Descrição do Tipo Baixa</label>
                <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("nom_tipo") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="descricaoTextBox" runat="server" ErrorMessage="Tipo Baixa deve ser preenchido."></asp:RequiredFieldValidator>
                <br /><br />
                <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Salvar" CssClass="btn btn-primary" style="margin-right: 20px;" />
                <asp:LinkButton ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-danger" />
             </fieldset>
            </form>
        </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlTipo" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT * FROM tab_fintipobaixa WHERE cod_tipo = @cod_tipo" 
        UpdateCommand="UPDATE tab_fintipobaixa
                        SET nom_tipo = @nom_tipo
                        WHERE cod_tipo = @cod_tipo">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="cod_tipo" QueryStringField="p" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_tipo" />
            <asp:Parameter Name="nom_tipo" />
        </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>


