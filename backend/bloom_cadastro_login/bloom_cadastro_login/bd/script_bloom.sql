DROP SCHEMA IF EXISTS bloom;
CREATE SCHEMA bloom;
USE bloom;

CREATE TABLE cidade
(
    cd_cidade INT,
    nm_cidade VARCHAR(200),
    sg_uf VARCHAR(200),
    
    CONSTRAINT pk_cidade PRIMARY KEY (cd_cidade)
);

CREATE TABLE idioma
(
    cd_idioma INT,
    nm_idioma VARCHAR(100),
    
    CONSTRAINT pk_idioma PRIMARY KEY (cd_idioma)
);

CREATE TABLE nivel_idioma
(
    cd_nivel_idioma INT,
    nm_nivel_idioma VARCHAR(100),
    
    CONSTRAINT pk_nivel_idioma PRIMARY KEY (cd_nivel_idioma)
);

CREATE TABLE tipo_formacao
(
    cd_tipo_formacao INT,
    nm_tipo_formacao VARCHAR(100),
    
    CONSTRAINT pk_tipo_formacao PRIMARY KEY (cd_tipo_formacao)
);

CREATE TABLE formacao
(
    cd_formacao INT,
    nm_formacao VARCHAR(100),
    
    CONSTRAINT pk_formacao PRIMARY KEY (cd_formacao)
);

CREATE TABLE status_curso
(
    cd_status_curso INT,
    nm_status_curso VARCHAR(100),
    
    CONSTRAINT pk_status_curso PRIMARY KEY (cd_status_curso)
);

CREATE TABLE tipo_contratacao
(
    cd_tipo_contratacao INT,
    nm_tipo_contratacao VARCHAR(50),

    CONSTRAINT pk_tipo_contratacao PRIMARY KEY (cd_tipo_contratacao)
);

CREATE TABLE tipo_local_trabalho
(
    cd_tipo_local_trabalho INT,
    nm_tipo_local_trabalho VARCHAR(50),

    CONSTRAINT pk_tipo_local_trabalho PRIMARY KEY (cd_tipo_local_trabalho)
);

CREATE TABLE tipo_salario
(
    cd_tipo_salario INT,
    nm_tipo_salario VARCHAR(100),

    CONSTRAINT pk_tipo_salario PRIMARY KEY (cd_tipo_salario)
);

CREATE TABLE cargo
(
    cd_cargo INT,
    nm_cargo VARCHAR(100),

    CONSTRAINT pk_cargo PRIMARY KEY (cd_cargo)
);

CREATE TABLE habilidade
(
    cd_habilidade INT,
    nm_habilidade VARCHAR(100),

    CONSTRAINT pk_habilidade PRIMARY KEY (cd_habilidade)
);

CREATE TABLE beneficios
(
    cd_beneficio INT,
    nm_beneficio VARCHAR(100),

    CONSTRAINT pk_beneficios PRIMARY KEY (cd_beneficio)
);

CREATE TABLE status_entrevista
(
    cd_status_entrevista INT,
    nm_status_entrevista VARCHAR(100),
    
    CONSTRAINT pk_status_entrevista PRIMARY KEY (cd_status_entrevista)
);


CREATE TABLE usuaria
(
    cd_cpf_usuaria VARCHAR(11),
    nm_usuaria VARCHAR(100),
    email_usuaria VARCHAR(100),
    cd_senha_usuaria VARCHAR(100),
    cd_telefone_usuaria VARCHAR(100),
    cd_cidade INT,
    dt_nascimento DATE,
    vl_pretensao_salarial INT,
    nm_cargo_desejado VARCHAR(100),
    
    CONSTRAINT pk_usuaria PRIMARY KEY (cd_cpf_usuaria),
    CONSTRAINT fk_usuaria_cidade FOREIGN KEY (cd_cidade) REFERENCES cidade (cd_cidade)
);

