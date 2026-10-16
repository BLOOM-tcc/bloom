<?php 
class Empresa extends Banco {
	public $Cnpj;
	public $Nome;

	public function __construct($cnpj = null, $nome = null) {
		$this->Cnpj = $cnpj;
		$this->Nome = $nome;
	}

	public static function Acessar($email, $cnpj, $senha) {
		$parametros = [
			'pEmail'=>$email,
			'pCnpj'=>$cnpj,
			'pSenha'=>$senha
		];
		return self::Consultar('acessarEmpresa', $parametros);
	}

	public static function Cadastrar($nome, $email, $cnpj, $telefone, $senha) {
		$parametros = [
			'pCnpj'=>$cnpj,
			'pNome'=>$nome,
			'pEmail'=>$email,
			'pTelefone'=>$telefone,
			'pSenha'=>$senha
		];
		return self::Executar('cadastrarEmpresa', $parametros);
	}
}
?>
