-- Populando a tabela Lutador com personagens de Mortal Kombat
INSERT INTO Lutador (idLutador, Nivel, Defesa, Vida, Nome) VALUES 
(1, 10, 100, 1000, 'Scorpion'),
(2, 10, 90, 900, 'Sub-Zero'),
(3, 10, 80, 850, 'Raiden'),
(4, 10, 85, 880, 'Liu Kang'),
(5, 10, 95, 950, 'Kung Lao'),
(6, 10, 92, 920, 'Sonya Blade'),
(7, 10, 89, 870, 'Johnny Cage'),
(8, 10, 94, 940, 'Kitana'),
(9, 10, 88, 860, 'Jade'),
(10, 10, 91, 910, 'Mileena'),
(11, 10, 87, 870, 'Shang Tsung'),
(12, 10, 96, 970, 'Goro'),
(13, 10, 90, 900, 'Kano'),
(14, 10, 93, 930, 'Jax'),
(15, 10, 85, 880, 'Reptile'),
(16, 10, 80, 850, 'Noob Saibot'),
(17, 10, 84, 840, 'Smoke'),
(18, 10, 86, 860, 'Sindel'),
(19, 10, 88, 880, 'Shao Kahn'),
(20, 10, 92, 920, 'Baraka'),
(21, 10, 90, 900, 'Kabal'),
(22, 10, 87, 870, 'Nightwolf'),
(23, 10, 93, 930, 'Ermac'),
(24, 10, 89, 890, 'Rain'),
(25, 10, 94, 940, 'Quan Chi'),
(26, 9, 85, 850, 'Fujin'),
(27, 8, 80, 800, 'Tanya'),
(28, 9, 88, 870, 'Sektor'),
(29, 9, 87, 860, 'Cyrax'),
(30, 8, 82, 840, 'Sheeva'),
(31, 7, 75, 750, 'Sindel'),
(32, 8, 84, 820, 'Frost'),
(33, 8, 85, 830, 'Erron Black'),
(34, 7, 78, 770, 'Kotal Kahn'),
(35, 8, 80, 800, 'D\'Vorah');

-- Populando a tabela LutadorChefe
INSERT INTO LutadorChefe (idLutadorChefe, idLutador, MelhoriaAtaque, MelhoriaDefesa) VALUES 
(1, 1, 100, 100),
(2, 2, 200, 200),
(3, 3, 300, 300),
(4, 4, 400, 400),
(5, 5, 500, 500),
(6, 6, 600, 600),
(7, 7, 700, 700),
(8, 8, 800, 800),
(9, 9, 900, 900),
(10, 10, 1000, 1000),
(11, 11, 1100, 1100),
(12, 12, 1200, 1200),
(13, 13, 1300, 1300),
(14, 14, 1400, 1400),
(15, 15, 1500, 1500),
(16, 16, 1600, 1600),
(17, 17, 1700, 1700),
(18, 18, 1800, 1800),
(19, 19, 1900, 1900),
(20, 20, 2000, 2000),
(21, 21, 2100, 2100),
(22, 22, 2200, 2200),
(23, 23, 2300, 2300),
(24, 24, 2400, 2400),
(25, 25, 2500, 2500);

-- Populando a tabela Arma
INSERT INTO Arma (idArma, AtkFisico, AtkEspecial, Nivel, Nome, Descricao) VALUES 
(1, 50, 30, 1, 'Espada Infernal', 'A espada flamejante de Scorpion.'),
(2, 45, 35, 1, 'Gelo Mortal', 'A espada de gelo de Sub-Zero.'),
(3, 55, 25, 1, 'Martelo de Raio', 'Martelo poderoso de Raiden.'),
(4, 40, 40, 1, 'Chuteiro do Dragão', 'O calçado especial de Liu Kang.'),
(5, 48, 32, 1, 'Lâmina do Chapéu', 'O chapéu afiado de Kung Lao.'),
(6, 52, 28, 1, 'Punhal de Combate', 'Punhal de Sonya Blade.'),
(7, 47, 33, 1, 'Soco de Ouro', 'Luvas de Johnny Cage.'),
(8, 53, 27, 1, 'Leque de Guerra', 'Leque de Kitana.'),
(9, 46, 34, 1, 'Leque de Jade', 'Leque de Jade.'),
(10, 49, 31, 1, 'Sai de Combate', 'Sai de Mileena.');

-- Populando a tabela Armadura
INSERT INTO Armadura (idArmadura, DefesaFisica, DefesaEspecial, Vida, Nivel, Nome, Descricao) VALUES 
(1, 30, 20, 200, 1, 'Armadura Infernal', 'Armadura resistente ao calor para Scorpion.'),
(2, 25, 25, 180, 1, 'Armadura de Gelo', 'Protege Sub-Zero contra ataques físicos e elementais.'),
(3, 35, 15, 220, 1, 'Roupão de Raio', 'Armadura leve mas eficaz de Raiden.'),
(4, 28, 22, 200, 1, 'Túnica do Dragão', 'Roupão resistente de Liu Kang.'),
(5, 32, 18, 190, 1, 'Veste do Monge', 'Protege Kung Lao em batalha.'),
(6, 34, 16, 210, 1, 'Colete de Combate', 'Colete de Sonya Blade.'),
(7, 29, 21, 195, 1, 'Colete de Couro', 'Colete de Johnny Cage.'),
(8, 33, 17, 205, 1, 'Veste de Guerra', 'Veste de Kitana.'),
(9, 27, 23, 185, 1, 'Armadura de Jade', 'Armadura de Jade.'),
(10, 31, 19, 195, 1, 'Armadura de Combate', 'Armadura de Mileena.');