CREATE TABLE recuperacao_senha
(
    cd_recuperacao INT,
    cd_cpf_usuaria VARCHAR(11),
    email_usuaria VARCHAR(100),
    cd_verificacao VARCHAR(4),
    dt_expiracao DATETIME,
    ic_codigo_usado BOOLEAN,

    CONSTRAINT pk_recuperacao_senha PRIMARY KEY (cd_recuperacao),
    CONSTRAINT fk_recuperacao_senha_usuaria FOREIGN KEY (cd_cpf_usuaria) REFERENCES usuaria (cd_cpf_usuaria)
);

CREATE TABLE empresa
(
    cd_cnpj_empresa VARCHAR(14),
    nm_empresa VARCHAR(100),
    nm_email_empresa VARCHAR(100),
    cd_senha_empresa VARCHAR(100),
    ds_empresa TEXT,
    ds_cultura_empresa TEXT,
    ds_beneficios TEXT,
    cd_score_inclusao DECIMAL(10,2),
    cd_telefone_empresa INT,
    
    CONSTRAINT pk_empresa PRIMARY KEY (cd_cnpj_empresa)
);

CREATE TABLE curso
(
    cd_curso INT,
    nm_curso VARCHAR(100),
    qt_horas_curso INT,
    ic_possui_certificado TINYINT,
    qt_etapas_curso INT,
    nm_nivel_curso VARCHAR(100),
    ds_curso VARCHAR(100),
    
    CONSTRAINT pk_curso PRIMARY KEY (cd_curso)
);

CREATE TABLE trilha
(
    cd_trilha INT,
    nm_trilha VARCHAR(100),
    cd_cnpj_empresa VARCHAR(14),
    
    CONSTRAINT pk_trilha PRIMARY KEY (cd_trilha),
    CONSTRAINT fk_trilha_empresa FOREIGN KEY (cd_cnpj_empresa) REFERENCES empresa (cd_cnpj_empresa)
);


CREATE TABLE experiencia
(
    cd_experiencia INT,
    nm_empresa VARCHAR(100),
    nm_cargo VARCHAR(100),
    dt_inicio DATE,
    dt_fim DATE,
    cd_cpf_usuaria VARCHAR(11),

    CONSTRAINT pk_experiencia PRIMARY KEY (cd_experiencia),
    CONSTRAINT fk_experiencia_usuaria FOREIGN KEY (cd_cpf_usuaria) REFERENCES usuaria (cd_cpf_usuaria)
);

CREATE TABLE usuaria_idioma
(
    cd_cpf_usuaria VARCHAR(11),
    cd_idioma INT,
    cd_nivel_idioma INT,

    CONSTRAINT pk_usuaria_idioma PRIMARY KEY (cd_cpf_usuaria, cd_idioma),
    CONSTRAINT fk_usuaria_idioma_usuaria FOREIGN KEY (cd_cpf_usuaria) REFERENCES usuaria (cd_cpf_usuaria),
    CONSTRAINT fk_usuaria_idioma_idioma FOREIGN KEY (cd_idioma) REFERENCES idioma (cd_idioma),
    CONSTRAINT fk_usuaria_idioma_nivel FOREIGN KEY (cd_nivel_idioma) REFERENCES nivel_idioma (cd_nivel_idioma)
);

CREATE TABLE usuaria_formacao
(
    cd_cpf_usuaria VARCHAR(11),
    cd_formacao INT,
    nm_local VARCHAR(200),
    dt_inicio DATE,
    dt_fim DATE,
    ic_cursando TINYINT,
    cd_cidade INT,
    cd_tipo_formacao INT,

    CONSTRAINT pk_usuaria_formacao PRIMARY KEY (cd_cpf_usuaria, cd_formacao),
    CONSTRAINT fk_usuaria_formacao_usuaria FOREIGN KEY (cd_cpf_usuaria) REFERENCES usuaria (cd_cpf_usuaria),
    CONSTRAINT fk_usuaria_formacao_formacao FOREIGN KEY (cd_formacao) REFERENCES formacao (cd_formacao),
    CONSTRAINT fk_usuaria_formacao_cidade FOREIGN KEY (cd_cidade) REFERENCES cidade (cd_cidade),
    CONSTRAINT fk_usuaria_formacao_tipo FOREIGN KEY (cd_tipo_formacao) REFERENCES tipo_formacao (cd_tipo_formacao)
);

