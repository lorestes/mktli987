<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Detalhes.aspx.cs" Inherits="Mkt.Cidades.Detalhes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>Detalhes da Cidade</h2>
    <p>Utilize o formulário abaixo para visualizar e editar todas as informações sobre a Cidade.</p>
    <br />
    <asp:FormView ID="frwNovoCidade" RenderOuterTable="False" runat="server" DataKeyNames="cod_cidade" DataSourceID="sqlCidade" DefaultMode="Edit" OnItemUpdated="frwNovoCidade_ItemUpdated">
        <EditItemTemplate>
            <form class="form-inline">
                <fieldset>
                    <asp:HiddenField ID="hdnCodCidade" Value='<%# Bind("cod_cidade") %>' runat="server" />
                    <label>Nome da Cidade</label>
                    <asp:TextBox ID="nom_cidadeTextBox" runat="server" Text='<%# Bind("nom_cidade") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="nom_cidadeTextBox" runat="server" ErrorMessage="Nome da Cidade deve ser preenchido."></asp:RequiredFieldValidator>
                    <label>UF</label>
                    <asp:DropDownList ID="ufDDL" DataValueField="COD_UF" DataTextField="COD_UF" runat="server" DataSourceID="sqlEstados"></asp:DropDownList>
                    <br />
                    <br />
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
    <asp:SqlDataSource ID="sqlCidade" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>"
        SelectCommand="SELECT * FROM tab_cidade WHERE cod_cidade = @cod_cidade"
        UpdateCommand="UPDATE tab_cidade
                        SET nom_cidade = @nom_cidade, 
                            uf = @uf
                        WHERE cod_cidade = @cod_cidade">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="cod_cidade" QueryStringField="p" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_cidade" Type="Int32" />
            <asp:Parameter Name="nom_cidade" Type="String" />
            <asp:ControlParameter Name="uf" ControlID="ctl00$contentPlaceHolder$frwNovoCidade$ufDDL" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlEstados" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>"
        SelectCommand="SELECT [COD_UF] FROM [tab_uf]"></asp:SqlDataSource>
</asp:Content>
