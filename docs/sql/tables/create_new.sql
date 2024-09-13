-- Criação da tabela Jogador
CREATE TABLE Jogador (
    idJogador SERIAL PRIMARY KEY,
    nivel INT NOT NULL,
    defesa INT NOT NULL,
    vida INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
	chanceCritica FLOAT NOT NULL,
	ataqueEspecial INT NOT NULL,
	ataqueFisico INT NOT NULL,
	arma INT NOT NULL, -- Verificar para que funciona Arma, Armadura y Artefacto
	armadura INT NOT NULL,
	artefacto INT NOT NULL,
	classe CHAR(1) NOT NULL, -- Verificar para que es classe
    CONSTRAINT jogador_val_chk CHECK (nivel >= 1 AND defesa >= 0 AND vida >= 0 AND chanceCritica >= 0 AND ataqueEspecial >= 0 AND ataqueFisico >= 0),	-- Constraints para validar atributos
    CONSTRAINT jogador_classe_chk CHECK (classe = 'A' OR classe = 'B' OR classe = 'C'), -- Verificar valores depois
	CONSTRAINT jogador_equipo_chk CHECK ((arma = 1 OR arma = 0) AND (armadura = 1 OR armadura = 0) AND (artefacto = 1 OR artefacto = 0))
);

-- Criação da tabela Sala
CREATE TABLE Sala (
    idSala SERIAL PRIMARY KEY,
	tipo CHAR(1) NOT NULL,
    andar INT NOT NULL,
    numero INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
	CONSTRAINT sala_tipo_chk CHECK (Tipo = 'C' OR Tipo = 'E')
);

-- Criação da tabela SalaCombate com FK para Sala
CREATE TABLE SalaCombate (
    idSala INT PRIMARY KEY,
	CONSTRAINT salaC_FK FOREIGN KEY (idSala) REFERENCES Sala(idSala) ON DELETE RESTRICT	 
);

-- Criação da tabela SalaEvento com FK para Sala
CREATE TABLE SalaEvento (
    idSala INT PRIMARY KEY,
    descricao TEXT NOT NULL,
	CONSTRAINT sacaE_FK FOREIGN KEY (idSala) REFERENCES Sala(idSala) ON DELETE RESTRICT
);

-- Criação da tabela Lutador
CREATE TABLE Lutador (
    idLutador SERIAL PRIMARY KEY,
    Nivel INT NOT NULL,
    Defesa INT NOT NULL,
    Vida INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
	Chance_critica FLOAT NOT NULL,
	Ataque_especial INT NOT NULL,
	Ataque_fisico INT NOT NULL,
    CONSTRAINT lutador_val_chk CHECK (Nivel >= 1 AND Defesa >= 0 AND Vida >= 0 AND Chance_critica >= 0 AND Ataque_especial >= 0 AND Ataque_fisico >= 0) -- Constraints para validar atributos
);

-- Criação da tabela Instancia_lutador, referenciando Lutador
CREATE TABLE Instancia_lutador (
    idInstancialutador SERIAL PRIMARY KEY,
    idLutador INT NOT NULL,
    CONSTRAINT instancia_lutador_lutador FOREIGN KEY (idLutador) REFERENCES Lutador(idLutador) ON DELETE RESTRICT
);

-- Criação da tabelas Item
CREATE TABLE Item (
    idItem SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo CHAR(1) NOT NULL,
    nivel INT NOT NULL,
    habilidade VARCHAR(100),
    CONSTRAINT item_val_chk CHECK (Nivel >= 1),
    CONSTRAINT item_tipo_chk CHECK (tipo = 'A' OR tipo = 'B' OR tipo = 'C' OR tipo = 'D')
);

-- Criação das tabelas de especialização de Item com Nome e Descrição
CREATE TABLE Arma (
    idItem INT NOT NULL,
    atkFisico INT NOT NULL,
    atkEspecial INT NOT NULL,
	CONSTRAINT arma_id FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE RESTRICT,
    CONSTRAINT arma_val_chk CHECK (AtkFisico >= 0 AND AtkEspecial >= 0)
);

CREATE TABLE Armadura (
    idItem INT PRIMARY KEY,
    defesaFisica INT NOT NULL,
    defesaEspecial INT NOT NULL,
    vida INT NOT NULL,
	CONSTRAINT armadura_id FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE RESTRICT,
    CONSTRAINT armadura_val_chk CHECK (defesaFisica >= 0 AND defesaEspecial >= 0 AND vida >= 0)
);

CREATE TABLE Amuleto (
    idItem INT PRIMARY KEY,
    ataqueFisico INT NOT NULL,
    ataqueEspecial INT NOT NULL,
	defesaFisica INT NOT NULL,
	defesaEspecial INT NOT NULL,
    vida INT NOT NULL,
	CONSTRAINT amuleto_id FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE RESTRICT,
    CONSTRAINT amuleto_val_chk CHECK (defesaFisica >= 0 AND defesaEspecial >= 0 AND ataqueFisico >= 0 AND ataqueEspecial >= 0 AND vida >= 0)
);

