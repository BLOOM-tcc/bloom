import axios from "axios";
import { useState } from "react";
import { useRef } from "react";
import { useNavigate } from "react-router-dom";
import Carregando from "../Carregando";

export default function CadastroEmpresa() {

    const [nomeEmpresa, setNomeEmpresa] = useState("");
    const [emailEmpresa, setEmailEmpresa] = useState("");
    const [cnpjEmpresa, setCnpjEmpresa] = useState("");
    const [telefoneEmpresa, setTelefoneEmpresa] = useState("");
    const [senhaEmpresa, setSenhaEmpresa] = useState("");
    const [confirmarSenhaEmpresa, setConfirmarSenhaEmpresa] = useState("");

    const [carregando, setCarregando] = useState(false);
    const [mensagem, setMensagem] = useState(null);
    const navegador = useNavigate();

    const nomeRef = useRef();
    const emailRef = useRef();
    const cnpjRef = useRef();
    const telefoneRef = useRef();
    const senhaRef = useRef();
    const confirmarSenhaRef = useRef();


    function txtNome_Change(e)
    {
        setNomeEmpresa(e.target.value);
    }

    function txtEmail_Change(e)
    {
        setEmailEmpresa(e.target.value);
    }

    function txtCnpj_Change(e)
    {
        setCnpjEmpresa(e.target.value);
    }

    function txtTelefone_Change(e)
    {
        setTelefoneEmpresa(e.target.value);
    }

    function txtSenha_Change(e)
    {
        setSenhaEmpresa(e.target.value);
    }

    function txtConfirmarSenha_Change(e)
    {
        setConfirmarSenhaEmpresa(e.target.value);
    }

    function lnkLogin_Click(e)
    {
        e.preventDefault();
        navegador("/LoginEmpresa");
    }

    function btnCriarConta_Click(e)
    {
        e.preventDefault();
        setMensagem(null);

        const cnpjNumeros = cnpjEmpresa.replace(/\D/g, "");
        const telefoneNumeros = telefoneEmpresa.replace(/\D/g, "");

        if (nomeEmpresa.trim() === "") {
            setMensagem("Nome da empresa deve ser informado!");
            nomeRef.current.focus();
            return;
        }

        if (emailEmpresa.trim() === "") {
            setMensagem("Email deve ser informado!");
            emailRef.current.focus();
            return;
        }
        else {
            if (!/\S+@\S+\.\S+/.test(emailEmpresa)) {
                setMensagem("Email inválido!");
                emailRef.current.focus();
                return;
            }
        }

        if (cnpjNumeros.length !== 14) {
            setMensagem("CNPJ deve ter 14 números!");
            cnpjRef.current.focus();
            return;
        }

        if (telefoneNumeros.length < 10) {
            setMensagem("Telefone deve ser informado com DDD!");
            telefoneRef.current.focus();
            return;
        }

        if (senhaEmpresa.trim() === "") {
            setMensagem("Senha deve ser informada!");
            senhaRef.current.focus();
            return;
        }

        if (confirmarSenhaEmpresa.trim() === "") {
            setMensagem("Confirme sua senha!");
            confirmarSenhaRef.current.focus();
            return;
        }
        else {
            if (confirmarSenhaEmpresa !== senhaEmpresa) {
                setMensagem("As senhas não condizem!");
                confirmarSenhaRef.current.focus();
                return;
            }
        }

        setCarregando(true);

        axios.post("http://localhost/bloom_cadastro_login/api/cadastrarEmpresa.php",
        {
            "nome" : nomeEmpresa,
            "email" : emailEmpresa,
            "cnpj" : cnpjNumeros,
            "telefone" : telefoneNumeros,
            "senha" : senhaEmpresa
        },
        {
            withCredentials: true,
        }
        ).then(function (resposta) {
            if (resposta.status === 200 && resposta.data) {
                if (resposta.data.status === "true") {
                    localStorage.setItem(
                        "empresa",
                        JSON.stringify(resposta.data.empresa)
                    );

                    navegador("/empresa");
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
                        <label>Nome da empresa</label>
                        <input
                            type="text"
                            value={nomeEmpresa}
                            ref={nomeRef}
                            onChange={txtNome_Change}
                        />

                        <label>Email corporativo</label>
                        <input
                            type="email"
                            value={emailEmpresa}
                            ref={emailRef}
                            onChange={txtEmail_Change}
                        />

                        <label>CNPJ</label>
                        <input
                            type="text"
                            value={cnpjEmpresa}
                            ref={cnpjRef}
                            onChange={txtCnpj_Change}
                        />

                        <label>Endereço</label>
                        <input type="text" />

                        <label>Telefone</label>
                        <input
                            type="text"
                            value={telefoneEmpresa}
                            ref={telefoneRef}
                            onChange={txtTelefone_Change}
                        />

                        <label>Senha</label>
                        <input
                            type="text"
                            value={senhaEmpresa}
                            ref={senhaRef}
                            onChange={txtSenha_Change}
                        />

                        <label>Confirmar senha</label>
                        <input
                            type="text"
                            value={confirmarSenhaEmpresa}
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
