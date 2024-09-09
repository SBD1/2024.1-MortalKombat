-- Inserir Lutadores de Mortal Kombat
INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 50, 500, 'Scorpion', 0.25, 150, 120);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 45, 480, 'Sub-Zero', 0.30, 140, 110);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 55, 530, 'Raiden', 0.20, 160, 100);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 60, 550, 'Liu Kang', 0.18, 130, 130);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 40, 470, 'Kitana', 0.22, 145, 90);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 42, 460, 'Mileena', 0.27, 140, 105);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 50, 520, 'Kung Lao', 0.24, 135, 120);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 65, 560, 'Shao Kahn', 0.15, 180, 150);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 50, 510, 'Johnny Cage', 0.20, 130, 125);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 45, 490, 'Sonya Blade', 0.23, 135, 115);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 55, 500, 'Jax Briggs', 0.22, 140, 130);

INSERT INTO Lutador (Nivel, Defesa, Vida, Nome, Chance_critica, Ataque_especial, Ataque_fisico) 
VALUES (1, 60, 540, 'Kano', 0.18, 125, 140);

-- Inserir Itens de cada Lutador

-- Scorpion (Espada Flamejante)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Espada Flamejante', 1, 'Aumenta o ataque com fogo');

-- Sub-Zero (Lâmina de Gelo)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Lâmina de Gelo', 1, 'Congela inimigos ao atacar');

-- Raiden (Bastão de Trovão)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Bastão de Trovão', 1, 'Aumenta o poder de ataque elétrico');

-- Liu Kang (Faixa de Dragão)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Faixa de Dragão', 1, 'Aumenta o dano de fogo e artes marciais');

-- Kitana (Leques Afiados)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Leques Afiados', 1, 'Causa dano crítico e corta inimigos');

-- Mileena (Sais de Aço)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Sais de Aço', 1, 'Aumenta a velocidade de ataque e dano crítico');

-- Kung Lao (Chapéu Cortante)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Chapéu Cortante', 1, 'Dá golpes giratórios e aumenta o ataque');

-- Shao Kahn (Martelo da Destruição)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Martelo da Destruição', 1, 'Aumenta dano pesado e resistência');

-- Johnny Cage (Óculos de Estrela)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Óculos de Estrela', 1, 'Aumenta a chance de crítico e estilo de luta');

-- Sonya Blade (Faca de Operações)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Faca de Operações', 1, 'Aumenta precisão e dano em ataques furtivos');

-- Jax Briggs (Braços Biônicos)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Braços Biônicos', 1, 'Aumenta força e resistência física');

-- Kano (Lâmina Laser)
INSERT INTO Item (nome, nivel, habilidade) 
VALUES ('Lâmina Laser', 1, 'Aumenta dano e permite ataques a longa distância');

-- Criar instâncias dos itens
INSERT INTO InstanciaItem (idItem) VALUES (1); -- Espada Flamejante (Scorpion)
INSERT INTO InstanciaItem (idItem) VALUES (2); -- Lâmina de Gelo (Sub-Zero)
INSERT INTO InstanciaItem (idItem) VALUES (3); -- Bastão de Trovão (Raiden)
INSERT INTO InstanciaItem (idItem) VALUES (4); -- Faixa de Dragão (Liu Kang)
INSERT INTO InstanciaItem (idItem) VALUES (5); -- Leques Afiados (Kitana)
INSERT INTO InstanciaItem (idItem) VALUES (6); -- Sais de Aço (Mileena)
INSERT INTO InstanciaItem (idItem) VALUES (7); -- Chapéu Cortante (Kung Lao)
INSERT INTO InstanciaItem (idItem) VALUES (8); -- Martelo da Destruição (Shao Kahn)
INSERT INTO InstanciaItem (idItem) VALUES (9); -- Óculos de Estrela (Johnny Cage)
INSERT INTO InstanciaItem (idItem) VALUES (10); -- Faca de Operações (Sonya Blade)
INSERT INTO InstanciaItem (idItem) VALUES (11); -- Braços Biônicos (Jax Briggs)
INSERT INTO InstanciaItem (idItem) VALUES (12); -- Lâmina Laser (Kano)

-- Inserir Armaduras para cada Lutador

-- Scorpion (Armadura Infernal)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (13, 'Armadura Infernal', 50, 40, 200);

-- Sub-Zero (Armadura de Gelo)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (14, 'Armadura de Gelo', 45, 55, 190);

-- Raiden (Armadura do Trovão)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (15, 'Armadura do Trovão', 40, 60, 210);

-- Liu Kang (Armadura de Dragão)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (16, 'Armadura de Dragão', 55, 45, 220);