CREATE TABLE habilidade_usuaria
(
    cd_habilidade INT,
    cd_cpf_usuaria VARCHAR(11),

    CONSTRAINT pk_habilidade_usuaria PRIMARY KEY (cd_habilidade, cd_cpf_usuaria),
    CONSTRAINT fk_habilidade_usuaria_habilidade FOREIGN KEY (cd_habilidade) REFERENCES habilidade (cd_habilidade),
    CONSTRAINT fk_habilidade_usuaria_usuaria FOREIGN KEY (cd_cpf_usuaria) REFERENCES usuaria (cd_cpf_usuaria)
);

-- -----------------------------------------------------
-- 4. CURSOS E TRILHAS
-- -----------------------------------------------------

CREATE TABLE curso_trilha 
(
    cd_curso INT,
    cd_trilha INT,
    cd_cnpj_empresa VARCHAR(14),
    
    CONSTRAINT pk_curso_trilha PRIMARY KEY (cd_curso, cd_trilha),
    CONSTRAINT fk_curso_trilha_curso FOREIGN KEY (cd_curso) REFERENCES curso (cd_curso),
    CONSTRAINT fk_curso_trilha_trilha FOREIGN KEY (cd_trilha) REFERENCES trilha (cd_trilha),
    CONSTRAINT fk_curso_trilha_empresa FOREIGN KEY (cd_cnpj_empresa) REFERENCES empresa (cd_cnpj_empresa)
);

CREATE TABLE usuaria_curso_trilha 
(
    cd_cpf_usuaria VARCHAR(11),
    cd_curso INT,
    cd_trilha INT,
    cd_cnpj_empresa VARCHAR(14),
    dt_inicio_curso DATE,
    dt_finalizacao_curso DATE,
    dt_ultimo_acesso VARCHAR(100),
    cd_status_entrevista INT,
    
    CONSTRAINT pk_usuaria_curso_trilha PRIMARY KEY (cd_cpf_usuaria, cd_curso, cd_trilha),
    CONSTRAINT fk_uct_usuaria FOREIGN KEY (cd_cpf_usuaria) REFERENCES usuaria (cd_cpf_usuaria),
    CONSTRAINT fk_uct_curso FOREIGN KEY (cd_curso) REFERENCES curso (cd_curso),
    CONSTRAINT fk_uct_trilha FOREIGN KEY (cd_trilha) REFERENCES trilha (cd_trilha),
    CONSTRAINT fk_uct_empresa FOREIGN KEY (cd_cnpj_empresa) REFERENCES empresa (cd_cnpj_empresa),
    CONSTRAINT fk_uct_status FOREIGN KEY (cd_status_entrevista) REFERENCES status_curso (cd_status_curso)
);

-- -----------------------------------------------------
-- 5. VAGAS E RELACIONAMENTOS
-- -----------------------------------------------------

CREATE TABLE vaga
(
    cd_vaga INT,
    nm_vaga VARCHAR(100),
    ds_vaga TEXT,
    dt_publicacao_vaga DATE,
    cd_cnpj_empresa VARCHAR(14),
    qt_carga_semanal INT,
    cd_cargo INT,
    cd_tipo_local_trabalho INT,
    cd_tipo_salario INT,
    cd_tipo_contratacao INT,
    vl_salario_minimo DECIMAL(10,2),
    vl_salario_maximo DECIMAL(10,2),
    
    CONSTRAINT pk_vaga PRIMARY KEY (cd_vaga),
    CONSTRAINT fk_vaga_empresa FOREIGN KEY (cd_cnpj_empresa) REFERENCES empresa (cd_cnpj_empresa),
    CONSTRAINT fk_vaga_cargo FOREIGN KEY (cd_cargo) REFERENCES cargo (cd_cargo),
    CONSTRAINT fk_vaga_tipo_local FOREIGN KEY (cd_tipo_local_trabalho) REFERENCES tipo_local_trabalho (cd_tipo_local_trabalho),
    CONSTRAINT fk_vaga_tipo_salario FOREIGN KEY (cd_tipo_salario) REFERENCES tipo_salario (cd_tipo_salario),
    CONSTRAINT fk_vaga_tipo_contratacao FOREIGN KEY (cd_tipo_contratacao) REFERENCES tipo_contratacao (cd_tipo_contratacao)
);