CREATE TABLE Consumivel (
    idItem INT PRIMARY KEY,
    efeito CHAR(1) NOT NULL,
	CONSTRAINT consumivel_id FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE RESTRICT,
	CONSTRAINT consumivel_efeito_chk CHECK (efeito = 'A' AND efeito = 'B' AND efeito = 'C') -- trocar uma veis definidos os efeitos
);

-- Criação da tabela InstanciaItem com FKs Item
CREATE TABLE InstanciaItem (
    idInstanciaItem SERIAL PRIMARY KEY,
    idItem INT NOT NULL,
    CONSTRAINT instanciaitem_id FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE RESTRICT
);

-- Criação da tabela Inventario com FK jogador
CREATE TABLE Inventario (
    idInventario SERIAL PRIMARY KEY,
	idJogador INT NOT NULL,
	CONSTRAINT inventario_id_jogador FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador) ON DELETE RESTRICT
);

-- Criação da tabela Skills
CREATE TABLE Skills (
    idSkills INT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL
);

-- Criação da tabela Passiva
CREATE TABLE Passiva (
    idPassiva INT PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL
);

-- Criação da tabela se_liga com FK pra Sala
CREATE TABLE se_liga (
    idSalaO INT NOT NULL,
	idSalaD INT NOT NULL,
	CONSTRAINT se_liga_FK_O FOREIGN KEY (idSalaO) REFERENCES Sala(idSala) ON DELETE RESTRICT,
	CONSTRAINT se_liga_FK_D FOREIGN KEY (idSalaD) REFERENCES Sala(idSala) ON DELETE RESTRICT
);

-- Criação da tabela Tem_lutador com FK para Lutador e Sala
CREATE TABLE Tem_lutador (
    idSala INT NOT NULL,
    idInstancialutador INT NOT NULL,
    CONSTRAINT tem_lutador_id FOREIGN KEY (idInstancialutador) REFERENCES Instancia_lutador(idInstancialutador) ON DELETE RESTRICT,
	CONSTRAINT tem_lutador_sala FOREIGN KEY (idSala) REFERENCES SalaCombate(idSala) ON DELETE RESTRICT
);

-- Criação da tabela Tem_Jogador com FK para Jogador e Sala
CREATE TABLE Tem_Jogador (
    idSala INT NOT NULL,
    idJogador INT NOT NULL,
    CONSTRAINT tem_jogador_id FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador) ON DELETE RESTRICT,
	CONSTRAINT tem_jogador_sala FOREIGN KEY (idSala) REFERENCES Sala(idSala) ON DELETE RESTRICT
);

-- Criação da tabela LutadorChefe, referenciando Lutador e InstanciaItem
CREATE TABLE LutadorChefe (
    idLutador INT NOT NULL,
	idInstanciaitem INT NOT NULL,
    CONSTRAINT lutador_chefe_id FOREIGN KEY (idLutador) REFERENCES Lutador(idLutador) ON DELETE RESTRICT,
	CONSTRAINT lutador_chefe_item FOREIGN KEY (idInstanciaitem) REFERENCES InstanciaItem(idInstanciaItem) ON DELETE RESTRICT
);

-- Criação da tabela Jogador_equipa, referenciando Jogador e InstanciaItem
CREATE TABLE Jogador_equipa (
    idJogador INT NOT NULL,
	idInstanciaitem INT NOT NULL,
	CONSTRAINT jogador_equipa_item FOREIGN KEY (idInstanciaitem) REFERENCES InstanciaItem(idInstanciaItem) ON DELETE RESTRICT
);

-- Criação da tabela Possue_inventario com FK instancia item
CREATE TABLE Possue_inventario (
    idInventario INT NOT NULL,
	idInstanciaItem INT NOT NULL,
	CONSTRAINT possue_inv_item FOREIGN KEY (idInstanciaItem) REFERENCES InstanciaItem(idInstanciaItem) ON DELETE RESTRICT
);

-- Criação da tabela Jogador_possue com FKs Skill e Jogador
CREATE TABLE Jogador_possue (
    idJogador INT NOT NULL,
	idSkills INT NOT NULL,
	CONSTRAINT jogador_possue_skills FOREIGN KEY (idSkills) REFERENCES Skills(idSkills) ON DELETE RESTRICT,
	CONSTRAINT jogador_possue_jogador FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador) ON DELETE RESTRICT
);

-- Criação da tabela Possui_passiva com FKs Passiva e Skill
CREATE TABLE Possui_passiva (
	idSkills INT NOT NULL,
	idPassiva INT NOT NULL,
	CONSTRAINT possui_passiva_passiva FOREIGN KEY (idPassiva) REFERENCES Passiva(idPassiva) ON DELETE RESTRICT,
	CONSTRAINT possui_passiva_skill FOREIGN KEY (idSkills) REFERENCES Skills(idSkills) ON DELETE RESTRICT
);

-- Criação da tabela Possui_lutador com FKs Passiva e Lutador
CREATE TABLE Possui_lutador (
    idLutador INT NOT NULL,
	idPassiva INT NOT NULL,
	CONSTRAINT possui_lutador_passiva FOREIGN KEY (idPassiva) REFERENCES Passiva(idPassiva) ON DELETE RESTRICT,
	CONSTRAINT possui_lutador_id FOREIGN KEY (idLutador) REFERENCES Lutador(idLutador) ON DELETE RESTRICT
);