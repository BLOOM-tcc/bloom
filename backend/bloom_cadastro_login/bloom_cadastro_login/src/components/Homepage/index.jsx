import { useNavigate } from "react-router-dom";

export default function Homepage() {

    const navegador = useNavigate();

    function btnPessoaJuridica_Click()
    {
        navegador("/LoginEmpresa");
    }

    function btnPessoaFisica_Click()
    {
        navegador("/LoginUsuaria");
    }

    return (
        <>
            <link rel="stylesheet" href="/css/index.css" />

            <header>
                <div className="header"> 
                    <div className="identidade">
                        <img src="/image/logo.png" />      
                        <h1>Bloom</h1>
                    </div>
                    <div className="suporte">
                        <p>Nossa intenção</p>
                        <p>Nossas soluções</p>
                        <p>Suporte</p>
                    </div>
                </div>
                <button>Entrar</button>
            </header>

            <section className="fundo">
                <div className="mensagem">
                    <h1>Seu proximo passo começa aqui</h1>
                    <p>Encontre oportunidades profissionais alinhadasn aos seus objetivos e descubra empresas que estão procurando novos talentos</p>
                </div>
                <div className="identificacao">
                    <button onClick={btnPessoaFisica_Click}>Ver vagas disponíveis</button>
                </div>
            </section>

            <section class="como-funciona">
                <div class="titulo-secao">
                    <span></span>
                    <h2>COMO FUNCIONA</h2>
                </div>

                <div class="passos">

                    <div class="passo">
                    <div class="icone">
                        <svg viewBox="0 0 24 24" fill="none">
                        <circle cx="11" cy="11" r="7"></circle>
                        <path d="M16.5 16.5L21 21"></path>
                        </svg>
                    </div>

                    <div class="conteudo">
                        <span class="numero">01</span>
                        <h3>Explore</h3>
                        <p>Encontre oportunidades
                        alinhadas ao seu perfil.
                        </p>
                    </div>
                    </div>

                    <div class="seta">→</div>

                    <div class="passo">
                    <div class="icone">
                        <svg viewBox="0 0 24 24" fill="none">
                        <circle cx="12" cy="7" r="4"></circle>
                        <path d="M4 21c0-4.2 3.6-7 8-7s8 2.8 8 7"></path>
                        </svg>
                    </div>

                    <div class="conteudo">
                        <span class="numero">02</span>
                        <h3>Conecte-se</h3>
                        <p>Crie seu perfil e apresente
                        suas experiências e competências.
                        </p>
                    </div>
                    </div>

                    <div class="seta">→</div>

                    <div class="passo">
                    <div class="icone">
                        <svg viewBox="0 0 24 24" fill="none">
                        <path d="M12 2.5l2.9 5.9 6.6 1-4.8 4.7 1.1 6.6L12 17.6l-5.8 3.1 1.1-6.6-4.8-4.7 6.6-1L12 2.5z"></path>
                        </svg>
                    </div>

                    <div class="conteudo">
                        <span class="numero">03</span>
                        <h3> Evolua</h3>
                        <p>Candidate-se à vagas e encontre
                        novas possibilidades para sua carreira.
                        </p>
                    </div>
                    </div>

                </div>
            </section>

            <section class="empresa-section">
                <div class="empresa-imagem"></div>

                <div class="empresa-conteudo">
                    <span class="empresa-label">
                    <span></span>
                    PARA EMPRESAS
                    </span>

                    <h2>
                    Encontre os talentos que
                    sua empresa precisa.
                    </h2>
                </div>

                <div class="empresa-descricao">
                    <p>
                    Conecte-se a mulheres qualificadas,
                    com diferentes experiências e competências,
                    prontas para fazer a diferença no seu time.
                    </p>
                </div>

                <button onClick={btnPessoaJuridica_Click} class="empresa-botao">
                    Publicar uma vaga
                    <span>→</span>
                </button>
            </section>

            <section class="demo">
                <footer class="bloom-footer footer-same-border">
                    <div class="footer-inner">
                        <div class="footer-brand">
                            <img src="/image/logoPreto.png" className="logo-clara"/>
                        <div>
                            <strong>Bloom</strong><p>Conectando mulheres a novas oportunidades.</p>
                        </div>

                        </div>
                            <nav class="footer-links" aria-label="Links do rodapé"><a href="#como-funciona">Como funciona</a><a href="#para-empresas">Para empresas</a><a href="#entrar">Entrar</a></nav>
                        </div>
                        <div class="footer-bottom">© 2026 Bloom. Todos os direitos reservados.
                    </div>

                </footer>
            </section>

        </>
    );
}
