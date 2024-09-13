import psycopg2
import os

def clear_terminal():
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')

# Conectar ao banco de dados PostgreSQL
def conectar_bd():
    try:
        conn = psycopg2.connect(
            dbname="postgres",
            user="postgres",
            password="Elcachorro2022",
            host="localhost",
            port="5433"
        )
        return conn
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return None

# Verificar que o jogador existe
def verificar_jogador_existe(conn, idJogador):
    with conn.cursor() as cur:
        cur.execute("SELECT EXISTS(SELECT 1 FROM Jogador WHERE idJogador = %s);", (idJogador,))
        jogador_existe = cur.fetchone()[0]

        if jogador_existe:
            print(f"O jogador com ID {idJogador} existe.")
            return idJogador
        else:
            print(f"O jogador com ID {idJogador} não foi encontrado.")
            return None

# Inserir data de teste
def data_teste(conn):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO InstanciaItem (idItem) VALUES (1);
            """)
        cur.execute("""
            INSERT INTO LutadorChefe (idLutador, idInstanciaitem) 
            VALUES ((SELECT idLutador FROM Lutador WHERE Nome = 'Scorpion'), (SELECT MAX(idInstanciaitem) FROM InstanciaItem));
            """)
        cur.execute("""
            INSERT INTO Instancia_lutador (idLutador) VALUES (1);
            """)
        cur.execute("""
            INSERT INTO Tem_lutador (idSala, idInstancialutador) VALUES (1, (SELECT MAX(idInstancialutador) FROM Instancia_lutador));
            """)

# Cria um novo jogador
def criar_jogador(conn, nome, tipo):
    with conn.cursor() as cur:
        if tipo == 'A':
            cur.execute("""
            INSERT INTO jogador (nivel, defesa, vida, nome, chanceCritica, ataqueEspecial, ataqueFisico, arma, armadura, artefacto, classe) 
            VALUES (1, 20, 100, %s, 0.20, 150, 100, 0, 0, 0, %s) RETURNING idJogador;
            """, (nome, tipo))
        elif tipo == 'B':
            cur.execute("""
            INSERT INTO jogador (nivel, defesa, vida, nome, chanceCritica, ataqueEspecial, ataqueFisico, arma, armadura, artefacto, classe) 
            VALUES (1, 40, 120, %s, 0.10, 80, 70, 0, 0, 0, %s) RETURNING idJogador;
            """, (nome, tipo))
        elif tipo == 'C':
            cur.execute("""
            INSERT INTO jogador (nivel, defesa, vida, nome, chanceCritica, ataqueEspecial, ataqueFisico, arma, armadura, artefacto, classe) 
            VALUES (1, 5, 70, %s, 0.40, 200, 150, 0, 0, 0, %s) RETURNING idJogador;
            """, (nome, tipo))            

        jogador_id = cur.fetchone()[0]
        conn.commit()
        print(f"Jogador {nome} criado com ID {jogador_id}")
        return jogador_id

#Posicionar Jogador novo em sala inicial
def jogador_sala_inicial(conn, idJogador):
    with conn.cursor() as cur:
        cur.execute("INSERT INTO Tem_Jogador (idSala, idJogador) VALUES (1, %s);",(idJogador,))
        conn.commit()

#Criar inventario pra Jogador novo
def jogador_inventario_inicial(conn, idJogador):
    with conn.cursor() as cur:
        cur.execute("INSERT INTO Inventario (idJogador) VALUES (%s);",(idJogador,))
        conn.commit()

# Lista tudas as salas
def listar_salas(conn):
    with conn.cursor() as cur:
        cur.execute("SELECT id, nome FROM sala;")
        salas = cur.fetchall()
        print("Salas disponíveis:")
        for sala in salas:
            print(f"ID: {sala[0]} - Nome: {sala[1]}")
        return salas

# Mostrar sala atual do Jogador
def mostrar_sala_atual(conn, idJogador):
    with conn.cursor() as cur:
        cur.execute("SELECT sala.idSala FROM sala JOIN Tem_Jogador ON sala.idSala = Tem_Jogador.idSala WHERE Tem_Jogador.idJogador = %s;",(idJogador,))
        sala = cur.fetchone()
        return sala[0]


# Lista salas disponiveis
def listar_salas_disponiveis(conn, idSala):
    with conn.cursor() as cur:
        cur.execute("SELECT se_liga.idSalaD, sala.nome FROM sala JOIN se_liga ON sala.idSala = se_liga.idSalaD WHERE idSalaO = %s;",(idSala,))
        salas = cur.fetchall()
        print("Salas disponíveis:")
        for sala in salas:
            print(f"ID: {sala[0]} - Nome: {sala[1]}")
        return salas

# Move o jogador para outra sala
def mover_jogador(conn, jogador_id, nova_sala_id):
    with conn.cursor() as cur:
        cur.execute("UPDATE Tem_jogador SET idSala = %s WHERE idJogador = %s;", (nova_sala_id, jogador_id))
        conn.commit()
        print(f"Jogador movido para a sala {nova_sala_id}")

# Listar lutador na sala
def listar_lutador_sala(conn, idSala):
    with conn.cursor() as cur:
        cur.execute("SELECT l.idLutador, l.Nome FROM Lutador l JOIN Tem_lutador tl ON l.idLutador = tl.idInstancialutador WHERE tl.idSala = %s;", (idSala, ))
        lutadores_sala = cur.fetchall()
        if not lutadores_sala:
            print("Não tem lutadores nesta sala.")
        else:
            print("Lutadores na sala atual:")
            for lutador in lutadores_sala:
                print(f"ID: {lutador[0]} - Nome: {lutador[1]}")
        return lutadores_sala

# Listar objetos de usuario
def listar_objetos_do_jogador(conn, idJogador):
    with conn.cursor() as cur:
        cur.execute("""
            SELECT i.idInstanciaItem, it.nome, it.tipo
            FROM Inventario inv
            JOIN Possue_inventario pi ON inv.idInventario = pi.idInventario
            JOIN InstanciaItem i ON pi.idInstanciaItem = i.idInstanciaItem
            JOIN Item it ON i.idItem = it.idItem
            WHERE inv.idJogador = %s;
        """, (idJogador,))
            
        objetos = cur.fetchall()
            
        if not objetos:
            print("O jogador não possui nenhum objeto.")
        else:
            print("Objetos do jogador:")
            for objeto in objetos:
                id_item, nome, tipo = objeto
                print(f"ID: {id_item} - Nome: {nome} - Tipo: {tipo}")
        return objetos

#Listar objetos equipados pelo jogador
def listar_itens_equipados(conn, idJogador):
    with conn.cursor() as cur:
        cur.execute("""
            SELECT ii.idInstanciaItem, i.nome 
            FROM InstanciaItem ii
            JOIN Item i ON ii.idItem = i.idItem
            JOIN Jogador_equipa je ON je.idInstanciaItem = ii.idInstanciaItem
            WHERE je.idJogador = %s;
        """, (idJogador,))

        itens_equipados = cur.fetchall()

        if not itens_equipados:
            print("Nenhum item está equipado pelo jogador.")
            return itens_equipados

        print("Itens equipados pelo jogador:")
        for item in itens_equipados:
            print(f"ID: {item[0]} - Nome: {item[1]}")

        return itens_equipados

# Funcao mock combate
def combate_lutador(conn, idJogador, idLutador):
    with conn.cursor() as cur:
        cur.execute("""
            SELECT tl.idSala
            FROM Tem_Jogador tj
            JOIN Tem_lutador tl ON tj.idSala = tl.idSala
            WHERE tj.idJogador = %s AND tl.idInstancialutador = %s;
        """, (idJogador, idLutador))
        
        sala = cur.fetchone()
        
        if sala is None:
            print("O jogador e o lutador não estão na mesma sala.")
            return
        
        idSala = sala[0]

        cur.execute("""
            SELECT lc.idInstanciaItem
            FROM LutadorChefe lc
            WHERE lc.idLutador = %s;
        """, (idLutador,))
        
        lutador_chefe = cur.fetchone()
        instancia_item = None
        
        if lutador_chefe:
            instancia_item = lutador_chefe[0]

        cur.execute("""
            DELETE FROM Tem_lutador
            WHERE idInstancialutador = %s;
        """, (idLutador,))
        
        cur.execute("""
            DELETE FROM Instancia_lutador
            WHERE idLutador = %s;
        """, (idLutador,))
        
        if instancia_item:
            cur.execute("""
                INSERT INTO Possue_inventario (idInventario, idInstanciaItem)
                SELECT idInventario, %s
                FROM Inventario
                WHERE idJogador = %s;
            """, (instancia_item, idJogador))
            
            cur.execute("""
                DELETE FROM LutadorChefe
                WHERE idLutador = %s;
            """, (idLutador,))
        
        conn.commit()
        
        print("O lutador foi derrotado.")

def equipar_item(conn, idJogador, idInstanciaItem):
    with conn.cursor() as cur:
        cur.execute("""
            SELECT COUNT(*) 
            FROM Possue_inventario 
            JOIN Inventario ON Inventario.idInventario = Possue_inventario.idInventario
            WHERE Inventario.idJogador = %s AND Possue_inventario.idInstanciaItem = %s;
        """, (idJogador, idInstanciaItem))
        
        item_no_inventario = cur.fetchone()[0]
        
        if item_no_inventario == 0:
            print("Este item não está no inventário do jogador.")
            return

        cur.execute("""
            SELECT i.tipo 
            FROM Item i
            JOIN InstanciaItem ii ON i.idItem = ii.idItem
            WHERE ii.idInstanciaItem = %s;
        """, (idInstanciaItem,))
            
        item = cur.fetchone()
        if item is None:
            print("Item não encontrado.")
            return
            
        tipo_item = item[0]

        cur.execute("""
            SELECT arma, armadura, artefacto 
            FROM Jogador 
            WHERE idJogador = %s;
        """, (idJogador,))
            
        jogador = cur.fetchone()
        if jogador is None:
            print("Jogador não encontrado.")
            return
            
        arma, armadura, artefacto = jogador
            
        if tipo_item == 'A':  # Arma
            if arma == 0:
                cur.execute("""
                    INSERT INTO Jogador_equipa (idJogador, idInstanciaItem)
                    VALUES (%s, %s);
                """, (idJogador, idInstanciaItem))
                cur.execute("UPDATE Jogador SET arma = 1 WHERE idJogador = %s;", (idJogador,))
                print("Arma equipada com sucesso!")
            else:
                cur.execute("""
                    UPDATE Jogador_equipa 
                    SET idInstanciaItem = %s 
                    WHERE idJogador = %s AND idInstanciaItem IN (
                        SELECT idInstanciaItem 
                        FROM InstanciaItem ii
                        JOIN Item i ON ii.idItem = i.idItem
                        WHERE i.tipo = 'A'
                    );
                """, (idInstanciaItem, idJogador))
                print("Arma trocada com sucesso!")

        elif tipo_item == 'B':  # Armadura
            if armadura == 0:
                cur.execute("""
                    INSERT INTO Jogador_equipa (idJogador, idInstanciaItem)
                    VALUES (%s, %s);
                """, (idJogador, idInstanciaItem))
                cur.execute("UPDATE Jogador SET armadura = 1 WHERE idJogador = %s;", (idJogador,))
                print("Armadura equipada com sucesso!")
            else:
                cur.execute("""
                    UPDATE Jogador_equipa 
                    SET idInstanciaItem = %s 
                    WHERE idJogador = %s AND idInstanciaItem IN (
                        SELECT idInstanciaItem 
                        FROM InstanciaItem ii
                        JOIN Item i ON ii.idItem = i.idItem
                        WHERE i.tipo = 'B'
                    );
                """, (idInstanciaItem, idJogador))
                print("Armadura trocada com sucesso!")

        elif tipo_item == 'C':  # Amuleto
            if artefacto == 0:
                cur.execute("""
                    INSERT INTO Jogador_equipa (idJogador, idInstanciaItem)
                    VALUES (%s, %s);
                """, (idJogador, idInstanciaItem))
                cur.execute("UPDATE Jogador SET artefacto = 1 WHERE idJogador = %s;", (idJogador,))
                print("Amuleto equipado com sucesso!")
            else:
                cur.execute("""
                    UPDATE Jogador_equipa 
                    SET idInstanciaItem = %s 
                    WHERE idJogador = %s AND idInstanciaItem IN (
                        SELECT idInstanciaItem 
                        FROM InstanciaItem ii
                        JOIN Item i ON ii.idItem = i.idItem
                        WHERE i.tipo = 'C'
                    );
                """, (idInstanciaItem, idJogador))
                print("Amuleto trocado com sucesso!")            
        
        cur.execute("""
            DELETE FROM Possue_inventario 
            WHERE idJogador = %s AND idInstanciaItem = %s;
        """, (idJogador, idInstanciaItem))

        conn.commit()   

def desequipar_item(conn, idJogador, idInstanciaItem):
    with conn.cursor() as cur:
        cur.execute("""
            SELECT i.tipo 
            FROM Item i
            JOIN InstanciaItem ii ON i.idItem = ii.idItem
            JOIN Jogador_equipa je ON je.idInstanciaItem = ii.idInstanciaItem
            WHERE je.idJogador = %s AND ii.idInstanciaItem = %s;
        """, (idJogador, idInstanciaItem))

        item = cur.fetchone()

        if item is None:
            print("O item não está equipado pelo jogador.")
            return

        tipo_item = item[0]

        cur.execute("""
            DELETE FROM Jogador_equipa 
            WHERE idJogador = %s AND idInstanciaItem = %s;
        """, (idJogador, idInstanciaItem))
        
        if tipo_item == 'A':  # Arma
            cur.execute("UPDATE Jogador SET arma = 0 WHERE idJogador = %s;", (idJogador,))
            print("Arma desequipada com sucesso!")
        elif tipo_item == 'B':  # Armadura
            cur.execute("UPDATE Jogador SET armadura = 0 WHERE idJogador = %s;", (idJogador,))
            print("Armadura desequipada com sucesso!")
        elif tipo_item == 'C':  # Amuleto
            cur.execute("UPDATE Jogador SET artefacto = 0 WHERE idJogador = %s;", (idJogador,))
            print("Artefato desequipado com sucesso!")

        cur.execute("""
            SELECT idInventario 
            FROM Inventario 
            WHERE idJogador = %s;
        """, (idJogador,))

        inventario = cur.fetchone()

        if inventario is None:
            print("Inventário do jogador não encontrado.")
            return

        idInventario = inventario[0]

        cur.execute("""
            INSERT INTO Possue_inventario (idInventario, idInstanciaItem)
            VALUES (%s, %s);
        """, (idInventario, idInstanciaItem))

        conn.commit()
        print("Item adicionado ao inventário com sucesso!")

def jogo():
    conn = conectar_bd()
    if conn is None:
        return

    id_usuario = None

    while True:
        print("--------Bem-vindo ao MortalKombat--------")
        print("1.- Criar novo jogador")
        print("2.- Entrar como jogador existente")
        print("Digite sua opcao:")
        initial_op = int(input())
        if initial_op == 1:
            print("Digite o nome:")
            nome = input()
            print("Digite o tipo:")
            tipo = input()
            if nome.strip() and (tipo == 'A' or tipo == 'B' or tipo == 'C'):
                id_usuario = criar_jogador(conn, nome, tipo)
                jogador_sala_inicial(conn, id_usuario)
                jogador_inventario_inicial(conn, id_usuario)
                break
            else:
                print("Nome ou tipo nao valido")
        elif initial_op == 2:
            print("Insira o id de usuario")
            tmp_id_usuario = input()
            id_usuario = verificar_jogador_existe(conn, tmp_id_usuario)
            if id_usuario:
                print(f"Jogando como usuario com id: {id_usuario}")
                break
            else:
                print("Jogador não encontrado.")
        else:
            print("Insira una opcao valida")


    fim_de_jogo = False
    while not fim_de_jogo:
        sala = mostrar_sala_atual(conn, id_usuario)
        listar_salas_disponiveis(conn, sala)
        listar_lutador_sala(conn, sala)
        print("-------- Menu do Jogo --------")
        print("1.- Mostrar inventario")
        print("2.- Mostrar objetos equipados")
        print("3.- Equipar objeto")
        print("4.- Desequipar objeto")
        print("5.- Combate")
        print("6.- Mover da sala")
        print("7.- Inserir data de teste")
        print("8.- Sair")
        escolha = int(input("Digite sua escolha: "))
        clear_terminal()
        if escolha == 1:
            listar_objetos_do_jogador(conn, id_usuario)
        elif escolha == 2:
            listar_itens_equipados(conn, id_usuario)
        elif escolha == 3:
            objeto_equipar = int(input("Digite id do item a equipar: "))
            equipar_item(conn, id_usuario, objeto_equipar)
        elif escolha == 4:
            objeto_desquipar = int(input("Digite id do item a desequipar: "))
            desequipar_item(conn, id_usuario, objeto_desquipar)
        elif escolha == 5:
            lutador_combatir = int(input("Digite id do lutador a combatir: "))
            combate_lutador(conn, id_usuario, lutador_combatir)
        elif escolha == 6:
            sala_mover = int(input("Digite id da sala: "))
            mover_jogador(conn, id_usuario, sala_mover)
        elif escolha == 7:
            data_teste(conn)
        elif escolha == 8:
            conn.close()
            print("Saindo do Jogo")
            break
        else:
            print("Escolha inválida!")

jogo()