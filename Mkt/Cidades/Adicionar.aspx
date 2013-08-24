<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="Mkt.Cidades.Adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery.mask.min.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <script type="text/javascript">
        $(function () {
            
        });
    </script>
    <h2>Cadastrar Cidades</h2>
    <p>Preencha o formulário abaixo para cadastrar uma nova Cidade.</p>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:FormView ID="frwNovoCidade" RenderOuterTable="false" runat="server" DataKeyNames="cod_cidade" DataSourceID="sqlNovoCidade" DefaultMode="Insert" OnItemInserted="frwNovoCidade_ItemInserted">
        <InsertItemTemplate>
            <div class="form form-horizontal">
               <div class="control-group">
                    <label class="control-label">Nome da Cidade</label>
                    <div class="controls">
                        <asp:TextBox ID="nom_cidadeTextBox" runat="server" Text='<%# Bind("nom_cidade") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="nom_cidadeTextBox" runat="server" ErrorMessage="Nome da Cidade deve ser preenchido."></asp:RequiredFieldValidator>
                    </div>
                </div>
                    <label class="control-label">UF</label>
                    <div class="controls">
                        <asp:DropDownList ID="ufDDL" DataValueField="COD_UF" DataTextField="COD_UF" runat="server" DataSourceID="sqlEstados"></asp:DropDownList>
                    </div>
               <div class="control-group">
                    <br /><br />
                    <div class="controls">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Cadastar" CssClass="btn btn-primary" style="margin-right: 20px;" />
                        <asp:LinkButton ID="InsertCancelButton" OnClick="InsertCancelButton_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-danger" />
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </asp:FormView> 
    <asp:SqlDataSource ID="sqlNovoCidade" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        InsertCommand="INSERT INTO [tab_cidade] ([nom_cidade], [uf], [deletado]) VALUES (@nom_cidade, @uf, 0)">
        <InsertParameters>
            <asp:Parameter Name="nom_cidade" Type="String" />
            <asp:ControlParameter Name="uf" ControlID="ctl00$contentPlaceHolder$frwNovoCidade$ufDDL" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlEstados" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT [COD_UF] FROM [tab_uf]">
    </asp:SqlDataSource>
</asp:Content>

