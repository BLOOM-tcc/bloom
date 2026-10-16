<?php 
class EmpresaController {

	public static function Acessar($email, $cnpj, $senha) {
		$resultado = Empresa::Acessar($email, $cnpj, $senha);
		$empresa = null;

		foreach ($resultado as $linha) {
			$empresa = new Empresa($linha['cd_cnpj_empresa'], $linha['nm_empresa']);
		}

		return $empresa;
	}

	public static function Cadastrar($nome, $email, $cnpj, $telefone, $senha) {
		Empresa::Cadastrar($nome, $email, $cnpj, $telefone, $senha);

		return self::Acessar($email, $cnpj, $senha);
	}
}
?>
