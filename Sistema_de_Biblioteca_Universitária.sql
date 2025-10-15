-- =========================================================
-- Passo 1 – Criando o banco de dados
-- =========================================================
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE biblioteca;

-- =========================================================
-- Passo 2 – Criando tabelas
-- =========================================================

-- Tabela de autores
-- Cada autor pode escrever vários livros (1:N)
CREATE TABLE autores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

-- Tabela de categorias
-- Cada livro pertence a uma única categoria
-- O nome da categoria deve ser único
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de alunos
-- Cada aluno pode pegar vários livros emprestados
-- O email deve ser único
CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Tabela de livros
-- Relacionamento 1:N com autores
-- Relacionamento 1:N com categorias
-- ON DELETE CASCADE poderia ser usado para excluir livros automaticamente quando o autor ou categoria for excluído,
-- mas cuidado: pode remover muitos dados sem querer
CREATE TABLE livros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao INT,
    autor_id INT,
    categoria_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores (id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias (id) ON DELETE CASCADE
);

-- Tabela de empréstimos
-- Relacionamento N:M entre alunos e livros
-- Cada empréstimo registra datas de retirada, prevista e devolução
CREATE TABLE emprestimos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    livro_id INT,
    aluno_id INT,
    data_retirada DATE NOT NULL,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES livros (id) ON DELETE CASCADE,
    FOREIGN KEY (aluno_id) REFERENCES alunos (id) ON DELETE CASCADE
);

-- =========================================================
-- REFLEXÃO: ON DELETE CASCADE
-- =========================================================
-- Meu colega e eu entendemos que o ON DELETE CASCADE pode ser perigoso.
-- Isso porque, se eu excluir um registro "pai" (por exemplo, um autor),
-- todos os registros "filhos" relacionados (como os livros desse autor) serão apagados automaticamente.
-- Ou seja, podemos perder muitos dados sem querer.
-- Por isso, é importante ter cuidado ou tratar exclusões manualmente em cenários críticos.

-- =========================================================
-- Passo 3 – Inserindo dados
-- =========================================================

-- Inserindo 10 autores
INSERT INTO
    autores (nome)
VALUES ('Machado de Assis'),
    ('J. K. Rowling'),
    ('George Orwell'),
    ('Clarice Lispector'),
    ('Isaac Asimov'),
    ('J.R.R. Tolkien'),
    ('Agatha Christie'),
    ('Gabriel García Márquez'),
    ('Stephen King'),
    ('Haruki Murakami');

-- Inserindo 5 categorias
INSERT INTO
    categorias (nome)
VALUES ('Romance'),
    ('Fantasia'),
    ('Distopia'),
    ('Ficção Científica'),
    ('Mistério');

-- Inserindo 30 livros
-- Cada livro está associado a um autor e a uma categoria
INSERT INTO
    livros (
        titulo,
        ano_publicacao,
        autor_id,
        categoria_id
    )
VALUES ('Dom Casmurro', 1899, 1, 1),
    (
        'Memórias Póstumas de Brás Cubas',
        1881,
        1,
        1
    ),
    (
        'Harry Potter e a Pedra Filosofal',
        1997,
        2,
        2
    ),
    (
        'Harry Potter e a Câmara Secreta',
        1998,
        2,
        2
    ),
    ('1984', 1949, 3, 3),
    (
        'A Revolução dos Bichos',
        1945,
        3,
        3
    ),
    (
        'A Hora da Estrela',
        1977,
        4,
        1
    ),
    ('Eu, Robô', 1950, 5, 4),
    ('Fundação', 1951, 5, 4),
    (
        'O Senhor dos Anéis: A Sociedade do Anel',
        1954,
        6,
        2
    ),
    ('O Hobbit', 1937, 6, 2),
    (
        'O Assassinato no Expresso do Oriente',
        1934,
        7,
        5
    ),
    ('Morte no Nilo', 1937, 7, 5),
    (
        'Cem Anos de Solidão',
        1967,
        8,
        1
    ),
    (
        'O Amor nos Tempos do Cólera',
        1985,
        8,
        1
    ),
    ('It: A Coisa', 1986, 9, 5),
    ('O Iluminado', 1977, 9, 5),
    (
        'Kafka à Beira-Mar',
        2002,
        10,
        2
    ),
    ('1Q84', 2009, 10, 3),
    (
        'A Paixão segundo G.H.',
        1964,
        4,
        1
    ),
    (
        'O Fim da Eternidade',
        1955,
        5,
        4
    ),
    ('O Silmarillion', 1977, 6, 2),
    (
        'E Não Sobrou Nenhum',
        1939,
        7,
        5
    ),
    (
        'Crônica de uma Morte Anunciada',
        1981,
        8,
        1
    ),
    (
        'A Torre Negra: O Pistoleiro',
        1982,
        9,
        2
    ),
    ('Norwegian Wood', 1987, 10, 1),
    ('Quincas Borba', 1891, 1, 1),
    (
        'Harry Potter e o Prisioneiro de Azkaban',
        1999,
        2,
        2
    ),
    (
        'A Mão Esquerda da Escuridão',
        1969,
        5,
        4
    ),
    (
        'Os Sete Mostradores',
        1929,
        7,
        5
    );

