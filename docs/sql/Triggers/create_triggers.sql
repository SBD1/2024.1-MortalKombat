-- Triggers
-- Asegurar que um item que esta intentando inserir na tabela arma realmente e um arma
CREATE OR REPLACE FUNCTION check_arma() RETURNS trigger AS $check_arma$
DECLARE
	item_tipo CHAR(1);
BEGIN
	SELECT tipo INTO item_tipo
	FROM Item
	WHERE idItem = NEW.idItem;
	
	IF item_tipo = 'A' THEN
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Não é possível inserir arma já que o item não é uma arma.';
		RETURN NULL;
	END IF;
END;
$check_arma$ LANGUAGE plpgsql;

CREATE TRIGGER arma_check_tipo
BEFORE INSERT ON Arma
FOR EACH ROW EXECUTE PROCEDURE check_arma();

-- Asegurar que um item que esta intentando inserir na tabela armadura realmente e um armadura
CREATE OR REPLACE FUNCTION check_armadura() RETURNS trigger AS $check_armadura$
DECLARE
	item_tipo CHAR(1);
BEGIN
	SELECT tipo INTO item_tipo
	FROM Item
	WHERE idItem = NEW.idItem;
	
	IF item_tipo = 'B' THEN
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Não é possível inserir armadura já que o item não é uma armadura.';
		RETURN NULL;
	END IF;
END;
$check_armadura$ LANGUAGE plpgsql;

CREATE TRIGGER armadura_check_tipo
BEFORE INSERT ON Armadura
FOR EACH ROW EXECUTE PROCEDURE check_armadura();

-- Asegurar que um item que esta intentando inserir na tabela amuleto realmente e um amuleto
CREATE OR REPLACE FUNCTION check_amuleto() RETURNS trigger AS $check_amuleto$
DECLARE
	item_tipo CHAR(1);
BEGIN
	SELECT tipo INTO item_tipo
	FROM Item
	WHERE idItem = NEW.idItem;
	
	IF item_tipo = 'C' THEN
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Não é possível inserir amuleto já que o item não é um amuleto.';
		RETURN NULL;
	END IF;
END;
$check_amuleto$ LANGUAGE plpgsql;

CREATE TRIGGER amuleto_check_tipo
BEFORE INSERT ON Amuleto
FOR EACH ROW EXECUTE PROCEDURE check_amuleto();

-- Asegurar que um item que esta intentando inserir na tabela consumivel realmente e um consumivel
CREATE OR REPLACE FUNCTION check_consumivel() RETURNS trigger AS $check_consumivel$
DECLARE
	item_tipo CHAR(1);
BEGIN
	SELECT tipo INTO item_tipo
	FROM Item
	WHERE idItem = NEW.idItem;
	
	IF item_tipo = 'D' THEN
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Não é possível inserir consumivel já que o item não é um consumivel.';
		RETURN NULL;
	END IF;
END;
$check_consumivel$ LANGUAGE plpgsql;

CREATE TRIGGER consumivel_check_tipo
BEFORE INSERT ON Consumivel
FOR EACH ROW EXECUTE PROCEDURE check_consumivel();

-- Asegurar que a sala inserida na tabela SalaCombate e de tipo combate
CREATE OR REPLACE FUNCTION check_sala_combate() RETURNS trigger AS $check_sala_combate$
DECLARE
	sala_tipo CHAR(1);
BEGIN
	SELECT tipo INTO sala_tipo
	FROM Sala
	WHERE idSala = NEW.idSala;
	
	IF sala_tipo = 'C' THEN
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Não é possível inserir sala de combate ja que a sala não é de tipo combate.';
		RETURN NULL;
	END IF;
END;
$check_sala_combate$ LANGUAGE plpgsql;

CREATE TRIGGER check_sala_combate_tipo
BEFORE INSERT ON SalaCombate
FOR EACH ROW EXECUTE PROCEDURE check_sala_combate();

-- Asegurar que a sala inserida na tabela SalaEvento e de tipo evento
CREATE OR REPLACE FUNCTION check_sala_evento() RETURNS trigger AS $check_sala_evento$
DECLARE
	sala_tipo CHAR(1);
BEGIN
	SELECT tipo INTO sala_tipo
	FROM Sala
	WHERE idSala = NEW.idSala;
	
	IF sala_tipo = 'E' THEN
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Não é possível inserir sala de evento ja que a sala não é de tipo evento.';
		RETURN NULL;
	END IF;
END;
$check_sala_evento$ LANGUAGE plpgsql;

CREATE TRIGGER check_sala_evento_tipo
BEFORE INSERT ON SalaEvento
FOR EACH ROW EXECUTE PROCEDURE check_sala_evento();