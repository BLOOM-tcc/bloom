# Guia de Contribuição — TCC NutriPlanner

Este documento apresenta o fluxo básico para trabalhar no projeto em equipe utilizando Git e GitHub.

---

## 1. Antes de começar

Certifique-se de que você possui:

- Git instalado;
- uma conta no GitHub;
- acesso ao repositório do projeto;
- o projeto clonado no seu computador.

### Regras básicas

1. Não trabalhar diretamente na `main`.
2. Criar uma branch para cada tarefa.
3. Fazer commits pequenos e objetivos.
4. Utilizar os padrões de commit definidos neste documento.
5. Sempre atualizar a `main` antes de iniciar uma nova tarefa.
6. Criar um Pull Request antes de realizar o Merge.
7. Revisar o código dos colegas quando solicitado.
8. Não enviar senhas, chaves de API ou arquivos `.env` para o repositório.
9. Antes de apagar ou alterar arquivos importantes, conversar com o grupo.
10. Em caso de dúvida, perguntar antes de fazer alterações que possam afetar o trabalho dos outros integrantes.

---

## 2. Clonando o projeto

Clone o repositório utilizando:

```bash
git clone URL_DO_REPOSITORIO
```

Depois, entre na pasta do projeto:

```bash
cd "TCC - NutriPlanner"
```

---

## 3. Antes de começar uma tarefa

Sempre atualize sua cópia local da `main`:

```bash
git switch main
git pull
```

Isso garante que você esteja trabalhando com a versão mais recente do projeto.

---

## 4. Criando uma branch

Cada tarefa deve ser desenvolvida em uma branch própria.

Exemplo:

```bash
git switch -c feature/nome-da-tarefa
```

### Padrões de branch

#### Nova funcionalidade

```text
feature/nome-da-funcionalidade
```

Exemplo:

```text
feature/cadastro-paciente
```

#### Correção de problema

```text
fix/nome-do-problema
```

Exemplo:

```text
fix/validacao-login
```

#### Documentação

```text
docs/nome-da-documentacao
```

Exemplo:

```text
docs/diagrama-classes
```

---

## 5. Fazendo alterações

Faça as alterações normalmente no projeto.

Quando terminar uma parte que faça sentido como uma unidade, verifique as alterações:

```bash
git status
```

Você também pode visualizar as alterações realizadas com:

```bash
git diff
```

---

## 6. Criando um commit

Adicione os arquivos alterados:

```bash
git add .
```

Depois, crie o commit:

```bash
git commit -m "tipo: descrição da alteração"
```

### Tipos de commit

| Tipo | Utilização |
|---|---|
| `feat` | Nova funcionalidade |
| `fix` | Correção de problema |
| `docs` | Alteração na documentação |
| `refactor` | Alteração estrutural sem mudar o comportamento |
| `test` | Criação ou alteração de testes |
| `style` | Alterações de formatação/estilo |
| `chore` | Tarefas de manutenção |

### Exemplos

```bash
git commit -m "feat: adiciona cadastro de pacientes"
```

```bash
git commit -m "fix: corrige validacao do login"
```

```bash
git commit -m "docs: adiciona diagrama de classes"
```

Evite commits genéricos como:

```text
alterações
teste
coisas
arrumei
final
```

---

## 7. Enviando sua branch para o GitHub

Depois de fazer o commit:

```bash
git push -u origin nome-da-branch
```

Exemplo:

```bash
git push -u origin feature/cadastro-paciente
```

---

## 8. Criando um Pull Request

Depois do `push`, acesse o GitHub e crie um **Pull Request (PR)**:

```text
Sua branch → main
```

No PR, informe brevemente:

- o que foi desenvolvido;
- quais alterações foram realizadas;
- se existe algo que precisa ser revisado.

### Exemplo

**Título:**

```text
feat: adiciona cadastro de pacientes
```

**Descrição:**

```text
- Adicionada tela de cadastro;
- Criada validação dos campos;
- Integrado cadastro com o backend.
```

---

## 9. Revisão e Merge

O Pull Request deve ser revisado por outro integrante do grupo.

Após a aprovação, o PR poderá ser integrado à `main` através do **Merge**.

> **Não faça alterações diretamente na `main`.**

### Fluxo esperado

```text
main
  ↓
criar branch
  ↓
desenvolver
  ↓
commit
  ↓
push
  ↓
Pull Request
  ↓
revisão
  ↓
Merge
  ↓
main
```

---

## 10. Depois que uma alteração entrar na `main`

Antes de começar outra tarefa:

```bash
git switch main
git pull
```

Depois, crie uma nova branch:

```bash
git switch -c feature/nova-tarefa
```

A partir desse ponto, siga novamente o fluxo descrito neste documento.

## 11. Caso a main mude durante sua branch

```bash
git switch main
git pull
git switch feature/minha-tarefa
git merge main
```

Isso entrara na 'main' para atualizar seu projeto pro mais recente, voltar para sua branch que estava antes e juntar a main com a sua branch