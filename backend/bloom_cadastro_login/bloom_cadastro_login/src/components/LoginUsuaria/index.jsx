import axios from "axios";
import { useState } from "react";
import { useRef } from "react";
import { useNavigate } from "react-router-dom";
import Carregando from "../Carregando";

export default function LoginUsuaria() {

    const [emailUsuaria, setEmailUsuaria] = useState("");
    const [senhaUsuaria, setSenhaUsuaria] = useState("");

    const [carregando, setCarregando] = useState(false);
    const [mensagem, setMensagem] = useState(null);
    const navegador = useNavigate();

    const emailRef = useRef();
    const senhaRef = useRef();


    function txtEmail_Change(e)
    {
        setEmailUsuaria(e.target.value);
    }

    function txtSenha_Change(e)
    {
        setSenhaUsuaria(e.target.value);
    }

    function lnkCriarConta_Click(e)
    {
        e.preventDefault();
        navegador("/CadastroUsuaria");
    }

    function lnkEsqueceuSenha_Click(e)
    {
        e.preventDefault();
        navegador("/PedidoRecuperacao");
    }

    function btnAcessar_Click(e)
    {
        e.preventDefault();
        setMensagem(null);

        if (emailUsuaria.trim() === "") {
            setMensagem("Email deve ser informado!");
            emailRef.current.focus();
            return;
        }

        if (senhaUsuaria.trim() === "") {
            setMensagem("Senha deve ser informada!");
            senhaRef.current.focus();
            return;
        }

        setCarregando(true);

        axios.post("http://localhost/bloom_cadastro_login/api/acessar.php",
        {
            "login" : emailUsuaria,
            "senha" : senhaUsuaria
        },
        {
            withCredentials: true,
        }
        ).then(function (resposta) {
            if (resposta.status === 200 && resposta.data) {
                console.log(resposta.data);
                if (resposta.data.status === "true") {
                    localStorage.setItem(
                        "usuaria",
                        JSON.stringify(resposta.data.usuaria)
                    );

                    navegador("/usuaria");
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
            <link rel="stylesheet" href="/css/indexLogin.css"/>

            {carregando === true ? <Carregando/> : null}

            {mensagem !== null ? <div className='msg erro'>{mensagem}</div> : null}

            <form className="fundoImagem">  
                <div className="login">
                <img src="/image/logoPreto.png" />      
                    <h2>Login</h2>
                        <label>Email</label>
                        <input
                            type="email"
                            value={emailUsuaria}
                            ref={emailRef}
                            onChange={txtEmail_Change}
                        />

                        <label>Senha</label>
                        <input
                            type="password"
                            value={senhaUsuaria}
                            ref={senhaRef}
                            onChange={txtSenha_Change}
                        />
                    <p>
                        lembre me &nbsp;&nbsp;
                        <a href="#" onClick={lnkEsqueceuSenha_Click}>esqueceu a senha?</a>
                    </p>
                    <button onClick={btnAcessar_Click} >Acessar</button>
                    <p>
                        Você é nova aqui?
                        <a href="#" onClick={lnkCriarConta_Click}>Crie sua conta!</a>
                    </p>
                </div>
            </form>
        </>
    );
}
