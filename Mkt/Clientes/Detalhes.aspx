<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Detalhes.aspx.cs" Inherits="Mkt.Clientes.Detalhes" %>
<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery.mask.min.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <script type="text/javascript">
        $(function () {
            $('#cepTextBox').mask('99999-999');
            $('#tel1TextBox, #faxTextBox').mask('(99) 9999-9999');
            $('#tel2TextBox').mask('(99) 99999-9999');
        });
    </script>
    <h2>Detalhes de Cliente</h2>
    <p>Utilize o formulário abaixo para visualizar e editar todas as informações sobre o cliente.</p>
    <br />
     <asp:FormView ID="frwNovoCliente" RenderOuterTable="False" runat="server" DataKeyNames="cod_pessoa" OnItemUpdated="frwNovoCliente_ItemUpdated" DataSourceID="sqlCliente" DefaultMode="Edit">
        <EditItemTemplate>
            <form class="form-inline">
                <fieldset>
                    <asp:HiddenField ID="hdnCodPessoa" Value='<%# Bind("cod_pessoa") %>' runat="server" />
                    <asp:HiddenField ID="hdnCodCidade" Value='<%# Bind("cod_cidade") %>' runat="server" />
                    <label>Razão Social / Nome</label>
                    <asp:TextBox ID="razaosocialTextBox" runat="server" Text='<%# Bind("razaosocial") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="razaosocialTextBox" runat="server" ErrorMessage="Razão Social / Nome deve ser preenchido."></asp:RequiredFieldValidator>
                    <label>Nome Fantasia / Apelido</label>
                    <asp:TextBox ID="nom_fantasiaTextBox" runat="server" Text='<%# Bind("nom_fantasia") %>' />
                    <label>Pessoa</label>
                    <asp:DropDownList ID="fis_jurDDL" runat="server" Text='<%# Bind("fis_jur") %>'>
                        <asp:ListItem Value="F">Física</asp:ListItem>
                        <asp:ListItem Value="J">Jurídica</asp:ListItem>
                    </asp:DropDownList>
                    <label>CPNJ / CPF</label>
                    <asp:TextBox ID="cnpj_cpfTextBox" runat="server" Text='<%# Bind("cnpj_cpf") %>' />
                    <label>IE / RG</label>
                    <asp:TextBox ID="ie_rgTextBox" runat="server" Text='<%# Bind("ie_rg") %>' />
                    <label>Cidade</label>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList Width="70" AutoPostBack="true" ID="estadosDDL" DataSourceID="sqlEstados" DataTextField="COD_UF" DataValueField="COD_UF" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="cidadesDDL" DataValueField="cod_cidade" DataTextField="nom_cidade" runat="server" DataSourceID="sqlCidades"></asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <label>CEP</label>
                    <asp:TextBox ID="cepTextBox" runat="server" Text='<%# Bind("cep") %>' />
                    <label>Endereço</label>
                    <asp:TextBox ID="enderecoTextBox" runat="server" Text='<%# Bind("endereco") %>' />
                    <label>Número</label>
                    <asp:TextBox ID="numeroTextBox" runat="server" Text='<%# Bind("numero") %>' />
                    <label>Complemento</label>
                    <asp:TextBox ID="complementoTextBox" runat="server" Text='<%# Bind("complemento") %>' />
                    <label>Bairro</label>
                    <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' />
                    <label>Telefone</label>
                    <asp:TextBox ID="tel1TextBox" runat="server" Text='<%# Bind("tel1") %>' />
                    <label>Telefone 2</label>
                    <asp:TextBox ID="tel2TextBox" runat="server" Text='<%# Bind("tel2") %>' />
                    <label>Fax</label>
                    <asp:TextBox ID="faxTextBox" runat="server" Text='<%# Bind("fax") %>' />
                    <label>Email</label>
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <label>Observação</label>
                    <asp:TextBox ID="obsTextBox" TextMode="MultiLine" style="resize:none; width: 400px; height: 80px;" runat="server" Text='<%# Bind("observacao") %>' />
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
    <asp:SqlDataSource ID="sqlCliente" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" 
        SelectCommand="SELECT tab_pessoa.* FROM tab_pessoa WHERE cod_pessoa = @cod_pessoa" 
        UpdateCommand="UPDATE tab_pessoa 
                        SET razaosocial = @razaosocial, 
                            nom_fantasia = @nom_fantasia, 
                            fis_jur = @fis_jur, 
                            tipo_pessoa = tipo_pessoa, 
                            cod_cidade = @cod_cidade, endereco = @endereco, 
                            numero = @numero, 
                            complemento = @complemento, 
                            bairro = @bairro, 
                            cep = @cep, 
                            cnpj_cpf = @cnpj_cpf, 
                            ie_rg = @ie_rg,     
                            tel1 = @tel1, 
                            tel2 = @tel2, 
                            fax = @fax, 
                            email = @email, 
                            deletado = deletado, 
                            observacao = @observacao, 
                            dt_atualizado = GETDATE() 
                        WHERE cod_pessoa = @cod_pessoa">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="cod_pessoa" QueryStringField="p" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_pessoa" Type="Int32" />
            <asp:Parameter Name="razaosocial" Type="String" />
            <asp:Parameter Name="nom_fantasia" Type="String" />
            <asp:Parameter Name="fis_jur" Type="String" />
            <%--<asp:Parameter Name="tipo_pessoa" Type="String" />--%>
            <asp:ControlParameter ControlID="ctl00$contentPlaceHolder$frwNovoCliente$cidadesDDL" Name="cod_cidade" Type="Int32" />
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
            <%--<asp:Parameter Name="deletado" Type="Boolean" />--%>
            <asp:Parameter Name="observacao" Type="String"  />
        </UpdateParameters>
     </asp:SqlDataSource>
     <asp:SqlDataSource ID="sqlEstados" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" SelectCommand="SELECT [COD_UF] FROM [tab_uf]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="sqlCidades" runat="server" ConnectionString="<%$ ConnectionStrings:marketingdbConnectionString %>" SelectCommand="SELECT [nom_cidade], [cod_cidade] FROM [tab_cidade] WHERE (([uf] = @uf) AND ([deletado] = 0))">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctl00$contentPlaceHolder$frwNovoCliente$estadosDDL" Name="uf" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>
