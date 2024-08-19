# Scripts de Criação das Tabelas

A seguir, temos os scripts de criação das tabelas do banco de dados do projeto Mortal Kombat.

Os scripts a seguir podem ser encontrados no repositório do projeto, no caminho `docs/sql/tables/create.sql`.

## Criação das Tabelas

### Tabela de Sala de Combate

A tabela `SalaCombate` armazena informações sobre as salas de combate disponíveis no jogo.
São armazenados o `idSalaCombate`, `Andar`, `Numero` e `Nome` da sala.

    Script SQL de criação da tabela SalaCombate

```sql
CREATE TABLE SalaCombate (
    idSalaCombate INT PRIMARY KEY,
    Andar INT NOT NULL,
    Numero INT NOT NULL,
    Nome VARCHAR(100) NOT NULL
);
```

### Tabela de Sala de Evento

A tabela `SalaEvento` armazena informações sobre as salas de evento disponíveis no jogo.
São armazenados o `idSalaEvento`, `Andar`, `Numero`, `Nome` e `Descricao` da sala.

    Script SQL de criação da tabela SalaEvento

```sql
CREATE TABLE SalaEvento (
    idSalaEvento INT PRIMARY KEY,
    Andar INT NOT NULL,
    Numero INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL
);
```

### Tabela de Combate

A tabela `Combate` armazena informações sobre os combates que ocorrem nas salas de combate.
São armazenados o `idCombate` e o `idSalaCombate` onde o combate ocorre.

    Script SQL de criação da tabela Combate

```sql
CREATE TABLE Combate (
    idCombate INT PRIMARY KEY,
    idSalaCombate INT NOT NULL,
    FOREIGN KEY (idSalaCombate) REFERENCES SalaCombate(idSalaCombate) ON DELETE RESTRICT
);
```

### Tabela de Lutador

A tabela `Lutador` armazena informações sobre os lutadores do jogo.
São armazenados o `idLutador`, `Nivel`, `Defesa`, `Vida` e `Nome` do lutador.

    Script SQL de criação da tabela Lutador

```sql
CREATE TABLE Lutador (
    idLutador INT PRIMARY KEY,
    Nivel INT NOT NULL,
    Defesa INT NOT NULL,
    Vida INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    CHECK (Nivel >= 1 AND Defesa >= 0 AND Vida >= 0) -- Constraints para validar atributos
);
```

### Tabela de LutadorChefe

A tabela `LutadorChefe` armazena informações sobre os lutadores chefes do jogo.
São armazenados o `idLutadorChefe`, `idLutador`, `MelhoriaAtaque` e `MelhoriaDefesa` do lutador chefe.

    Script SQL de criação da tabela LutadorChefe

```sql
CREATE TABLE LutadorChefe (
    idLutadorChefe INT PRIMARY KEY,
    idLutador INT NOT NULL,
    MelhoriaAtaque INT NOT NULL,
    MelhoriaDefesa INT NOT NULL,
    FOREIGN KEY (idLutador) REFERENCES Lutador(idLutador) ON DELETE RESTRICT,
    CHECK (MelhoriaAtaque >= 0 AND MelhoriaDefesa >= 0)
);
```

### Tabela de Arma

A tabela `Arma` armazena informações sobre as armas disponíveis no jogo.
São armazenados o `idArma`, `AtkFisico`, `AtkEspecial`, `Nivel` e `Habilidade` da arma.

    Script SQL de criação da tabela Arma

```sql
CREATE TABLE Arma (
    idArma INT PRIMARY KEY,
    AtkFisico INT NOT NULL,
    AtkEspecial INT NOT NULL,
    Nivel INT NOT NULL,
    Habilidade VARCHAR(100),
    CHECK (AtkFisico >= 0 AND AtkEspecial >= 0 AND Nivel >= 1)
);
```

### Tabela de Armadura

A tabela `Armadura` armazena informações sobre as armaduras disponíveis no jogo.
São armazenados o `idArmadura`, `DefesaFisica`, `DefesaEspecial`, `Vida` e `Nivel` da armadura.

    Script SQL de criação da tabela Armadura

```sql
CREATE TABLE Armadura (
    idArmadura INT PRIMARY KEY,
    DefesaFisica INT NOT NULL,
    DefesaEspecial INT NOT NULL,
    Vida INT NOT NULL,
    Nivel INT NOT NULL,
    CHECK (DefesaFisica >= 0 AND DefesaEspecial >= 0 AND Vida >= 0 AND Nivel >= 1)
);
```

### Tabela de Amuleto

A tabela `Amuleto` armazena informações sobre os amuletos disponíveis no jogo.
São armazenados o `idAmuleto`, `Defesa`, `AtaqueFisico`, `AtaqueEspecial`, `Vida` e `Nivel` do amuleto.

    Script SQL de criação da tabela Amuleto

```sql
CREATE TABLE Amuleto (
    idAmuleto INT PRIMARY KEY,
    Defesa INT NOT NULL,
    AtaqueFisico INT NOT NULL,
    AtaqueEspecial INT NOT NULL,
    Vida INT NOT NULL,
    Nivel INT NOT NULL,
    CHECK (Defesa >= 0 AND AtaqueFisico >= 0 AND AtaqueEspecial >= 0 AND Vida >= 0 AND Nivel >= 1)
);
```

### Tabela de Consumível

A tabela `Consumivel` armazena informações sobre os consumíveis disponíveis no jogo.
São armazenados o `idConsumivel`, `Efeito` e `Nivel` do consumível.

    Script SQL de criação da tabela Consumivel

```sql
CREATE TABLE Consumivel (
    idConsumivel INT PRIMARY KEY,
    Efeito VARCHAR(100) NOT NULL,
    Nivel INT NOT NULL,
    CHECK (Nivel >= 1)
);
```

### Tabela de Instância de Item

A tabela `InstanciaItem` armazena informações sobre as instâncias de itens que os lutadores possuem.
São armazenados o `idInstanciaItem`, `idArma`, `idArmadura`, `idAmuleto` e `idConsumivel` da instância de item.

    Script SQL de criação da tabela InstanciaItem

```sql
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
```

### Tabela de Inventario

A tabela `Inventario` armazena informações sobre os inventários dos lutadores.
São armazenados o `idInventario` do inventário.

    Script SQL de criação da tabela Inventario

```sql
CREATE TABLE Inventario (
    idInventario INT FOREIGN KEY REFERENCES Jogador(idJogador) ON DELETE RESTRICT
);
```

### Tabela de InventarioItem

A tabela `InventarioItem` armazena informações sobre os itens que os lutadores possuem em seus inventários.
São armazenados o `idInventario` e o `idInstanciaItem` do item no inventário.

    Script SQL de criação da tabela InventarioItem

```sql
CREATE TABLE InventarioItem (
    idInventario INT,
    idInstanciaItem INT,
    PRIMARY KEY (idInventario, idInstanciaItem),
    FOREIGN KEY (idInventario) REFERENCES Inventario(idInventario) ON DELETE RESTRICT,
    FOREIGN KEY (idInstanciaItem) REFERENCES InstanciaItem(idInstanciaItem) ON DELETE RESTRICT
);
```

### Histórico de Versão

| Data       | Versão | Descrição     | Autor(es)                      |
| ---------- | ------ | ------------- | ------------------------------ |
| 29/08/2021 | 1.0    | Criação do DR | Lude Ribeiro, Guilherme Vilela |
