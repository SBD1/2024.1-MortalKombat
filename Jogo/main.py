import psycopg2


# Conectar ao banco de dados PostgreSQL
def conectar_bd():
    try:
        conn = psycopg2.connect(
            dbname="MortalKombat",
            user="postgres",
            password="guigui12",
            host="localhost",
            port="5432"
        )
        return conn
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return None


# Cria as tabelas necessárias para o jogo
def criar_tabelas(conn):
    with conn.cursor() as cur:
        cur.execute("""
            CREATE TABLE IF NOT EXISTS sala (
                id SERIAL PRIMARY KEY,
                nome VARCHAR(50)
            );
        """)

        cur.execute("""
            CREATE TABLE IF NOT EXISTS jogador (
                id SERIAL PRIMARY KEY,
                nome VARCHAR(50),
                vida INT,
                ataque INT,
                defesa INT,
                sala_id INT REFERENCES sala(id)
            );
        """)

        cur.execute("""
            CREATE TABLE IF NOT EXISTS inimigo (
                id SERIAL PRIMARY KEY,
                nome VARCHAR(50),
                vida INT,
                ataque INT,
                defesa INT,
                sala_id INT REFERENCES sala(id)
            );
        """)
        conn.commit()


# Cria uma nova sala
def criar_sala(conn, nome):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO sala (nome) 
            VALUES (%s) RETURNING id;
        """, (nome,))
        sala_id = cur.fetchone()[0]
        conn.commit()
        print(f"Sala {nome} criada com ID {sala_id}")
        return sala_id


# Cria um novo jogador
def criar_jogador(conn, nome, sala_id):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO jogador (nome, vida, ataque, defesa, sala_id) 
            VALUES (%s, 100, 10, 5, %s) RETURNING id;
        """, (nome, sala_id))
        jogador_id = cur.fetchone()[0]
        conn.commit()
        print(f"Jogador {nome} criado com ID {jogador_id}")
        return jogador_id


# Lista as salas disponíveis
def listar_salas(conn):
    with conn.cursor() as cur:
        cur.execute("SELECT id, nome FROM sala;")
        salas = cur.fetchall()
        print("Salas disponíveis:")
        for sala in salas:
            print(f"ID: {sala[0]} - Nome: {sala[1]}")
        return salas


# Move o jogador para outra sala
def mover_jogador(conn, jogador_id, nova_sala_id):
    with conn.cursor() as cur:
        cur.execute("UPDATE jogador SET sala_id = %s WHERE id = %s;", (nova_sala_id, jogador_id))
        conn.commit()
        print(f"Jogador movido para a sala {nova_sala_id}")


# Jogo principal
def jogo():
    conn = conectar_bd()
    if conn is None:
        return

    criar_tabelas(conn)

    sala1_id = criar_sala(conn, "Entrada")
    sala2_id = criar_sala(conn, "Sala2")
    sala3_id = criar_sala(conn, "Sala3")

    jogador_id = criar_jogador(conn, "Herói", sala1_id)

    fim_de_jogo = False
    while not fim_de_jogo:
        # Listar as salas disponíveis e permitir que o jogador escolha
        salas = listar_salas(conn)
        escolha = int(input("Digite o ID da sala para onde deseja se mover: "))
        mover_jogador(conn, jogador_id, escolha)

    conn.close()

jogo()