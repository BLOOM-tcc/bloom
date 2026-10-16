USE bloom;

INSERT INTO cidade (cd_cidade, nm_cidade, sg_uf) VALUES 
(1, 'São Paulo', 'SP'),
(2, 'Santos', 'SP'),
(3, 'Campinas', 'SP'),
(4, 'Rio de Janeiro', 'RJ');

INSERT INTO idioma (cd_idioma, nm_idioma) VALUES 
(1, 'Português'),
(2, 'Inglês'),
(3, 'Espanhol'),
(4, 'Francês');

INSERT INTO nivel_idioma (cd_nivel_idioma, nm_nivel_idioma) VALUES 
(1, 'Básico'),
(2, 'Intermediário'),
(3, 'Avançado'),
(4, 'Nativo');

INSERT INTO tipo_formacao (cd_tipo_formacao, nm_tipo_formacao) VALUES 
(1, 'Ensino Médio'),
(2, 'Técnico'),
(3, 'Graduação / Ensino Superior'),
(4, 'Pós-Graduação / Especialização');

INSERT INTO formacao (cd_formacao, nm_formacao) VALUES 
(1, 'Análise e Desenvolvimento de Sistemas'),
(2, 'Ciência da Computação'),
(3, 'Sistemas de Informação'),
(4, 'Design Digital'),
(5, 'Administração');

INSERT INTO status_curso (cd_status_curso, nm_status_curso) VALUES 
(1, 'Em Andamento'),
(2, 'Concluído');

INSERT INTO status_entrevista (cd_status_entrevista, nm_status_entrevista) VALUES 
(1, 'Agendada'),
(2, 'Em Avaliação'),
(3, 'Aprovada'),
(4, 'Reprovada');

INSERT INTO tipo_contratacao (cd_tipo_contratacao, nm_tipo_contratacao) VALUES 
(1, 'CLT'),
(2, 'PJ'),
(3, 'Estágio');

INSERT INTO tipo_local_trabalho (cd_tipo_local_trabalho, nm_tipo_local_trabalho) VALUES 
(1, 'Presencial'),
(2, 'Híbrido'),
(3, 'Remoto');

INSERT INTO tipo_salario (cd_tipo_salario, nm_tipo_salario) VALUES 
(1, 'Fixo'),
(2, 'Faixa salarial'),
(3, 'A combinar');

INSERT INTO cargo (cd_cargo, nm_cargo) VALUES 
(1, 'Desenvolvedora Front-End'),
(2, 'Desenvolvedora Back-End'),
(3, 'Desenvolvedora Full Stack'),
(4, 'Analista de Banco de Dados'),
(5, 'Designer UX/UI');

INSERT INTO habilidade (cd_habilidade, nm_habilidade) VALUES 
(1, 'PHP'),
(2, 'MySQL'),
(3, 'HTML'),
(4, 'CSS'),
(5, 'JavaScript'),
(6, 'React'),
(7, 'Pacote Office');

INSERT INTO beneficios (cd_beneficio, nm_beneficio) VALUES 
(1, 'Vale Refeição'),
(2, 'Vale Transporte'),
(3, 'Plano de Saúde'),
(4, 'Plano Odontológico'),
(5, 'Auxílio Home Office');

-- 7. Empresas
INSERT INTO empresa (cd_cnpj_empresa, nm_empresa, nm_email_empresa, cd_senha_empresa, ds_empresa, ds_cultura_empresa, ds_beneficios, cd_score_inclusao, cd_telefone_empresa) VALUES 
('45216200000101', 'IPort Solutions', 'iportsolutions@gmail.com', MD5('empresa123'), 'Plataforma para gestão portuária e aduaneira.', 'Inclusiva, moderna e focada no desenvolvimento técnico.', 'VR, VT, Plano de Saúde', 9.50, 1399196131),
('12345678000199', 'Tech Bloom Enterprise', 'contato@techbloom.com', MD5('empresa123'), 'Empresa de tecnologia focada na diversidade e equidade de gênero.', 'Ambiente acolhedor focado na evolução profissional de mulheres na tecnologia.', 'VR, Auxílio Home Office, PPR', 9.80, 1198888777);

-- 8. Usuárias (Candidatas)
INSERT INTO usuaria (cd_cpf_usuaria, nm_usuaria, email_usuaria, cd_senha_usuaria, cd_telefone_usuaria, cd_cidade, dt_nascimento, vl_pretensao_salarial, nm_cargo_desejado) VALUES 
('24508351808', 'Juliana Santos', 'juliana.santos@email.com', MD5('123456'), '11987654321', 1, '2002-04-12', 3500, 'Desenvolvedora Front-End'),
('11122233344', 'Chanthal Segura', 'segurachanty@gmail.com', MD5('123456'), '13991714872', 2, '2001-08-20', 4500, 'Desenvolvedora Full Stack');