-- Inserindo 30 alunos
INSERT INTO
    alunos (nome, email)
VALUES (
        'Ana Silva',
        'ana.silva@email.com'
    ),
    (
        'Bruno Costa',
        'bruno.costa@email.com'
    ),
    (
        'Carla Dias',
        'carla.dias@email.com'
    ),
    (
        'Daniel Martins',
        'daniel.martins@email.com'
    ),
    (
        'Eduarda Ferreira',
        'eduarda.ferreira@email.com'
    ),
    (
        'Fábio Gomes',
        'fabio.gomes@email.com'
    ),
    (
        'Gabriela Lima',
        'gabriela.lima@email.com'
    ),
    (
        'Heitor Oliveira',
        'heitor.oliveira@email.com'
    ),
    (
        'Isabela Pereira',
        'isabela.pereira@email.com'
    ),
    (
        'João Rodrigues',
        'joao.rodrigues@email.com'
    ),
    (
        'Larissa Santos',
        'larissa.santos@email.com'
    ),
    (
        'Marcos Souza',
        'marcos.souza@email.com'
    ),
    (
        'Natália Almeida',
        'natalia.almeida@email.com'
    ),
    (
        'Otávio Barbosa',
        'otavio.barbosa@email.com'
    ),
    (
        'Patrícia Castro',
        'patricia.castro@email.com'
    ),
    (
        'Rafael Ribeiro',
        'rafael.ribeiro@email.com'
    ),
    (
        'Sofia Carvalho',
        'sofia.carvalho@email.com'
    ),
    (
        'Thiago Mendes',
        'thiago.mendes@email.com'
    ),
    (
        'Valentina Rocha',
        'valentina.rocha@email.com'
    ),
    (
        'Vinícius Correia',
        'vinicius.correia@email.com'
    ),
    (
        'Amanda Azevedo',
        'amanda.azevedo@email.com'
    ),
    (
        'Beatriz Barros',
        'beatriz.barros@email.com'
    ),
    (
        'Carlos Cunha',
        'carlos.cunha@email.com'
    ),
    (
        'Débora Duarte',
        'debora.duarte@email.com'
    ),
    (
        'Erick Esteves',
        'erick.esteves@email.com'
    ),
    (
        'Fernanda Freitas',
        'fernanda.freitas@email.com'
    ),
    (
        'Guilherme Gonçalves',
        'guilherme.goncalves@email.com'
    ),
    (
        'Helena Henriques',
        'helena.henriques@email.com'
    ),
    (
        'Igor Iglesias',
        'igor.iglesias@email.com'
    ),
    (
        'Júlia Justino',
        'julia.justino@email.com'
    );

-- Registrando 20 empréstimos
-- Cada empréstimo registra data de retirada, prevista e devolução (se já ocorreu)
INSERT INTO
    emprestimos (
        livro_id,
        aluno_id,
        data_retirada,
        data_prevista,
        data_devolucao
    )
VALUES (
        1,
        10,
        '2025-08-01',
        '2025-08-15',
        '2025-08-14'
    ),
    (
        3,
        5,
        '2025-08-02',
        '2025-08-16',
        '2025-08-16'
    ),
    (
        5,
        12,
        '2025-08-05',
        '2025-08-19',
        NULL
    ),
    (
        8,
        2,
        '2025-08-05',
        '2025-08-19',
        '2025-08-20'
    ),
    (
        10,
        1,
        '2025-08-06',
        '2025-08-20',
        NULL
    ),
    (
        12,
        20,
        '2025-08-07',
        '2025-08-21',
        '2025-08-19'
    ),
    (
        15,
        18,
        '2025-08-10',
        '2025-08-24',
        NULL
    ),
    (
        17,
        7,
        '2025-08-11',
        '2025-08-25',
        '2025-08-25'
    ),
    (
        20,
        3,
        '2025-08-12',
        '2025-08-26',
        NULL
    ),
    (
        22,
        15,
        '2025-08-15',
        '2025-08-29',
        '2025-08-29'
    ),
    (
        25,
        22,
        '2025-09-01',
        '2025-09-15',
        NULL
    ),
    (
        28,
        25,
        '2025-09-03',
        '2025-09-17',
        NULL
    ),
    (
        4,
        9,
        '2025-09-04',
        '2025-09-18',
        '2025-09-15'
    ),
    (
        6,
        11,
        '2025-09-05',
        '2025-09-19',
        NULL
    ),
    (
        9,
        14,
        '2025-09-08',
        '2025-09-22',
        '2025-09-25'
    ),
    (
        14,
        28,
        '2025-09-10',
        '2025-09-24',
        NULL
    ),
    (
        19,
        29,
        '2025-09-11',
        '2025-09-25',
        NULL
    ),
    (
        21,
        30,
        '2025-09-15',
        '2025-09-29',
        '2025-09-28'
    ),
    (
        26,
        6,
        '2025-09-20',
        '2025-10-04',
        NULL
    ),
    (
        2,
        8,
        '2025-09-22',
        '2025-10-06',
        NULL
    );