-- Kitana (Armadura Real)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (17, 'Armadura Real', 40, 50, 180);

-- Mileena (Armadura de Lâminas)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (18, 'Armadura de Lâminas', 45, 45, 195);

-- Kung Lao (Túnica Monástica)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (19, 'Túnica Monástica', 50, 50, 210);

-- Shao Kahn (Armadura Imperial)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (20, 'Armadura Imperial', 70, 60, 250);

-- Johnny Cage (Colete à Prova de Balas)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (21, 'Colete à Prova de Balas', 50, 40, 200);

-- Sonya Blade (Armadura Tática)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (22, 'Armadura Tática', 45, 55, 190);

-- Jax Briggs (Armadura Militar)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (23, 'Armadura Militar', 60, 50, 220);

-- Kano (Armadura Cibernética)
INSERT INTO Armadura (idItem, nome, defesaFisica, defesaEspecial, vida) 
VALUES (24, 'Armadura Cibernética', 55, 50, 210);

-- Criar instâncias das armaduras
INSERT INTO InstanciaItem (idItem) VALUES (13); -- Armadura Infernal (Scorpion)
INSERT INTO InstanciaItem (idItem) VALUES (14); -- Armadura de Gelo (Sub-Zero)
INSERT INTO InstanciaItem (idItem) VALUES (15); -- Armadura do Trovão (Raiden)
INSERT INTO InstanciaItem (idItem) VALUES (16); -- Armadura de Dragão (Liu Kang)
INSERT INTO InstanciaItem (idItem) VALUES (17); -- Armadura Real (Kitana)
INSERT INTO InstanciaItem (idItem) VALUES (18); -- Armadura de Lâminas (Mileena)
INSERT INTO InstanciaItem (idItem) VALUES (19); -- Túnica Monástica (Kung Lao)
INSERT INTO InstanciaItem (idItem) VALUES (20); -- Armadura Imperial (Shao Kahn)
INSERT INTO InstanciaItem (idItem) VALUES (21); -- Colete à Prova de Balas (Johnny Cage)
INSERT INTO InstanciaItem (idItem) VALUES (22); -- Armadura Tática (Sonya Blade)
INSERT INTO InstanciaItem (idItem) VALUES (23); -- Armadura Militar (Jax Briggs)
INSERT INTO InstanciaItem (idItem) VALUES (24); -- Armadura Cibernética (Kano)

-- Inserir 12 Salas de Combate
INSERT INTO Sala (tipo, andar, numero, nome) 
VALUES ('C', 1, 101, 'Sala de Combate 1'),
       ('C', 1, 102, 'Sala de Combate 2'),
       ('C', 1, 103, 'Sala de Combate 3'),
       ('C', 2, 201, 'Sala de Combate 4'),
       ('C', 2, 202, 'Sala de Combate 5'),
       ('C', 2, 203, 'Sala de Combate 6'),
       ('C', 3, 301, 'Sala de Combate 7'),
       ('C', 3, 302, 'Sala de Combate 8'),
       ('C', 3, 303, 'Sala de Combate 9'),
       ('C', 4, 401, 'Sala de Combate 10'),
       ('C', 4, 402, 'Sala de Combate 11'),
       ('C', 4, 403, 'Sala de Combate 12');

-- Associar as Salas à tabela SalaCombate
INSERT INTO SalaCombate (idSala) 
SELECT idSala FROM Sala WHERE tipo = 'C';

-- Inserir Sala de Evento
INSERT INTO Sala (tipo, andar, numero, nome) 
VALUES ('E', 5, 501, 'Sala de Evento Especial');

-- Associar a Sala de Evento à tabela SalaEvento
INSERT INTO SalaEvento (idSala, descricao) 
VALUES ((SELECT idSala FROM Sala WHERE nome = 'Sala de Evento Especial'), 'Evento Misterioso de Mortal Kombat');

-- Atualizar os stats de Shao Kahn como Lutador Chefe
UPDATE Lutador 
SET Nivel = Nivel + 10, Defesa = Defesa + 100, Vida = Vida + 1000, 
    Chance_critica = Chance_critica + 0.1, Ataque_especial = Ataque_especial + 150, Ataque_fisico = Ataque_fisico + 150 
WHERE Nome = 'Shao Kahn';

-- Criar instância do item para Shao Kahn (Chefe)
INSERT INTO InstanciaItem (idItem) VALUES (20); -- Armadura Imperial
INSERT INTO LutadorChefe (idLutador, idInstanciaitem) 
VALUES ((SELECT idLutador FROM Lutador WHERE Nome = 'Shao Kahn'), (SELECT MAX(idInstanciaitem) FROM InstanciaItem));