CREATE TABLE formacao_vaga
(
    cd_formacao INT,
    cd_vaga INT,

    CONSTRAINT pk_formacao_vaga PRIMARY KEY (cd_formacao, cd_vaga),
    CONSTRAINT fk_formacao_vaga_formacao FOREIGN KEY (cd_formacao) REFERENCES formacao (cd_formacao),
    CONSTRAINT fk_formacao_vaga_vaga FOREIGN KEY (cd_vaga) REFERENCES vaga (cd_vaga)
);

CREATE TABLE vaga_salva
(
    cd_cpf_usuaria VARCHAR(11),
    cd_vaga INT,

    CONSTRAINT pk_vaga_salva PRIMARY KEY (cd_cpf_usuaria, cd_vaga),
    CONSTRAINT fk_vaga_salva_usuaria FOREIGN KEY (cd_cpf_usuaria) REFERENCES usuaria (cd_cpf_usuaria),
    CONSTRAINT fk_vaga_salva_vaga FOREIGN KEY (cd_vaga) REFERENCES vaga (cd_vaga)
);

CREATE TABLE vaga_habilidade 
(
    cd_vaga INT,
    cd_habilidade INT,
    ic_diferencial TINYINT,

    CONSTRAINT pk_vaga_habilidade PRIMARY KEY (cd_vaga, cd_habilidade),
    CONSTRAINT fk_vaga_habilidade_vaga FOREIGN KEY (cd_vaga) REFERENCES vaga (cd_vaga),
    CONSTRAINT fk_vaga_habilidade_habilidade FOREIGN KEY (cd_habilidade) REFERENCES habilidade (cd_habilidade)
);

CREATE TABLE vaga_beneficios
(
    cd_vaga INT,
    cd_beneficio INT,

    CONSTRAINT pk_vaga_beneficios PRIMARY KEY (cd_vaga, cd_beneficio),
    CONSTRAINT fk_vaga_beneficios_vaga FOREIGN KEY (cd_vaga) REFERENCES vaga (cd_vaga),
    CONSTRAINT fk_vaga_beneficios_beneficio FOREIGN KEY (cd_beneficio) REFERENCES beneficios (cd_beneficio)
);

-- -----------------------------------------------------
-- 6. CANDIDATURA E ENTREVISTAS
-- -----------------------------------------------------

CREATE TABLE candidatura
(
    cd_candidatura INT,
    pc_match_percent DECIMAL(10,2),
    dt_candidatura DATE,
    cd_cpf_usuaria VARCHAR(11),
    cd_vaga INT,

    CONSTRAINT pk_candidatura PRIMARY KEY (cd_candidatura),
    CONSTRAINT fk_candidatura_usuaria FOREIGN KEY (cd_cpf_usuaria) REFERENCES usuaria (cd_cpf_usuaria),
    CONSTRAINT fk_candidatura_vaga FOREIGN KEY (cd_vaga) REFERENCES vaga (cd_vaga)
);

CREATE TABLE entrevista
(
    dt_entrevista DATETIME,
    cd_candidatura INT,
    cd_status_entrevista INT,

    CONSTRAINT pk_entrevista PRIMARY KEY (dt_entrevista, cd_candidatura, cd_status_entrevista),
    CONSTRAINT fk_entrevista_candidatura FOREIGN KEY (cd_candidatura) REFERENCES candidatura (cd_candidatura),
    CONSTRAINT fk_entrevista_status FOREIGN KEY (cd_status_entrevista) REFERENCES status_entrevista (cd_status_entrevista)
);



