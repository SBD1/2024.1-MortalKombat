# Dicionário de Dados - Mortal Kombat

O dicionário de dados é uma ferramenta utilizada para descrever os dados de um sistema, mostrando os atributos das entidades e seus tipos. O dicionário de dados é uma representação textual que facilita a compreensão da estrutura de um banco de dados.

O dicionário de dados fornecido uma visão detalhada dos atributos das entidades, mostrando os tipos de dados e as restrições aplicadas a eles. O dicionário de dados é uma ferramenta importante para o desenvolvimento de sistemas de banco de dados, pois ajuda a identificar os atributos necessários para o sistema.

<div style="margin: 0 auto; width: fit-content;">

| Tabelas                                              |
|:-----------------------------------------------------|
| [Item](#tabela-item)                                 |
| [Instancia_Item](#tabela-instancia_item)             |
| [Arma](#tabela-arma)           |
| [Armadura](#tabela-armadura)   |
| [Amuleto](#tabela-amuleto)                     |
| [Consumível](#tabela-consumível)                                 |
| [Jogador](#tabela-jogador)                             |
| [Lutador](#tabela-lutador)                   |
| [Lutador_chefe](#tabela-lutadorchefe)                             |
| [Inventario](#tabela-inventario)                     |
| [Possui_inventario](#tabela-possui_inventario)         |
| [Skills](#tabela-skills)                     |
| [Passiva](#tabela-passiva)        |
| [Jogador_Passiva](#tabela-jogador_passiva)                             |
| [Skill_Passiva](#tabela-skill_passiva)                               |

</div>

---

# Tabela Item

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela usada para caracterizar um Item, criada a partir do mapeamento de uma abstração e generalizaçao total e exclusiva de Item.                               |
| **Observações** | Tipo possui os valores `A` para [Arma](#tabela-arma),  `B` para [Armadura](#tabela-armadura), `C` para [Amuleto](#tabela-amuleto) ou `D` para [Consumível](#tabela-consumível) | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que define o número de identificação do item | SERIAL                               | -       | PRIMARY KEY           |
| tipo | Atributo que define o tipo do item                          | CHAR(1)('A', 'B', 'C', 'D') | -       | NOT NULL              |

---

---

# Tabela Instancia_item

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Instancia_item é uma entidade fraca de Item, usada para gerar múltiplas instâncias de um mesmo item.    |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idInstanciaItem   | Chave primária que define o número de identificação da instância | SERIAL                               | -       | PRIMARY KEY           |
| idItem | Chave estrangeira referenciando a tabela [Item](#tabela-item)                          | SERIAL | -       | FOREIGN KEY              |

---

---

# Tabela Arma

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Especialização de item que engloba armas que fornecem bonus de ataque ao jogador   |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que define o número de identificação da arma | SERIAL                               | -       | PRIMARY KEY           |
| idItem | Chave estrangeira referenciando a tabela [Item](#tabela-item)                          | SERIAL | -       | FOREIGN KEY              |
| atkFisico | Atributo que define a quantidade de ataque físico que a arma fornece ao jogador                          | INTEGER | -       | NOT NULL              |
| atkEspecial | Atributo que define a quantidade de ataque especial que a arma fornece ao jogador                          | INTEGER | -       | NOT NULL              |

---

---

# Tabela Armadura

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Especialização de item que engloba aramduras que fornecem bonus de defesa e vida ao jogador    |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que define o número de identificação da armadura | SERIAL                               | -       | PRIMARY KEY           |
| idItem | Chave estrangeira referenciando a tabela [Item](#tabela-item)                          | SERIAL | -       | FOREIGN KEY              |
| defesaFísica | Atributo que define a quantidade de defesa físico que a armadura fornece ao jogador    | INTEGER | -       | NOT NULL              |
| defesaEspecial | Atributo que define a quantidade de defesa especial que a armadura fornece ao jogador  | INTEGER | -       | NOT NULL              |
| vida | Atributo que define a quantidade de vida que a armadura fornece ao jogador                          | INTEGER | -       | NOT NULL              |

---

---

# Tabela Amuleto

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Especialização de item que engloba amuletos que fornecem bonus de todos os tipos ao jogador    |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que define o número de identificação do amuleto | SERIAL | -       | PRIMARY KEY           |
| idItem | Chave estrangeira referenciando a tabela [Item](#tabela-item)  | SERIAL | -       | FOREIGN KEY              |
| atkFisico | Atributo que define a quantidade de ataque físico que o amuleto fornece ao jogador  | INTEGER | -       | NOT NULL     |
| atkEspecial | Atributo que define a quantidade de ataque especial que o amuleto fornece ao jogador | INTEGER | -       | NOT NULL   |
| defesaFísica | Atributo que define a quantidade de defesa físico que o amuleto fornece ao jogador  | INTEGER | -       | NOT NULL  |
| defesaEspecial | Atributo que define a quantidade de defesa especial que o amuleto fornece ao jogador  | INTEGER | -       | NOT NULL  |
| vida | Atributo que define a quantidade de vida que o amuleto fornece ao jogador                      | INTEGER | -       | NOT NULL   |

---

---

# Tabela Consumível

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Especialização de item que engloba consumíveis que o jogador pode utilizar com efeitos diversos  |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que define o número de identificação do consumível | SERIAL                               | -       | PRIMARY KEY           |
| idItem | Chave estrangeira referenciando a tabela [Item](#tabela-item)                          | SERIAL | -       | FOREIGN KEY              |
| efeito | Atributo que da uma descrição do que o consumível faz                          | VARCHAR | 200       | NOT NULL              |

---

---

# Tabela Jogador

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   |  Tabela que guarda todas as informações de Jogador                              |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que define o número de identificação do jogador | SERIAL | - | PRIMARY KEY |
| nome | Atributo que define o nome do jogador | VARCHAR | 75 | NOT NULL, UNIQUE |
| nivel | Atributo que marca o nível do jogador | INTEGER | - | NOT NULL |
| vida | Atributo que marca a vida do jogador | INTEGER | - | NOT NULL |
| defesa | Atributo que marca a defesa do jogador | INTEGER | - | NOT NULL |
| chanceCritica | Atributo que marca a chance do jogador causar dano crítico | INTEGER | - | NOT NULL |
| ataqueFisico | Atributo que marca o ataque físico do jogador | INTEGER | - | NOT NULL |
| ataqueEspecial | Atributo que marca o ataque especial do jogador | INTEGER | - | NOT NULL |
| arma | Atributo que marca a arma equipada do jogador | INTEGER | - | NOT NULL |
| armadura | Atributo que marca a armadura equipada do jogador | INTEGER | - | NOT NULL |
| artefato | Atributo que marca o artefato equipado do jogador | INTEGER | - | NOT NULL |
| classe | Atributo que marca qual a classe que o jogador escolheu na criação de personagem | INTEGER | - | NOT NULL |

---

---

# Tabela Lutador

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   |  Tabela que guarda as informações dos lutadores inimigos                              |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que define o número de identificação do lutador | SERIAL | - | PRIMARY KEY |
| nome | Atributo que define o nome do lutador | VARCHAR | 75 | NOT NULL, UNIQUE |
| nivel | Atributo que marca o nível do lutador | INTEGER | - | NOT NULL |
| vida | Atributo que marca a vida do lutador | INTEGER | - | NOT NULL |
| defesa | Atributo que marca a defesa do lutador | INTEGER | - | NOT NULL |
| chanceCritica | Atributo que marca a chance do lutador causar dano crítico | INTEGER | - | NOT NULL |
| ataqueFisico | Atributo que marca o ataque físico do lutador | INTEGER | - | NOT NULL |
| ataqueEspecial | Atributo que marca o ataque especial do lutador | INTEGER | - | NOT NULL |

---

---

# Tabela LutadorChefe

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   |  Tabela que laça os inimigos chefes que possuem drops especiais de item                              |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idLutador   | Chave estrangeira que referencia o número de identificação do lutador na tabela [Lutador](#tabela-lutador) | SERIAL | - | FOREIGN KEY |
| idInstanciaItem | Chave estrangeira que referencia o número de identificação de instância de item na tabela [Instancia_item](#tabela-instancia_item) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Instancia_lutador

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   |  Instancia_lutador é uma entidade fraca de Lutador, usada para gerar múltiplas instâncias de um mesmo lutador.                              |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idInstanciaLutador   | Chave primária que define o número de identificação da instância de lutador | SERIAL | - | PRIMARY KEY |
| idLutador | Chave estrangeira que referencia o número de identificação de lutador na tabela [Lutador](#tabela-lutador) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Inventario

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela de inventário do jogador                               |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idInventario   | Chave primária que que define o número de identificação do iventário | SERIAL | - | PRIMARY KEY |
| idJogador | Chave estrangeira que referencia o número de identificação de jogador na tabela [Jogador](#tabela-jogador) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Possui_Inventario

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela que laça qual instância de item está em no inventário de qual jogador                               |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idInstanciaItem   | Chave estrangeira que referencia o número de identificação de instância de item na tabela [Instancia_item](#tabela-instancia_item) | SERIAL | - | FOREIGN KEY |
| idInventario | Chave estrangeira que referencia o número de identificação de inventário na tabela [Inventario](#tabela-inventario) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Skills

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   |  Tabela que lista as skills disponíveis no jogo                              |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que que define o número de identificação da skill | SERIAL | - | PRIMARY KEY |
| nome | Atributo que define o nome da skill | VARCHAR | 30 | NOT NULL, UNIQUE |
| descrição   | Atributo que da uma breve descrição de como a skill funciona | VARCHAR | 150 | NOT NULL |

---

---

# Tabela Passiva

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   |  Tabela que lista as passivas disponíveis no jogo                             |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| id   | Chave primária que define o número de identificação da passiva | SERIAL | - | PRIMARY KEY |
| nome | Atributo que define o nome da passiva | VARCHAR | 30 | NOT NULL, UNIQUE |
| descrição   | Atributo que da uma breve descrição de como a passiva funciona | VARCHAR | 150 | NOT NULL |

---

---

# Tabela Jogador_Passiva

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela para marcar quais passivas o jogador possui                               |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idSkill   | Chave estrangeira que referencia o número de identificação de skill na tabela [Skills](#tabela-skills) | SERIAL | - | FOREIGN KEY |
| idJogador | Chave estrangeira que referencia o número de identificação de jogador na tabela [Jogador](#tabela-jogador) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Skill_Passiva

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Algumas skills possuem passivas extras, essa tabela marca qual skill está ligada a qual passiva                               |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idSkill   | Chave estrangeira que referencia o número de identificação de skill na tabela [Skills](#tabela-skills) | SERIAL | - | FOREIGN KEY |
| idPassiva | Chave estrangeira que referencia o número de identificação de passiva na tabela [Passiva](#tabela-passiva) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Sala

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela que armazena as salas existentes no mapa                               |
| **Observações** | Tipo possui os valores `combate` para [Combate](#tabela-combate) e `evento` para [Evento](#tabela-evento) | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idSala   | Chave primária que define o número de identificação da sala | SERIAL | - | PRIMARY KEY |
| andar | Atributo que define qual andar da torre a sala está ligada | INTEGER | - | NOT NULL |
| tipo | Atributo que define o tipo da sala | ENUM('combate', 'evento') | - | NOT NULL |
| nome | Atributo que define o nome dado à sala | VARCHAR | 30 | NOT NULL, UNIQUE |

---

---

# Tabela Se_liga

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela que laça qual sala se liga a outra                               |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idSalaO   | Chave estrangeira que referencia o número de identificação da sala de origem na tabela [Sala](#tabela-sala) | SERIAL | - | FOREIGN KEY |
| idSalaD   | Chave estrangeira que referencia o número de identificação da sala de destino na tabela [Sala](#tabela-sala) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Combate

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Especialização de Sala para salas voltadas para combate                               |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idSala   | Chave estrangeira que referencia o número de identificação de sala na tabela [Sala](#tabela-sala) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Evento

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Especialização de Sala para salas com eventos                               |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idSala   | Chave estrangeira que referencia o número de identificação de sala na tabela [Sala](#tabela-sala) | SERIAL | - | FOREIGN KEY |
| descrição   | Descrição breve de como o evento da sala funciona | VARCHAR | 150 | NOT NULL |

---

---

# Tabela Tem_jogador

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela que laça em qual sala qual jogador está                               |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idSala   | Chave estrangeira que referencia o número de identificação de sala na tabela [Sala](#tabela-sala) | SERIAL | - | FOREIGN KEY |
| idJogador   | Chave estrangeira que referencia o número de identificação de jogador na tabela [Jogador](#tabela-jogador) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Tem_lutador

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela que laça em qual sala qual instância de lutador está |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idInstanciaLutador   | Chave estrangeira que referencia o número de identificação de sala na tabela [Instancia_lutador](#tabela-instancia_lutador) | SERIAL | - | FOREIGN KEY |
| idSala | Chave estrangeira que referencia o número de identificação de sala na tabela [Sala](#tabela-sala) | SERIAL | - | FOREIGN KEY |

---

---

# Tabela Possui_lutador

|                 |                                                                                                                                                                 |   
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Descrição**   | Tabela para marcar as passivas que cada lutador possui |
| **Observações** |  | 

| Nome | Definição Lógica                                            | Tipo e Formato de Dado               | Tamanho | Restrições de Domínio |
|:-----|:------------------------------------------------------------|:-------------------------------------|---------|:----------------------|
| idPassiva   | Chave estrangeira que referencia o número de identificação de passiva na tabela [Passiva](#tabela-passiva) | SERIAL | - | FOREIGN KEY |
| idLutador | Chave estrangeira que referencia o número de identificação de lutador na tabela [Lutador](#tabela-lutador) | SERIAL | - | FOREIGN KEY |

---

### Histórico de Versão

| Data       | Versão | Descrição                      | Autor(es)                                      |
| ---------- | ------ | ------------------------------ | ---------------------------------------------- |
| 29/08/2024 | 1.0    | Criação do Dicionário de Dados | Lude Ribeiro, Vinicius Alves, Guilherme Vilela |
| 08/09/2024 | 1.1    | Atualização Dicionário de Dados |  Guilherme Vilela |
| 09/09/2024 | 1.2    | Algumas novas tabelas e correções |  Guilherme Vilela |
