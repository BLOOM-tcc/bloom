import axios from "axios";
import { useState } from "react";
import { useRef } from "react";
import { useNavigate } from "react-router-dom";
import Carregando from "../Carregando";

export default function LoginEmpresa() {

    const [emailEmpresa, setEmailEmpresa] = useState("");
    const [cnpjEmpresa, setCnpjEmpresa] = useState("");
    const [senhaEmpresa, setSenhaEmpresa] = useState("");

    const [carregando, setCarregando] = useState(false);
    const [mensagem, setMensagem] = useState(null);
    const navegador = useNavigate();

    const emailRef = useRef();
    const cnpjRef = useRef();
    const senhaRef = useRef();


    function txtEmail_Change(e)
    {
        setEmailEmpresa(e.target.value);
    }

    function txtCnpj_Change(e)
    {
        setCnpjEmpresa(e.target.value);
    }

    function txtSenha_Change(e)
    {
        setSenhaEmpresa(e.target.value);
    }

    function lnkCriarConta_Click(e)
    {
        e.preventDefault();
        navegador("/CadastroEmpresa");
    }

    function btnAcessar_Click(e)
    {
        e.preventDefault();
        setMensagem(null);

        const cnpjNumeros = cnpjEmpresa.replace(/\D/g, "");

        if (emailEmpresa.trim() === "") {
            setMensagem("Email deve ser informado!");
            emailRef.current.focus();
            return;
        }

        if (cnpjNumeros === "") {
            setMensagem("CNPJ deve ser informado!");
            cnpjRef.current.focus();
            return;
        }

        if (senhaEmpresa.trim() === "") {
            setMensagem("Senha deve ser informada!");
            senhaRef.current.focus();
            return;
        }

        setCarregando(true);

        axios.post("http://localhost/bloom_cadastro_login/api/acessarEmpresa.php",
        {
            "email" : emailEmpresa,
            "cnpj" : cnpjNumeros,
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
                    setMensagem(resposta.data.mensagem);
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
            <link rel="stylesheet" href="/css/indexLogin.css" />

            {carregando === true ? <Carregando/> : null}

            {mensagem !== null ? <div className='msg erro'>{mensagem}</div> : null}

            <form className="fundoImagem">  
                <div className="login">
                <img src="/image/logoPreto.png" />      
                    <h2>Login</h2>
                        <label>Email</label>
                        <input
                            type="email"
                            value={emailEmpresa}
                            ref={emailRef}
                            onChange={txtEmail_Change}
                        />

                        <label>CNPJ</label>
                        <input
                            type="email"
                            value={cnpjEmpresa}
                            ref={cnpjRef}
                            onChange={txtCnpj_Change}
                        />

                        <label>Senha</label>
                        <input
                            type="password"
                            value={senhaEmpresa}
                            ref={senhaRef}
                            onChange={txtSenha_Change}
                        />
                    <p>
                        lembre me &nbsp;&nbsp;
                        <a href="#">esqueceu a senha?</a>
                    </p>
                    <button onClick={btnAcessar_Click} disabled={carregando}>Acessar</button>
                    <p>
                        Você é nova aqui?
                        <a href="#" onClick={lnkCriarConta_Click}>Crie sua conta!</a>
                    </p>
                </div>
            </form>
        </>
    );
}
