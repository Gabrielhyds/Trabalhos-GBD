# 📚 Biblioteca - Banco de Dados MySQL

Este repositório contém o projeto de **Gerenciamento de Biblioteca**, desenvolvido em MySQL. O banco de dados armazena informações sobre autores, livros, categorias, alunos e empréstimos.

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

## 🔗 Consultas Realizadas

1. **Listar todos os livros com autor e categoria**
```sql
SELECT livros.id, livros.titulo, autores.nome AS autor, categorias.nome AS categoria
FROM livros
JOIN autores ON livros.autor_id = autores.id
JOIN categorias ON livros.categoria_id = categorias.id;