-- Criação da tabela SalaCombate
CREATE TABLE SalaCombate (
    idSalaCombate INT PRIMARY KEY,
    Andar INT NOT NULL,
    Numero INT NOT NULL,
    Nome VARCHAR(100) NOT NULL
);

-- Criação da tabela SalaEvento
CREATE TABLE SalaEvento (
    idSalaEvento INT PRIMARY KEY,
    Andar INT NOT NULL,
    Numero INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL
);

-- Criação da tabela Combate com FK para SalaCombate
CREATE TABLE Combate (
    idCombate INT PRIMARY KEY,
    idSalaCombate INT NOT NULL,
    FOREIGN KEY (idSalaCombate) REFERENCES SalaCombate(idSalaCombate) ON DELETE RESTRICT
);

-- Criação da tabela Lutador
CREATE TABLE Lutador (
    idLutador INT PRIMARY KEY,
    Nivel INT NOT NULL,
    Defesa INT NOT NULL,
    Vida INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    CHECK (Nivel >= 1 AND Defesa >= 0 AND Vida >= 0) -- Constraints para validar atributos
);

-- Criação da tabela LutadorChefe, referenciando Lutador
CREATE TABLE LutadorChefe (
    idLutadorChefe INT PRIMARY KEY,
    idLutador INT NOT NULL,
    MelhoriaAtaque INT NOT NULL,
    MelhoriaDefesa INT NOT NULL,
    FOREIGN KEY (idLutador) REFERENCES Lutador(idLutador) ON DELETE RESTRICT,
    CHECK (MelhoriaAtaque >= 0 AND MelhoriaDefesa >= 0)
);

-- Criação das tabelas de especialização de Item com Nome e Descrição
CREATE TABLE Arma (
    idArma INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL,
    AtkFisico INT NOT NULL,
    AtkEspecial INT NOT NULL,
    Nivel INT NOT NULL,
    Habilidade VARCHAR(100),
    CHECK (AtkFisico >= 0 AND AtkEspecial >= 0 AND Nivel >= 1)
);

CREATE TABLE Armadura (
    idArmadura INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL,
    DefesaFisica INT NOT NULL,
    DefesaEspecial INT NOT NULL,
    Vida INT NOT NULL,
    Nivel INT NOT NULL,
    CHECK (DefesaFisica >= 0 AND DefesaEspecial >= 0 AND Vida >= 0 AND Nivel >= 1)
);

CREATE TABLE Amuleto (
    idAmuleto INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL,
    Defesa INT NOT NULL,
    AtaqueFisico INT NOT NULL,
    AtaqueEspecial INT NOT NULL,
    Vida INT NOT NULL,
    Nivel INT NOT NULL,
    CHECK (Defesa >= 0 AND AtaqueFisico >= 0 AND AtaqueEspecial >= 0 E Vida >= 0 E Nivel >= 1)
);

CREATE TABLE Consumivel (
    idConsumivel INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL,
    Efeito VARCHAR(100) NOT NULL,
    Nivel INT NOT NULL,
    CHECK (Nivel >= 1)
);

-- Criação da tabela InstanciaItem com FKs para as especializações de Item
CREATE TABLE InstanciaItem (
    idInstanciaItem INT PRIMARY KEY,
    idArma INT,
    idArmadura INT,
    idAmuleto INT,
    idConsumivel INT,
    CHECK (
        (idArma IS NOT NULL AND idArmadura IS NULL AND idAmuleto IS NULL AND idConsumivel IS NULL) OR
        (idArma IS NULL AND idArmadura IS NOT NULL AND idAmuleto IS NULL AND idConsumivel IS NULL) OR
        (idArma IS NULL AND idArmadura IS NULL AND idAmuleto IS NOT NULL AND idConsumivel IS NULL) OR
        (idArma IS NULL AND idArmadura IS NULL AND idAmuleto IS NULL AND idConsumivel IS NOT NULL)
    ),
    FOREIGN KEY (idArma) REFERENCES Arma(idArma) ON DELETE RESTRICT,
    FOREIGN KEY (idArmadura) REFERENCES Armadura(idArmadura) ON DELETE RESTRICT,
    FOREIGN KEY (idAmuleto) REFERENCES Amuleto(idAmuleto) ON DELETE RESTRICT,
    FOREIGN KEY (idConsumivel) REFERENCES Consumivel(idConsumivel) ON DELETE RESTRICT
);

-- Criação da tabela Inventario
CREATE TABLE Inventario (
    idInventario INT PRIMARY KEY
);

-- Criação da tabela InventarioItem com chaves compostas
CREATE TABLE InventarioItem (
    idInventario INT,
    idInstanciaItem INT,
    PRIMARY KEY (idInventario, idInstanciaItem),
    FOREIGN KEY (idInventario) REFERENCES Inventario(idInventario) ON DELETE RESTRICT,
    FOREIGN KEY (idInstanciaItem) REFERENCES InstanciaItem(idInstanciaItem) ON DELETE RESTRICT
);
