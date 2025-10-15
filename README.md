# 📚 Biblioteca - Banco de Dados MySQL

Este repositório contém o projeto de **Gerenciamento de Biblioteca**, desenvolvido em MySQL.  
O banco de dados armazena informações sobre autores, livros, categorias, alunos e empréstimos.

Meu colega e eu fizemos todo o estudo das relações entre tabelas e aprendemos bastante sobre integridade referencial, relacionamentos 1:N e N:M, e como consultas SQL podem combinar informações de diferentes tabelas.

---

## 🗂 Estrutura do Banco de Dados

O banco de dados `biblioteca` possui as seguintes tabelas:

### Tabelas principais

- **autores**

  - `id` (INT, PK, AUTO_INCREMENT)
  - `nome` (VARCHAR)

- **categorias**

  - `id` (INT, PK, AUTO_INCREMENT)
  - `nome` (VARCHAR, UNIQUE)

- **alunos**

  - `id` (INT, PK, AUTO_INCREMENT)
  - `nome` (VARCHAR)
  - `email` (VARCHAR, UNIQUE)

- **livros**

  - `id` (INT, PK, AUTO_INCREMENT)
  - `titulo` (VARCHAR)
  - `ano_publicacao` (INT)
  - `autor_id` (INT, FK → autores.id)
  - `categoria_id` (INT, FK → categorias.id)

- **emprestimos**
  - `id` (INT, PK, AUTO_INCREMENT)
  - `livro_id` (INT, FK → livros.id)
  - `aluno_id` (INT, FK → alunos.id)
  - `data_retirada` (DATE)
  - `data_prevista` (DATE)
  - `data_devolucao` (DATE, opcional)

---

## 📝 Inserção de Dados

- 10 autores cadastrados.
- 5 categorias iniciais.
- 30 livros com títulos reais, ano de publicação, autor e categoria.
- 30 alunos cadastrados com nome e email.
- 20 empréstimos registrados, com datas de retirada, devolução e status (em dia ou atrasado).

---

## 🔍 Reflexões do Projeto

### ON DELETE CASCADE

Meu colega e eu entendemos que o uso de **ON DELETE CASCADE** pode ser perigoso.  
Se excluirmos um registro "pai" (por exemplo, um autor), todos os registros "filhos" relacionados (como livros desse autor) serão apagados automaticamente.  
Isso pode levar à perda de muitos dados sem querer, então é importante usar com cuidado ou tratar exclusões manualmente.

### JOINs

Aprendemos que precisamos de **JOINs** para responder a muitas consultas.  
Por exemplo, para listar livros com seus autores e categorias, as informações estão em tabelas separadas.  
O JOIN permite combinar tudo em uma única tabela de resultado.  
Isso é essencial também para consultas de N:M, como empréstimos entre alunos e livros.

---

## 🔗 Consultas Realizadas

- Listar todos os livros com seus autores e categorias.
- Listar todos os empréstimos com aluno, título do livro e datas.
- Listar apenas empréstimos atrasados.
- Mostrar autores que têm mais de um livro na biblioteca.
- Criar uma VIEW (`vw_loans`) que mostra o título do livro, aluno, data prevista e status do empréstimo (em dia ou atrasado).
- Contar a quantidade de livros emprestados por categoria.

---

## ✅ Conclusão

Este projeto nos ajudou a entender melhor:

- Como modelar um banco de dados relacional.
- A importância da integridade referencial.
- Como trabalhar com relacionamentos 1:N e N:M.
- Como estruturar consultas complexas usando JOINs e criar views para simplificar relatórios.
