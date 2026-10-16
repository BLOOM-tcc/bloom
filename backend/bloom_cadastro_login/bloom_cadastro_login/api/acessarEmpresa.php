<?php
require_once('cors.php');
require_once('config.php');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
	http_response_code(200);
	exit();
}

$metodo = $_SERVER['REQUEST_METHOD'];

if ($metodo != 'POST') 
{ 
	http_response_code(400); 
	echo json_encode(['mensagem' => 'Método Inválido']); 
	return;
}

try {
	$corpo = json_decode(file_get_contents("php://input"), true);
	if (!validaCorpoRequisicao($corpo)) {
		return;
	}
	$chaves = ['email','cnpj','senha'];
	if (!validaChaves($corpo, $chaves)) {
		return;
	}
	$email = $corpo['email'];
	$cnpj = $corpo['cnpj'];
	$senha = $corpo['senha'];

	$empresa = EmpresaController::Acessar($email, $cnpj, $senha);

	if ($empresa != null) {
		$_SESSION['logado'] = $empresa;
	}

	http_response_code(200);
	echo json_encode(['status' => 'true', 'mensagem' => 'sucesso ao acessar', 'empresa' => $empresa]);
} catch (Exception $erro) {
	$mensagemCompleta = $erro->getMessage();
	if (strpos($mensagemCompleta, 'SQLSTATE') !== false && strpos($mensagemCompleta, '1644') !== false) {
		$partes = explode(': ', $mensagemCompleta);
		$mensagem = trim(end($partes));
		$mensagem = substr($mensagem, 5);
		http_response_code(200);
	} else {
		http_response_code(500);
		$mensagem = $mensagemCompleta;
	}
	echo json_encode(['status' => 'false', 'mensagem'=>$mensagem]);
}

function validaCorpoRequisicao($corpo) {
	if (is_null($corpo))
	{
		http_response_code(400);
		echo json_encode(['mensagem'=>'Dados Inválidos!']);
		return false;
	}
	return true;
}

function validaChaves($corpo, $campos) {
	for ($i=0; $i < count($campos); $i++) { 
		if (!array_key_exists($campos[$i], $corpo))
		{
			http_response_code(400);
			echo json_encode(['mensagem'=>'Dados incorretos. Verifique a documentação da API e tente novamente!']);
			return false;
		}
		if ($corpo[$campos[$i]] == ''){
			http_response_code(400);
			echo json_encode(['mensagem'=>'Dados incorretos. Verifique a documentação da API e tente novamente!']);
			return false;
		}
	}
	return true;
}
?>