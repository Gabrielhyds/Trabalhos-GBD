# 🎵 MusicDB — Banco de Dados de Músicas, Usuários e Playlists

Um banco de dados relacional desenvolvido em **MySQL**, com o objetivo de gerenciar **usuários, músicas e playlists**.  
Inclui estrutura de tabelas, relacionamentos e exemplos de consultas SQL (CRUD: Create, Read, Update, Delete).

---

## 📂 Estrutura do Banco de Dados

**Nome do banco:** `musicdb`

### 🧍‍♂️ Tabela `usuario`
Armazena informações básicas dos usuários.

| Campo        | Tipo         | Descrição                    |
|---------------|--------------|-------------------------------|
| `id_usuario`  | INT (PK)     | Identificador único do usuário |
| `nome`        | VARCHAR(100) | Nome completo do usuário       |
| `email`       | VARCHAR(100) | Endereço de e-mail             |

---

### 🎧 Tabela `playlist`
Relaciona playlists a seus respectivos usuários.

| Campo         | Tipo         | Descrição                         |
|----------------|--------------|------------------------------------|
| `id_playlist`  | INT (PK)     | Identificador único da playlist    |
| `id_usuario`   | INT (FK)     | ID do usuário dono da playlist     |
| `nome`         | VARCHAR(255) | Nome da playlist                   |

🔗 **Relacionamento:**  
`playlist.id_usuario` → `usuario.id_usuario`

---

### 🎵 Tabela `musica`
Contém informações sobre cada música cadastrada.

| Campo        | Tipo         | Descrição                 |
|---------------|--------------|----------------------------|
| `id_musica`  | INT (PK)     | Identificador da música    |
| `titulo`     | VARCHAR(255) | Título da música           |
| `artista`    | VARCHAR(255) | Nome do artista/banda      |
| `duracao`    | INT          | Duração em segundos        |

---

### 🔁 Tabela `playlist_music`
Tabela de relacionamento **N:N** entre playlists e músicas.

| Campo         | Tipo | Descrição                             |
|----------------|------|----------------------------------------|
| `id_playlist`  | INT  | ID da playlist                        |
| `id_musica`    | INT  | ID da música associada à playlist     |

🔗 **Relacionamentos:**  
- `id_playlist` → `playlist.id_playlist`  
- `id_musica` → `musica.id_musica`

---

## 🧩 População Inicial

O script inclui:
- **40 usuários reais fictícios**
- **40 músicas populares** (diversos artistas)
- **40 playlists personalizadas**
- **Associações de músicas às playlists**

---

## ⚙️ Exemplo de Consultas SQL (CRUD)

### 📖 Leitura (READ)

#### 🔹 Listar todos os usuários
```sql
SELECT * FROM usuario;
