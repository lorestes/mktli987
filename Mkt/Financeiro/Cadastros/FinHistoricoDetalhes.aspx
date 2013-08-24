<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="FinHistoricoDetalhes.aspx.cs" Inherits="Mkt.Financeiro.FinHistoricoDetalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Detalhes da Histórico Financeiro</h2>
    <p>Utilize o formulário abaixo para visualizar e editar todas as informações sobre o Histórico Financeiro.</p>
    <br />
     <asp:FormView ID="frwNovoHistorico" RenderOuterTable="False" runat="server" DataKeyNames="cod_hist" DataSourceID="sqlHistorico" DefaultMode="Edit">
        <EditItemTemplate>
            <form class="form-inline">
            <fieldset>
                <asp:HiddenField ID="hdncodhist" Value='<%# Bind("cod_hist") %>' runat="server" />
                <label>Descrição do Histórico</label>
                <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="descricaoTextBox" runat="server" ErrorMessage="Descrição do Histórico deve ser preenchido."></asp:RequiredFieldValidator>
                <label>Tipo</label>
                <asp:DropDownList ID="tipoDropDownList" runat="server" Text='<%# Bind("tipo") %>' >
                    <asp:ListItem Selected ="True" Text ="Pagar" Value="P" />
                    <asp:ListItem Text ="Receber" Value="R" />
                </asp:DropDownList>
                <br /><br />
                <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Salvar" CssClass="btn btn-primary" style="margin-right: 20px;" />
                <asp:LinkButton ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-danger" />
             </fieldset>
            </form>
        </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlHistorico" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT * FROM tab_finhistorico WHERE cod_hist = @cod_hist" 
        UpdateCommand="UPDATE tab_finhistorico
                        SET descricao = @descricao, 
                            tipo = @tipo
                        WHERE cod_hist = @cod_hist">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="cod_hist" QueryStringField="p" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_hist" />
            <asp:Parameter Name="descricao" />
            <asp:Parameter Name="tipo" />
        </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>