-- Populando a tabela Amuleto
INSERT INTO Amuleto (idAmuleto, Defesa, AtaqueFisico, AtaqueEspecial, Vida, Nivel, Nome, Descricao) VALUES 
(1, 10, 20, 15, 100, 1, 'Amuleto do Fogo', 'Aumenta o poder de fogo de Scorpion.'),
(2, 15, 15, 20, 90, 1, 'Amuleto de Gelo', 'Amplia os poderes de gelo de Sub-Zero.'),
(3, 12, 18, 12, 110, 1, 'Amuleto de Raio', 'Potencializa ataques elétricos de Raiden.'),
(4, 14, 14, 18, 100, 1, 'Amuleto do Dragão', 'Fortalece os golpes de Liu Kang.'),
(5, 13, 17, 15, 105, 1, 'Amuleto do Monge', 'Amuleto protetor de Kung Lao.'),
(6, 11, 19, 11, 115, 1, 'Amuleto de Combate', 'Amuleto de combate de Sonya Blade.'),
(7, 16, 14, 16, 95, 1, 'Amuleto de Ouro', 'Amuleto de Johnny Cage.'),
(8, 18, 12, 18, 105, 1, 'Amuleto de Guerra', 'Amuleto de Kitana.'),
(9, 17, 13, 17, 110, 1, 'Amuleto de Jade', 'Amuleto de Jade.'),
(10, 19, 11, 19, 100, 1, 'Amuleto de Combate', 'Amuleto de combate de Mileena.');

-- Populando a tabela Consumivel
INSERT INTO Consumivel (idConsumivel, Efeito, Nivel, Nome, Descricao) VALUES 
(1, 'Recupera 50% da vida', 1, 'Poção de Vida', 'Recupera a metade da vida total do jogador.'),
(2, 'Aumenta ataque em 20% por 5 minutos', 1, 'Poção de Força', 'Melhora temporariamente o ataque do jogador.'),
(3, 'Recupera 100% da vida', 2, 'Elixir Supremo', 'Recupera completamente a vida do jogador.'),
(4, 'Aumenta defesa em 20% por 5 minutos', 1, 'Elixir de Defesa', 'Fortalece temporariamente a defesa do jogador.'),
(5, 'Recupera 50% de energia', 1, 'Poção de Energia', 'Recupera metade da energia do jogador.'),
(6, 'Aumenta ataque e defesa em 10% por 5 minutos', 1, 'Poção de Poder', 'Melhora temporariamente o ataque e a defesa do jogador.');

-- Populando a tabela InstanciaItem com itens do jogador
INSERT INTO InstanciaItem (idInstanciaItem, idArma, idArmadura, idAmuleto, idConsumivel) VALUES 
(1, 1, 1, 1, 1), -- Instância inicial para o Jogador
(2, 2, 2, 2, 2), -- Outra instância para o Jogador
(3, 3, 3, 3, 3); -- Mais uma instância para o Jogador

-- Populando a tabela Inventario
INSERT INTO Inventario (idInventario) VALUES 
(1); -- Inventário do Jogador

-- Populando a tabela InventarioItem para associar itens ao inventário do Jogador
INSERT INTO InventarioItem (idInventario, idInstanciaItem) VALUES 
(1, 1),
(1, 2),
(1, 3);

-- Populando as tabelas SalaCombate e SalaEvento para os 25 andares da torre
DECLARE @andar INT = 1;
DECLARE @salaCombate INT = 1;
DECLARE @salaEvento INT = 1;

WHILE @andar <= 25
BEGIN
    -- Inserindo Salas de Combate
    INSERT INTO SalaCombate (idSalaCombate, Andar, Numero, Nome) VALUES 
    (@salaCombate, @andar, 1, CONCAT('Sala de Combate A', @andar)),
    (@salaCombate + 1, @andar, 2, CONCAT('Sala de Combate B', @andar)),
    (@salaCombate + 2, @andar, 3, CONCAT('Sala de Combate C', @andar)),
    (@salaCombate + 3, @andar, 4, CONCAT('Sala de Combate D', @andar));
    
    -- Inserindo Sala de Evento
    INSERT INTO SalaEvento (idSalaEvento, Andar, Numero, Nome, Descricao) VALUES 
    (@salaEvento, @andar, 5, CONCAT('Sala de Evento ', @andar), CONCAT('Evento especial no andar ', @andar, '.'));

    -- Incrementando IDs para o próximo andar
    SET @salaCombate = @salaCombate + 4;
    SET @salaEvento = @salaEvento + 1;
    SET @andar = @andar + 1;
END;
