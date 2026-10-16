<?php 
class UsuariaController {

	public static function Acessar($login, $senha) {
		$resultado = Usuaria::Acessar($login, $senha);
		$usuaria = null;

		foreach ($resultado as $linha) {
			$usuaria = new Usuaria($linha['cd_cpf_usuaria'], $linha['nm_usuaria']);
		}

		return $usuaria;
	}

	public static function Cadastrar($nome, $email, $telefone, $cpf, $senha) {
		Usuaria::Cadastrar($nome, $email, $telefone, $cpf, $senha);

		return self::Acessar($email, $senha);
	}
}
?>
