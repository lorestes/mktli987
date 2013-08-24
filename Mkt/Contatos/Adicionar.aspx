<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="Mkt.Contatos.Adicionar" %>
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
            $('#txtTel1, #txtTel2').mask('(99) 9999-9999');
        });
    </script>
    <h2>Cadastrar Contatos</h2>
    <p>Preencha o formulário abaixo para cadastrar um novo Contato.</p>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:FormView ID="frwNovoContato" RenderOuterTable="false" runat="server" DataKeyNames="cod_contato" DataSourceID="sqlNovoContato" DefaultMode="Insert">
        <InsertItemTemplate>
            <div class="form form-horizontal">
               <div class="control-group">
                    <label class="control-label">Nome</label>
                    <div class="controls">
                        <asp:TextBox ID="nom_contatoTextBox" runat="server" Text='<%# Bind("nom_contato") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="nom_contatoTextBox" runat="server" ErrorMessage="Nome do Contato deve ser preenchido."></asp:RequiredFieldValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Telefone</label>
                    <div class="controls">
                        <asp:TextBox ID="telefoneTextBox" runat="server" Text='<%# Bind("tel1") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Telefone deve ser preenchido." ControlToValidate="telefoneTextBox"></asp:RequiredFieldValidator>
                    </div>
                </div>               
               <div class="control-group">
                    <label class="control-label">Celular</label>
                    <div class="controls">
                        <asp:TextBox ID="cnpj_cpfTextBox" runat="server" Text='<%# Bind("tel2") %>' />
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">e-mail</label>
                    <div class="controls">
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
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
    <asp:SqlDataSource ID="sqlNovoContato" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        InsertCommand="INSERT INTO [tab_contato] ([nom_contato], [tel1], [tel2], [email], [deletado]) VALUES (@nom_contato, @tel1, @tel2, @email, 0)">
        <InsertParameters>
            <asp:Parameter Name="nom_contato" Type="String" />
            <asp:Parameter Name="tel1" Type="String" />
            <asp:Parameter Name="tel2" Type="String" />
            <asp:Parameter Name="email" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