-- 9. Detalhes da Usuária (Idiomas, Experiências, Formações e Habilidades)
INSERT INTO usuaria_idioma (cd_cpf_usuaria, cd_idioma, cd_nivel_idioma) VALUES 
('24508351808', 1, 4), -- Português Nativo
('24508351808', 2, 2), -- Inglês Intermediário
('11122233344', 1, 4), -- Português Nativo
('11122233344', 2, 3); -- Inglês Avançado

INSERT INTO experiencia (cd_experiencia, nm_empresa, nm_cargo, dt_inicio, dt_fim, cd_cpf_usuaria) VALUES 
(1, 'Agência Web', 'Estagiária de Front-End', '2023-01-10', '2023-12-20', '24508351808'),
(2, 'Tech Lab', 'Desenvolvedora Junior', '2024-01-15', NULL, '24508351808'),
(3, 'Dev House', 'Suporte Técnico', '2022-05-01', '2023-05-01', '11122233344');

INSERT INTO usuaria_formacao (cd_cpf_usuaria, cd_formacao, nm_local, dt_inicio, dt_fim, ic_cursando, cd_cidade, cd_tipo_formacao) VALUES 
('24508351808', 1, 'FATEC São Paulo', '2022-02-01', '2024-12-15', 1, 1, 3),
('11122233344', 2, 'UNISANTOS', '2021-02-01', '2024-12-15', 0, 2, 3);

INSERT INTO habilidade_usuaria (cd_habilidade, cd_cpf_usuaria) VALUES 
(1, '24508351808'), -- PHP
(2, '24508351808'), -- MySQL
(3, '24508351808'), -- HTML
(4, '24508351808'), -- CSS
(5, '24508351808'), -- JS
(2, '11122233344'), -- MySQL
(6, '11122233344'); -- React

INSERT INTO trilha (cd_trilha, nm_trilha, cd_cnpj_empresa) VALUES 
(1, 'Trilha Iniciante Web Dev', '45216200000101'),
(2, 'Aprofundamento em Banco de Dados', '12345678000199');

INSERT INTO curso (cd_curso, nm_curso, qt_horas_curso, ic_possui_certificado, qt_etapas_curso, nm_nivel_curso, ds_curso) VALUES 
(1, 'Lógica de Programação e HTML/CSS', 40, 1, 5, 'Iniciante', 'Aprenda os fundamentos do desenvolvimento web.'),
(2, 'Banco de Dados SQL do Zero', 30, 1, 4, 'Intermediário', 'Domine consultas relacionais e modelagem.');

INSERT INTO curso_trilha (cd_curso, cd_trilha, cd_cnpj_empresa) VALUES 
(1, 1, '45216200000101'),
(2, 2, '12345678000199');

INSERT INTO usuaria_curso_trilha (cd_cpf_usuaria, cd_curso, cd_trilha, cd_cnpj_empresa, dt_inicio_curso, dt_finalizacao_curso, dt_ultimo_acesso, cd_status_entrevista) VALUES 
('24508351808', 1, 1, '45216200000101', '2024-02-01', NULL, '2024-03-01', 1);

INSERT INTO vaga (cd_vaga, nm_vaga, ds_vaga, dt_publicacao_vaga, cd_cnpj_empresa, qt_carga_semanal, cd_cargo, cd_tipo_local_trabalho, cd_tipo_salario, cd_tipo_contratacao, vl_salario_minimo, vl_salario_maximo) VALUES 
(1, 'Desenvolvedora Web Front-End Jr', 'Buscamos desenvolvedora com conhecimentos em HTML, CSS e PHP.', '2024-03-01', '45216200000101', 40, 1, 2, 1, 1, 3000.00, 4000.00),
(2, 'Desenvolvedora Full Stack Pleno', 'Oportunidade para atuar com React e MySQL em projetos portuários.', '2024-03-05', '12345678000199', 40, 3, 3, 1, 2, 5000.00, 6500.00);

INSERT INTO formacao_vaga (cd_formacao, cd_vaga) VALUES 
(1, 1),
(2, 2);

INSERT INTO vaga_habilidade (cd_vaga, cd_habilidade, ic_diferencial) VALUES 
(1, 1, 0), 
(1, 3, 0), 
(1, 4, 0), 
(2, 2, 0), 
(2, 6, 1); 

INSERT INTO vaga_beneficios (cd_vaga, cd_beneficio) VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 5);

INSERT INTO vaga_salva (cd_cpf_usuaria, cd_vaga) VALUES 
('24508351808', 1);


INSERT INTO candidatura (cd_candidatura, pc_match_percent, dt_candidatura, cd_cpf_usuaria, cd_vaga) VALUES 
(1, 85.50, '2024-03-10', '24508351808', 1),
(2, 90.00, '2024-03-12', '11122233344', 2);

INSERT INTO entrevista (dt_entrevista, cd_candidatura, cd_status_entrevista) VALUES 
('2024-03-20 14:00:00', 1, 1),
('2024-03-22 10:30:00', 2, 3);

