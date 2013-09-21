<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="Mkt.Fornecedores.Adicionar" %>
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
            $('#txtCep').mask('99999-999');
            $('#txtTel1, #txtFax').mask('(99) 9999-9999');
            $('#txtTel2').mask('(99) 99999-9999');
        });
    </script>
    <h2>Cadastrar Fornecedores</h2>
    <p>Preencha o formulário abaixo para cadastrar um novo Fornecedor.</p>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:FormView ID="frwNovoFornecedor" RenderOuterTable="false" runat="server" OnItemInserted="frwNovoFornecedor_ItemInserted" DataKeyNames="cod_pessoa" DataSourceID="sqlNovoFornecedor" DefaultMode="Insert">
        <InsertItemTemplate>
            <div class="form form-horizontal">
               <div class="control-group">
                    <label class="control-label">Razão Social / Nome</label>
                    <div class="controls">
                        <asp:TextBox ID="razaosocialTextBox" runat="server" Text='<%# Bind("razaosocial") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="razaosocialTextBox" runat="server" ErrorMessage="Razão Social / Nome deve ser preenchido."></asp:RequiredFieldValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Nome Fantasia / Apelido</label>
                    <div class="controls">
                        <asp:TextBox ID="nom_fantasiaTextBox" runat="server" Text='<%# Bind("nom_fantasia") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Nome Fantasia / Apelido deve ser preenchido." ControlToValidate="nom_fantasiaTextBox"></asp:RequiredFieldValidator>
                    </div>
                </div>               
               <div class="control-group">
                    <label class="control-label">Pessoa</label>
                    <div class="controls">
                         <asp:DropDownList ID="fis_jurDDL" runat="server" Text='<%# Bind("fis_jur") %>'>
                            <asp:ListItem Value="F" Enabled="true">Física</asp:ListItem>
                            <asp:ListItem Value="J">Jurídica</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>            
               <div class="control-group">
                    <label class="control-label">CPNJ / CPF</label>
                    <div class="controls">
                        <asp:TextBox ID="cnpj_cpfTextBox" runat="server" Text='<%# Bind("cnpj_cpf") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="CPNJ / CPF deve ser preenchido." ControlToValidate="cnpj_cpfTextBox"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="CPNJ / CPF deve conter apenas números e exatamente 11 ou 14 algarismos." ControlToValidate="cnpj_cpfTextBox" ValidationExpression="^(\d{11}|\d{14})$"></asp:RegularExpressionValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">IE / RG</label>
                    <div class="controls">
                        <asp:TextBox ID="ie_rgTextBox" runat="server" Text='<%# Bind("ie_rg") %>' />
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Cidade</label>
                    <div class="controls">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList Width="70" AutoPostBack="true" ID="estadosDDL" DataSourceID="sqlEstados" DataTextField="COD_UF" DataValueField="COD_UF" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="cidadesDDL" DataValueField="cod_cidade" DataTextField="nom_cidade" runat="server" DataSourceID="sqlCidades"></asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">CEP</label>
                    <div class="controls">
                        <asp:TextBox ID="txtCep" ClientIDMode="Static" runat="server" Text='<%# Bind("cep") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="CEP deve ser preenchido." ControlToValidate="txtCep"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="CEP inválido." ControlToValidate="txtCep" ValidationExpression="^\d{5}-\d{3}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Endereço</label>
                    <div class="controls">
                        <asp:TextBox ID="enderecoTextBox" runat="server" Text='<%# Bind("endereco") %>' />
                        <asp:RequiredFieldValidator ControlToValidate="enderecoTextBox" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Endereço deve ser preenchido."></asp:RequiredFieldValidator>
                    </div>
                </div>
               <div class="control-group">
                    <label class="control-label">Número</label>
                    <div class="controls">
                        <asp:TextBox ID="numeroTextBox" runat="server" Text='<%# Bind("numero") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Número deve ser preenchido." ControlToValidate="numeroTextBox"></asp:RequiredFieldValidator>
                    </div>
                </div>
               <div class="control-group">
                   <label class="control-label">Complemento</label>
                   <div class="controls">
                        <asp:TextBox ID="complementoTextBox" runat="server" Text='<%# Bind("complemento") %>' />
                   </div>
               </div>
               <div class="control-group">
                   <label class="control-label">Bairro</label>
                   <div class="controls">
                        <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Bairro deve ser preenchido." ControlToValidate="bairroTextBox"></asp:RequiredFieldValidator>
                   </div>
               </div>
               <div class="control-group">
                   <label class="control-label">Telefone</label>
                   <div class="controls">
                        <asp:TextBox ID="txtTel1" ClientIDMode="Static" runat="server" Text='<%# Bind("tel1") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Telefone deve ser preenchido." ControlToValidate="txtTel1"></asp:RequiredFieldValidator>
                   </div>
               </div>
               <div class="control-group">
                   <label class="control-label">Telefone 2</label>
                   <div class="controls">
                       <asp:TextBox ID="txtTel2" ClientIDMode="Static" runat="server" Text='<%# Bind("tel2") %>' />
                   </div>
               </div>
               <div class="control-group">
                   <label class="control-label">Fax</label>
                   <div class="controls">
                       <asp:TextBox ID="txtFax" ClientIDMode="Static" runat="server" Text='<%# Bind("fax") %>' />
                   </div>
               </div>
               <div class="control-group">
                   <label class="control-label">E-mail</label>
                   <div class="controls">
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'  />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="E-mail deve ser preenchido." ControlToValidate="emailTextBox"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="emailTextBox" runat="server" ErrorMessage="E-mail inválido." ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                   </div>
               </div>
               <div class="control-group">
                   <label class="control-label">Observação</label>
                   <div class="controls">
                        <asp:TextBox ID="obsTextBox" TextMode="MultiLine" style="width: 400px; height:100px; resize:none;" runat="server" Text='<%# Bind("observacao") %>' />
                   </div>
               </div>
               <div class="control-group">
                    <br />
                    <div class="row-fluid">
                        <div class="span2">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Cadastrar" Style="margin-right: 20px;" SkinID="Cadastrar" />

                        </div>
                        <div class="span2">
                            <asp:LinkButton ID="InsertCancelButton" OnClick="InsertCancelButton_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" SkinID="Cancelar" />

                        </div>
                    </div>
               </div>
            </div>
        </InsertItemTemplate>
    </asp:FormView> 
    <asp:SqlDataSource ID="sqlNovoFornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        InsertCommand="INSERT INTO [tab_pessoa] ([razaosocial], [nom_fantasia], [fis_jur], [tipo_pessoa], [cod_cidade], [endereco], [numero], [complemento], [bairro], [cep], [cnpj_cpf], [ie_rg], [dt_cadastro], [dt_atualizado], [tel1], [tel2], [fax], [email], [observacao], [deletado]) VALUES (@razaosocial, @nom_fantasia, @fis_jur, 'F', @cod_cidade, @endereco, @numero, @complemento, @bairro, @cep, @cnpj_cpf, @ie_rg, GETDATE(), GETDATE(), @tel1, @tel2, @fax, @email, @observacao, 0)">
        <InsertParameters>
            <asp:Parameter Name="razaosocial" Type="String" />
            <asp:Parameter Name="nom_fantasia" Type="String" />
            <asp:Parameter Name="fis_jur" Type="String" />
            <asp:Parameter Name="cod_cidade" Type="Int32" />
            <asp:Parameter Name="endereco" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="complemento" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cep" Type="String" />
            <asp:Parameter Name="cnpj_cpf" Type="String" />
            <asp:Parameter Name="ie_rg" Type="String" />
            <asp:Parameter Name="tel1" Type="String" />
            <asp:Parameter Name="tel2" Type="String" />
            <asp:Parameter Name="fax" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="observacao" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlEstados" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" SelectCommand="SELECT [COD_UF] FROM [tab_uf]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCidades" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" SelectCommand="SELECT [nom_cidade], [cod_cidade] FROM [tab_cidade] WHERE (([uf] = @uf) AND ([deletado] = 0))">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctl00$contentPlaceHolder$frwNovoFornecedor$estadosDDL" Name="uf" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
