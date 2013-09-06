﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Detalhes.aspx.cs" Inherits="Mkt.Contatos.Detalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Detalhes de Contato</h2>
    <p>Utilize o formulário abaixo para visualizar e editar todas as informações sobre o Contato.</p>
    <br />
     <asp:FormView ID="frwNovoContato" RenderOuterTable="False" runat="server" OnItemUpdated="frwNovoContato_ItemUpdated" DataKeyNames="cod_contato" DataSourceID="sqlContato" DefaultMode="Edit">
        <EditItemTemplate>
            <form class="form-inline">
            <fieldset>
                <asp:HiddenField ID="hdnCodContato" Value='<%# Bind("cod_contato") %>' runat="server" />
                <label>Nome</label>
                <asp:TextBox ID="nom_contatoTextBox" runat="server" Text='<%# Bind("nom_contato") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="nom_contatoTextBox" runat="server" ErrorMessage="Nome deve ser preenchido."></asp:RequiredFieldValidator>
                <label>Telefone</label>
                <asp:TextBox ID="telefoneTextBox" runat="server" Text='<%# Bind("tel1") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="telefoneTextBox" runat="server" ErrorMessage="Telefone deve ser preenchido."></asp:RequiredFieldValidator>
                <label>Celular</label>
                <asp:TextBox ID="celularTextBox" runat="server" Text='<%# Bind("tel2") %>' />
                <label>e-mail</label>
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br /><br />
                    <div class="row-fluid">
                        <div class="span2">
                            <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Salvar" Style="margin-right: 20px;" SkinID="Salvar" />

                        </div>
                        <div class="span2">
                            <asp:LinkButton ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" SkinID="Cancelar" />

                        </div>
                    </div> 
            </fieldset>
            </form>
        </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlContato" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT * FROM tab_contato WHERE cod_contato = @cod_contato" 
        UpdateCommand="UPDATE tab_contato
                        SET nom_contato = @nom_contato, 
                            tel1 = @tel1, 
                            tel2 = @tel2, 
                            email = @email
                        WHERE cod_contato = @cod_contato">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="cod_contato" QueryStringField="p" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_contato" Type="Int32" />
            <asp:Parameter Name="nom_contato" Type="String" />
            <asp:Parameter Name="tel1" Type="String" />
            <asp:Parameter Name="tel2" Type="String" />
            <asp:Parameter Name="email" Type="String" />
        </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>
