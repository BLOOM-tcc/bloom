Use bloom;

Delimiter $$

Drop Procedure if exists acessar$$
Create Procedure acessar(pLogin varchar(100), pSenha varchar(64))
begin
	Declare vQtd int default 0;

	Select count(*) into vQtd from usuaria
	where (email_usuaria = pLogin or cd_cpf_usuaria = pLogin) and cd_senha_usuaria = md5(pSenha);

	if (vQtd = 0) then
		signal sqlstate '45000' set message_text = 'Login e/ou senha inválidos!';
	else
		Select cd_cpf_usuaria, nm_usuaria from usuaria
		where (email_usuaria = pLogin or cd_cpf_usuaria = pLogin) and cd_senha_usuaria = md5(pSenha);
	end if;
end$$

Drop Procedure if exists cadastrarUsuaria$$
Create Procedure cadastrarUsuaria(pCpf varchar(11), pNome varchar(100), pEmail varchar(100), pTelefone varchar(100), pSenha varchar(64))
begin
	Declare vQtd int default 0;

	Select count(*) into vQtd from usuaria where cd_cpf_usuaria = pCpf;
	if (vQtd > 0) then
		signal sqlstate '45000' set message_text = 'CPF já cadastrado!';
	end if;

	Select count(*) into vQtd from usuaria where email_usuaria = pEmail;
	if (vQtd > 0) then
		signal sqlstate '45000' set message_text = 'E-mail já cadastrado!';
	end if;

	Insert into usuaria (cd_cpf_usuaria, nm_usuaria, email_usuaria, cd_senha_usuaria, cd_telefone_usuaria)
	values (pCpf, pNome, pEmail, md5(pSenha), pTelefone);
end$$

Drop Procedure if exists acessarEmpresa$$
Create Procedure acessarEmpresa(pEmail varchar(100), pCnpj varchar(14), pSenha varchar(64))
begin
	Declare vQtd int default 0;

	Select count(*) into vQtd from empresa
	where nm_email_empresa = pEmail and cd_cnpj_empresa = pCnpj and cd_senha_empresa = md5(pSenha);

	if (vQtd = 0) then
		signal sqlstate '45000' set message_text = 'E-mail, CNPJ e/ou senha inválidos!';
	else
		Select cd_cnpj_empresa, nm_empresa from empresa
		where nm_email_empresa = pEmail and cd_cnpj_empresa = pCnpj and cd_senha_empresa = md5(pSenha);
	end if;
end$$

Drop Procedure if exists cadastrarEmpresa$$
Create Procedure cadastrarEmpresa(pCnpj varchar(14), pNome varchar(100), pEmail varchar(100), pTelefone varchar(20), pSenha varchar(64))
begin
	Declare vQtd int default 0;

	Select count(*) into vQtd from empresa where cd_cnpj_empresa = pCnpj;
	if (vQtd > 0) then
		signal sqlstate '45000' set message_text = 'CNPJ já cadastrado!';
	end if;

	Select count(*) into vQtd from empresa where nm_email_empresa = pEmail;
	if (vQtd > 0) then
		signal sqlstate '45000' set message_text = 'E-mail já cadastrado!';
	end if;

	Insert into empresa (cd_cnpj_empresa, nm_empresa, nm_email_empresa, cd_senha_empresa, cd_telefone_empresa)
	values (pCnpj, pNome, pEmail, md5(pSenha), pTelefone);
end$$


Delimiter ;
