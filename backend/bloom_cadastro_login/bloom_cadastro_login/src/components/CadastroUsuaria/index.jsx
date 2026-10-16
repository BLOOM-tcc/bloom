import axios from "axios";
import { useState } from "react";
import { useRef } from "react";
import { useNavigate } from "react-router-dom";
import Carregando from "../Carregando";

export default function CadastroUsuaria() {

    const [nomeUsuaria, setNomeUsuaria] = useState("");
    const [emailUsuaria, setEmailUsuaria] = useState("");
    const [telefoneUsuaria, setTelefoneUsuaria] = useState("");
    const [cpfUsuaria, setCpfUsuaria] = useState("");
    const [senhaUsuaria, setSenhaUsuaria] = useState("");
    const [confirmarSenhaUsuaria, setConfirmarSenhaUsuaria] = useState("");

    const [carregando, setCarregando] = useState(false);
    const [mensagem, setMensagem] = useState(null);
    const navegador = useNavigate();

    const nomeRef = useRef();
    const emailRef = useRef();
    const telefoneRef = useRef();
    const cpfRef = useRef();
    const senhaRef = useRef();
    const confirmarSenhaRef = useRef();


    function txtNome_Change(e)
    {
        setNomeUsuaria(e.target.value);
    }

    function txtEmail_Change(e)
    {
        setEmailUsuaria(e.target.value);
    }

    function txtTelefone_Change(e)
    {
        setTelefoneUsuaria(e.target.value);
    }

    function txtCpf_Change(e)
    {
        setCpfUsuaria(e.target.value);
    }

    function txtSenha_Change(e)
    {
        setSenhaUsuaria(e.target.value);
    }

    function txtConfirmarSenha_Change(e)
    {
        setConfirmarSenhaUsuaria(e.target.value);
    }

    function lnkLogin_Click(e)
    {
        e.preventDefault();
        navegador("/LoginUsuaria");
    }

    function btnCriarConta_Click(e)
    {
        e.preventDefault();
        setMensagem(null);

        const telefoneNumeros = telefoneUsuaria.replace(/\D/g, "");
        const cpfNumeros = cpfUsuaria.replace(/\D/g, "");

        if (nomeUsuaria.trim() === "") {
            setMensagem("Nome deve ser informado!");
            nomeRef.current.focus();
            return;
        }

        if (emailUsuaria.trim() === "") {
            setMensagem("Email deve ser informado!");
            emailRef.current.focus();
            return;
        }
        else {
            if (!/\S+@\S+\.\S+/.test(emailUsuaria)) {
                setMensagem("Email inválido!");
                emailRef.current.focus();
                return;
            }
        }

        if (telefoneNumeros.length < 10) {
            setMensagem("Telefone deve ser informado com DDD!");
            telefoneRef.current.focus();
            return;
        }

        if (cpfNumeros.length !== 11) {
            setMensagem("CPF deve ter 11 números!");
            cpfRef.current.focus();
            return;
        }

        if (senhaUsuaria.trim() === "") {
            setMensagem("Senha deve ser informada!");
            senhaRef.current.focus();
            return;
        }

        if (confirmarSenhaUsuaria.trim() === "") {
            setMensagem("Confirme sua senha!");
            confirmarSenhaRef.current.focus();
            return;
        }
        else {
            if (confirmarSenhaUsuaria !== senhaUsuaria) {
                setMensagem("As senhas não condizem!");
                confirmarSenhaRef.current.focus();
                return;
            }
        }

        setCarregando(true);

        axios.post("http://localhost/bloom_cadastro_login/api/cadastrarUsuaria.php",
        {
            "nome" : nomeUsuaria,
            "email" : emailUsuaria,
            "telefone" : telefoneNumeros,
            "cpf" : cpfNumeros,
            "senha" : senhaUsuaria
        },
        {
            withCredentials: true,
        }
        ).then(function (resposta) {
            if (resposta.status === 200 && resposta.data) {
                if (resposta.data.status === "true") {
                    localStorage.setItem(
                        "usuaria",
                        JSON.stringify(resposta.data.usuaria)
                    );

                    navegador("/usuaria");
                } else {
                    setMensagem(resposta.data.mensagem || "Resposta inválida do servidor.");
                }
            }
        })
        .catch(function (error) {
            console.warn(error);
            setMensagem("Erro ao conectar com o servidor.");
        })
        .finally(function () {
            setCarregando(false);
        });
    }


    return (
        <>
            <link rel="stylesheet" href="/css/indexCadastro.css" />

            {carregando === true ? <Carregando/> : null}

            {mensagem !== null ? <div className='msg erro'>{mensagem}</div> : null}

            <form>  
                <div className="formulario">
                <img src="/image/logoPreto.png" />      
                    <h2>Crie sua conta</h2>

                    <div className="info">
                        <label>Nome</label>
                        <input
                            type="text"
                            value={nomeUsuaria}
                            ref={nomeRef}
                            onChange={txtNome_Change}
                        />

                        <label>Email</label>
                        <input
                            type="email"
                            value={emailUsuaria}
                            ref={emailRef}
                            onChange={txtEmail_Change}
                        />

                        <label>Telefone</label>
                        <input
                            type="text"
                            value={telefoneUsuaria}
                            ref={telefoneRef}
                            onChange={txtTelefone_Change}
                        />

                        <label>CPF</label>
                        <input
                            type="text"
                            value={cpfUsuaria}
                            ref={cpfRef}
                            onChange={txtCpf_Change}
                        />

                        <label>Cep</label>
                        <input type="text" />

                        <label>Senha</label>
                        <input
                            type="text"
                            value={senhaUsuaria}
                            ref={senhaRef}
                            onChange={txtSenha_Change}
                        />

                        <label>Confirmar senha</label>
                        <input
                            type="text"
                            value={confirmarSenhaUsuaria}
                            ref={confirmarSenhaRef}
                            onChange={txtConfirmarSenha_Change}
                        />
                    </div>

                    <p>
                        lembre me &nbsp;&nbsp;
                        <a href="#">esqueceu a senha?</a>
                    </p>

                    <button onClick={btnCriarConta_Click} disabled={carregando}>Criar conta</button>

                    <p>
                        Você é já tem uma conta?
                        <a href="#" onClick={lnkLogin_Click}>Login</a>
                    </p>
                </div>
            </form>
        </>
    );
}