-- Atualizar os stats de Scorpion como Lutador Chefe
UPDATE Lutador 
SET Nivel = Nivel + 10, Defesa = Defesa + 90, Vida = Vida + 950, 
    Chance_critica = Chance_critica + 0.12, Ataque_especial = Ataque_especial + 140, Ataque_fisico = Ataque_fisico + 140 
WHERE Nome = 'Scorpion';

-- Criar instância do item para Scorpion (Chefe)
INSERT INTO InstanciaItem (idItem) VALUES (13); -- Armadura Infernal
INSERT INTO LutadorChefe (idLutador, idInstanciaitem) 
VALUES ((SELECT idLutador FROM Lutador WHERE Nome = 'Scorpion'), (SELECT MAX(idInstanciaitem) FROM InstanciaItem));

-- Atualizar os stats de Sub-Zero como Lutador Chefe
UPDATE Lutador 
SET Nivel = Nivel + 10, Defesa = Defesa + 95, Vida = Vida + 900, 
    Chance_critica = Chance_critica + 0.11, Ataque_especial = Ataque_especial + 145, Ataque_fisico = Ataque_fisico + 145 
WHERE Nome = 'Sub-Zero';

-- Criar instância do item para Sub-Zero (Chefe)
INSERT INTO InstanciaItem (idItem) VALUES (14); -- Armadura de Gelo
INSERT INTO LutadorChefe (idLutador, idInstanciaitem) 
VALUES ((SELECT idLutador FROM Lutador WHERE Nome = 'Sub-Zero'), (SELECT MAX(idInstanciaitem) FROM InstanciaItem));

-- Inserir Salas de Combate
INSERT INTO SalaCombate (idSala) VALUES (1);
INSERT INTO SalaCombate (idSala) VALUES (3);

-- Inserir Salas de Evento
INSERT INTO SalaEvento (idSala, descricao) VALUES (2, 'Evento especial: diminuição de ataque de todos os lutadores em 20%');

-- Inserir Ligações entre Salas
INSERT INTO se_liga (idSalaO, idSalaD) VALUES (1, 2);
INSERT INTO se_liga (idSalaO, idSalaD) VALUES (2, 3);


-- Inserir Lutador Chefe (Chefe de andar 3)
INSERT INTO LutadorChefe (idLutador, idInstanciaitem) VALUES (4, 1); -- Liu Kang como chefe

-- Associar Lutadores a Salas de Combate
INSERT INTO Tem_lutador (idSala, idInstancialutador) VALUES (1, 1); -- Scorpion na sala de combate inicial
INSERT INTO Tem_lutador (idSala, idInstancialutador) VALUES (1, 2); -- Sub-Zero na sala de combate inicial
INSERT INTO Tem_lutador (idSala, idInstancialutador) VALUES (3, 3); -- Raiden na sala intermediária
INSERT INTO Tem_lutador (idSala, idInstancialutador) VALUES (3, 4); -- Liu Kang na sala intermediária

-- Inserir Jogadores
INSERT INTO Jogador (nivel, defesa, vida, nome, chanceCritica, ataqueEspecial, ataqueFisico, arma, armadura, artefacto, classe) 
VALUES (1, 50, 600, 'Jogador1', 0.20, 90, 110, 1, 1, 0, 'A');

-- Criar Inventários para os jogadores
INSERT INTO Inventario (idJogador) VALUES (1);

-- Associar Jogadores a Salas
INSERT INTO Tem_Jogador (idSala, idJogador) VALUES (1, 1); -- Jogador1 na sala de combate inicial


-- Jogadores equipam itens
INSERT INTO Jogador_equipa (idJogador, idInstanciaitem) VALUES (1, 1); -- Jogador1 equipa Espada Flamejante

-- Inserir Skills
INSERT INTO Skills (idSkills, nome, descricao) VALUES (1, 'Chute Rápido', 'Um chute extremamente veloz');
INSERT INTO Skills (idSkills, nome, descricao) VALUES (2, 'Golpe Congelante', 'Congela o inimigo ao tocar');
INSERT INTO Skills (idSkills, nome, descricao) VALUES (3, 'Teleporte', 'Teleporta-se rapidamente atrás do inimigo');

-- Jogadores aprendem Skills
INSERT INTO Jogador_possue (idJogador, idSkills) VALUES (1, 1); -- Jogador1 aprende Chute Rápido
INSERT INTO Jogador_possue (idJogador, idSkills) VALUES (1, 2); -- Jogador2 aprende Golpe Congelante
