CREATE DATABASE IF NOT EXISTS musicdb;

USE musicdb;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela de playlists, com relacionamento para usuário
CREATE TABLE IF NOT EXISTS playlist (
    id_playlist INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    nome VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

-- Tabela de músicas
CREATE TABLE IF NOT EXISTS musica (
    id_musica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    artista VARCHAR(255),
    duracao INT
);

CREATE TABLE IF NOT EXISTS playlist_music (
    id_playlist INT,
    id_musica INT,
    PRIMARY KEY (id_playlist, id_musica),
    FOREIGN KEY (id_playlist) REFERENCES playlist (id_playlist),
    FOREIGN KEY (id_musica) REFERENCES musica (id_musica)
);

INSERT INTO
    usuario (nome, email)
VALUES (
        'Ana Souza',
        'ana.souza@gmail.com'
    ),
    (
        'Carlos Silva',
        'carlos.silva@yahoo.com'
    ),
    (
        'Mariana Lima',
        'mariana.lima@gmail.com'
    ),
    (
        'João Pedro',
        'joao.pedro@hotmail.com'
    ),
    (
        'Beatriz Mendes',
        'beatriz.mendes@gmail.com'
    ),
    (
        'Felipe Costa',
        'felipe.costa@gmail.com'
    ),
    (
        'Larissa Gomes',
        'larissa.gomes@gmail.com'
    ),
    (
        'Rafael Oliveira',
        'rafael.oliveira@gmail.com'
    ),
    (
        'Camila Rocha',
        'camila.rocha@gmail.com'
    ),
    (
        'Lucas Martins',
        'lucas.martins@gmail.com'
    ),
    (
        'Juliana Ferreira',
        'juliana.ferreira@gmail.com'
    ),
    (
        'Bruno Almeida',
        'bruno.almeida@gmail.com'
    ),
    (
        'Fernanda Ribeiro',
        'fernanda.ribeiro@gmail.com'
    ),
    (
        'Diego Fernandes',
        'diego.fernandes@gmail.com'
    ),
    (
        'Gabriela Carvalho',
        'gabriela.carvalho@gmail.com'
    ),
    (
        'André Santos',
        'andre.santos@gmail.com'
    ),
    (
        'Patrícia Moreira',
        'patricia.moreira@gmail.com'
    ),
    (
        'Thiago Araújo',
        'thiago.araujo@gmail.com'
    ),
    (
        'Carolina Castro',
        'carolina.castro@gmail.com'
    ),
    (
        'Eduardo Teixeira',
        'eduardo.teixeira@gmail.com'
    ),
    (
        'Natália Pires',
        'natalia.pires@gmail.com'
    ),
    (
        'Vinícius Mendes',
        'vinicius.mendes@gmail.com'
    ),
    (
        'Amanda Barbosa',
        'amanda.barbosa@gmail.com'
    ),
    (
        'Rodrigo Nunes',
        'rodrigo.nunes@gmail.com'
    ),
    (
        'Isabela Duarte',
        'isabela.duarte@gmail.com'
    ),
    (
        'Marcelo Guedes',
        'marcelo.guedes@gmail.com'
    ),
    (
        'Tatiane Faria',
        'tatiane.faria@gmail.com'
    ),
    (
        'Paulo Henrique',
        'paulo.henrique@gmail.com'
    ),
    (
        'Clara Rezende',
        'clara.rezende@gmail.com'
    ),
    (
        'Leonardo Prado',
        'leonardo.prado@gmail.com'
    ),
    (
        'Débora Freitas',
        'debora.freitas@gmail.com'
    ),
    (
        'Ricardo Mendes',
        'ricardo.mendes@gmail.com'
    ),
    (
        'Luana Almeida',
        'luana.almeida@gmail.com'
    ),
    (
        'Fernando Rocha',
        'fernando.rocha@gmail.com'
    ),
    (
        'Aline Ribeiro',
        'aline.ribeiro@gmail.com'
    ),
    (
        'Gustavo Moura',
        'gustavo.moura@gmail.com'
    ),
    (
        'Michele Cardoso',
        'michele.cardoso@gmail.com'
    ),
    (
        'Daniel Correia',
        'daniel.correia@gmail.com'
    ),
    (
        'Tatiana Lima',
        'tatiana.lima@gmail.com'
    ),
    (
        'Pedro Henrique',
        'pedro.henrique@gmail.com'
    );

INSERT INTO
    musica (titulo, artista, duracao)
VALUES (
        'Shape of You',
        'Ed Sheeran',
        240
    ),
    (
        'Blinding Lights',
        'The Weeknd',
        200
    ),
    ('Perfect', 'Ed Sheeran', 250),
    (
        'Bohemian Rhapsody',
        'Queen',
        360
    ),
    (
        'Hotel California',
        'Eagles',
        390
    ),
    (
        'Thriller',
        'Michael Jackson',
        280
    ),
    (
        'Sultans of Swing',
        'Dire Straits',
        340
    ),
    (
        'Viva La Vida',
        'Coldplay',
        260
    ),
    (
        'Rolling in the Deep',
        'Adele',
        230
    ),
    ('Hello', 'Adele', 270),
    (
        'Smells Like Teen Spirit',
        'Nirvana',
        300
    ),
    (
        'Enter Sandman',
        'Metallica',
        330
    ),
    (
        'Nothing Else Matters',
        'Metallica',
        370
    ),
    (
        'Sweet Child O Mine',
        'Guns N Roses',
        340
    ),
    (
        'November Rain',
        'Guns N Roses',
        540
    ),
    ('Levitating', 'Dua Lipa', 210),
    (
        'Peaches',
        'Justin Bieber',
        200
    ),
    ('Stay', 'Justin Bieber', 180),
    (
        'As It Was',
        'Harry Styles',
        170
    ),
    (
        'Anti-Hero',
        'Taylor Swift',
        200
    ),
    ('Flowers', 'Miley Cyrus', 190),
    (
        'Dance Monkey',
        'Tones and I',
        210
    ),
    (
        'Someone Like You',
        'Adele',
        280
    ),
    ('Shallow', 'Lady Gaga', 220),
    (
        'Don’t Stop Believin’',
        'Journey',
        250
    ),
    (
        'Billie Jean',
        'Michael Jackson',
        290
    ),
    (
        'Uptown Funk',
        'Bruno Mars',
        270
    ),
    (
        'Senhorita',
        'Shawn Mendes',
        200
    ),
    (
        'Watermelon Sugar',
        'Harry Styles',
        180
    ),
    (
        'Believer',
        'Imagine Dragons',
        230
    ),
    (
        'Radioactive',
        'Imagine Dragons',
        250
    ),
    ('Happier', 'Marshmello', 220),
    (
        'Closer',
        'The Chainsmokers',
        240
    ),
    (
        'Bad Guy',
        'Billie Eilish',
        190
    ),
    (
        'Ocean Eyes',
        'Billie Eilish',
        230
    ),
    ('Faded', 'Alan Walker', 210),
    ('Wake Me Up', 'Avicii', 250),
    (
        'On The Floor',
        'Jennifer Lopez',
        240
    ),
    ('Sorry', 'Justin Bieber', 210),
    (
        'Love Story',
        'Taylor Swift',
        230
    );

INSERT INTO
    playlist (id_usuario, nome)
VALUES (1, 'Favoritas da Ana'),
    (2, 'Rock do Carlos'),
    (3, 'Chill da Mariana'),
    (4, 'João Hits'),
    (5, 'Bia Sertanejo'),
    (6, 'Felipe Workout'),
    (7, 'Larissa Pop'),
    (8, 'Rafael Indie'),
    (9, 'Camila Anos 80'),
    (10, 'Lucas Eletrônica'),
    (11, 'Juliana MPB'),
    (12, 'Bruno Sertanejo'),
    (13, 'Fernanda Pop Brasil'),
    (14, 'Diego Rap'),
    (15, 'Gabriela Love Songs'),
    (16, 'André Rock Clássico'),
    (17, 'Patrícia Samba'),
    (18, 'Thiago Trap'),
    (19, 'Carolina Jazz'),
    (20, 'Eduardo Country'),
    (21, 'Natália K-pop'),
    (22, 'Vinícius Metal'),
    (23, 'Amanda Lo-Fi'),
    (24, 'Rodrigo Reggae'),
    (25, 'Isabela Dance'),
    (26, 'Marcelo Pagode'),
    (27, 'Tatiane Funk'),
    (28, 'Paulo Axé'),
    (29, 'Clara Sertanejo Raiz'),
    (30, 'Leonardo Rock Brasil'),
    (31, 'Débora Gospel'),
    (32, 'Ricardo Eletrônica'),
    (33, 'Luana Forró'),
    (34, 'Fernando Chill Vibes'),
    (35, 'Aline Indie Brasil'),
    (36, 'Gustavo Sertanejo'),
    (
        37,
        'Michele Pop Internacional'
    ),
    (38, 'Daniel Rock Pesado'),
    (39, 'Tatiana R&B'),
    (40, 'Pedro Mix Variado');

INSERT INTO
    playlist_music (id_playlist, id_musica)
VALUES (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 6),
    (3, 7),
    (3, 8),
    (4, 9),
    (4, 10),
    (5, 11),
    (5, 12),
    (6, 13),
    (6, 14),
    (7, 15),
    (7, 16),
    (8, 17),
    (8, 18),
    (9, 19),
    (9, 20),
    (10, 21),
    (10, 22),
    (11, 23),
    (11, 24),
    (12, 25),
    (12, 26),
    (13, 27),
    (13, 28),
    (14, 29),
    (14, 30),
    (15, 31),
    (15, 32),
    (16, 33),
    (16, 34),
    (17, 35),
    (17, 36),
    (18, 37),
    (18, 38),
    (19, 39),
    (19, 40);

-- =====================================================================
-- OPERAÇÕES DE LEITURA (READ)
-- =====================================================================

-- Selecionar todos os usuários cadastrados
SELECT * FROM usuario;

-- Selecionar todas as músicas de um determinado artista (ex: Adele)
SELECT titulo, duracao FROM musica WHERE artista = 'Adele';

-- Selecionar todas as músicas da playlist de um usuário específico (ex: playlist de id = 1)
SELECT
    p.nome AS nome_playlist,
    m.titulo AS titulo_musica,
    m.artista
FROM
    playlist p
    JOIN playlist_music pm ON p.id_playlist = pm.id_playlist
    JOIN musica m ON pm.id_musica = m.id_musica
WHERE
    p.id_playlist = 1;

-- =====================================================================
-- OPERAÇÕES DE ATUALIZAÇÃO (UPDATE)
-- =====================================================================

-- Atualizar o email de um usuário específico (ex: usuário de id = 2)
UPDATE usuario
SET
    email = 'carlos.silva.novo@yahoo.com'
WHERE
    id_usuario = 2;

-- Atualizar o título de uma música (ex: música de id = 1)
UPDATE musica
SET
    titulo = 'Shape of You (Remix)'
WHERE
    id_musica = 1;

-- Atualizar o nome de uma playlist (ex: playlist de id = 2)
UPDATE playlist
SET
    nome = 'Rock Clássico do Carlos'
WHERE
    id_playlist = 2;

-- =====================================================================
-- OPERAÇÕES DE EXCLUSÃO (DELETE)
-- =====================================================================

-- Remover uma música específica de uma playlist (ex: remover música 3 da playlist 1)
DELETE FROM playlist_music WHERE id_playlist = 1 AND id_musica = 3;

-- Excluir uma música da tabela de músicas (Isso irá falhar se a música estiver em alguma playlist devido à restrição de chave estrangeira)
-- Para funcionar, primeiro remova a música de todas as playlists em que ela aparece.
-- Ex: Excluindo a música com id 40
DELETE FROM playlist_music WHERE id_musica = 40;

DELETE FROM musica WHERE id_musica = 40;

-- Excluir uma playlist inteira
-- Primeiro, é preciso remover todas as músicas associadas a ela na tabela 'playlist_music'.
-- Ex: Excluindo a playlist com id = 3
DELETE FROM playlist_music WHERE id_playlist = 3;

DELETE FROM playlist WHERE id_playlist = 3;

-- Excluir um usuário e todas as suas playlists
-- (CUIDADO: Operação destrutiva. Requer apagar os registros dependentes primeiro)
-- Ex: Excluindo o usuário com id = 4 e suas playlists
DELETE FROM playlist_music
WHERE
    id_playlist IN (
        SELECT id_playlist
        FROM playlist
        WHERE
            id_usuario = 4
    );

DELETE FROM playlist WHERE id_usuario = 4;

DELETE FROM usuario WHERE id_usuario = 4;