-- =========================================================
-- Passo 4 – Consultando dados
-- =========================================================

-- Listar todos os livros com seus autores e categorias
SELECT livros.id, livros.titulo, autores.nome AS autor, categorias.nome AS categoria
FROM
    livros
    JOIN autores ON livros.autor_id = autores.id
    JOIN categorias ON livros.categoria_id = categorias.id;

-- Listar todos os empréstimos com aluno, livro e datas
SELECT emprestimos.id, alunos.nome AS aluno, livros.titulo AS livro, emprestimos.data_retirada, emprestimos.data_prevista, emprestimos.data_devolucao
FROM
    emprestimos
    JOIN alunos ON emprestimos.aluno_id = alunos.id
    JOIN livros ON emprestimos.livro_id = livros.id;

-- Listar empréstimos atrasados
SELECT alunos.nome AS aluno, livros.titulo AS livro, emprestimos.data_retirada, emprestimos.data_prevista, emprestimos.data_devolucao
FROM
    emprestimos
    JOIN alunos ON emprestimos.aluno_id = alunos.id
    JOIN livros ON emprestimos.livro_id = livros.id
WHERE (
        emprestimos.data_devolucao > emprestimos.data_prevista
    )
    OR (
        emprestimos.data_devolucao IS NULL
        AND CURDATE() > emprestimos.data_prevista
    );

-- Mostrar autores que têm mais de um livro
SELECT autores.nome AS autor, COUNT(livros.id) AS quantidade_livros
FROM autores
    JOIN livros ON livros.autor_id = autores.id
GROUP BY
    autores.id,
    autores.nome
HAVING
    COUNT(livros.id) > 1;

-- =========================================================
-- REFLEXÃO: JOINs
-- =========================================================
-- Meu colega e eu percebemos que precisamos usar JOINs para algumas consultas.
-- Por exemplo, se quisermos listar os livros com seus autores e categorias,
-- essas informações estão em tabelas separadas. O JOIN nos permite combinar tudo
-- em uma única tabela de resultado.
-- Também é essencial quando lidamos com empréstimos (N:M) entre alunos e livros.

-- =========================================================
-- Passo 5 – Atualizações e exclusões
-- =========================================================

-- Adicionar categoria 'Clássico' se ainda não existir
INSERT INTO
    categorias (nome)
SELECT 'Clássico'
WHERE
    NOT EXISTS (
        SELECT 1
        FROM categorias
        WHERE
            nome = 'Clássico'
    );

-- Atualizar categoria de livros de "Romance" para "Clássico"
UPDATE livros
SET
    categoria_id = (
        SELECT id
        FROM categorias
        WHERE
            nome = 'Clássico'
    )
WHERE
    categoria_id = (
        SELECT id
        FROM categorias
        WHERE
            nome = 'Romance'
    );

-- Alterar e-mail de um aluno
UPDATE alunos SET email = 'ana.souza.novo@email.com' WHERE id = 1;

-- Verificar alteração
SELECT * FROM alunos WHERE nome = 'Ana Souza';

-- Excluir um autor (pode falhar se houver livros associados, devido à integridade referencial)
DELETE FROM autores WHERE nome = 'Machado de Assis';

-- =========================================================
-- Passo 6 – Desafio extra: VIEW
-- =========================================================

-- Criar uma VIEW que mostra título do livro, aluno, data prevista e status do empréstimo
CREATE OR REPLACE VIEW vw_loans AS
SELECT
    livros.titulo AS titulo_livro,
    alunos.nome AS aluno,
    emprestimos.data_prevista,
    CASE
        WHEN emprestimos.data_devolucao IS NULL
        AND CURDATE() > emprestimos.data_prevista THEN 'Atrasado'
        WHEN emprestimos.data_devolucao > emprestimos.data_prevista THEN 'Atrasado'
        ELSE 'Em dia'
    END AS status
FROM
    emprestimos
    JOIN livros ON emprestimos.livro_id = livros.id
    JOIN alunos ON emprestimos.aluno_id = alunos.id;

-- Visualizar a VIEW
SELECT * FROM vw_loans;

-- Mostrar quantidade de livros emprestados por categoria
SELECT
    categorias.nome AS categoria,
    COUNT(emprestimos.id) AS quantidade_emprestimos
FROM
    emprestimos
    JOIN livros ON emprestimos.livro_id = livros.id
    JOIN categorias ON livros.categoria_id = categorias.id
GROUP BY
    categorias.nome
ORDER BY quantidade_emprestimos DESC;