CREATE TABLE tbl_user (
 email VARCHAR(250) NOT NULL,
 fistname VARCHAR(250) NOT NULL,
 lastname VARCHAR(250) NOT NULL,
 password VARCHAR(500) NOT NULL,
 token_gemail VARCHAR(5000),
 id_status INTEGER NOT NULL DEFAULT 1,
 id_tipouser INTEGER NOT NULL,
 id_org INTEGER,
 photoprofile VARCHAR(1000),
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL
);


ALTER TABLE tbl_user ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (email);

CREATE TABLE tbl_servicos (
 id BIGSERIAL,
 path VARCHAR(5000) NOT NULL,
 name VARCHAR(100) NOT NULL,
 componente VARCHAR(100) NOT NULL,
 icone VARCHAR(250) NOT NULL,
 id_org INTEGER,
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL
);


ALTER TABLE tbl_servicos ADD CONSTRAINT tbl_servicos_pkey PRIMARY KEY (id);

CREATE TABLE tbl_rel_user_vs_servicos (
 email_user VARCHAR(500) NOT NULL,
 id_servicos INTEGER NOT NULL
);


ALTER TABLE tbl_rel_user_vs_servicos ADD CONSTRAINT tbl_rel_user_vs_servicos_pkey PRIMARY KEY (email_user, id_servicos);

CREATE TABLE tbl_org (
 id INTEGER NOT NULL,
 nomeorg VARCHAR(1000) NOT NULL,
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL
);


ALTER TABLE tbl_org ADD CONSTRAINT tbl_org_pkey PRIMARY KEY (id);

CREATE TABLE tbl_tipo_user (
 id BIGSERIAL,
 desctipouser VARCHAR(1000) NOT NULL,
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL
);


ALTER TABLE tbl_tipo_user ADD CONSTRAINT tbl_tipo_user_pkey PRIMARY KEY (id);

CREATE TABLE tbl_status (
 id BIGSERIAL,
 descstatus VARCHAR NOT NULL,
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL
);


ALTER TABLE tbl_status ADD CONSTRAINT tbl_status_pkey PRIMARY KEY (id);

CREATE TABLE tbl_rel_tipo_user_vs_servicos (
 id_servicos INTEGER NOT NULL,
 id_tipo_user INTEGER NOT NULL
);


ALTER TABLE tbl_rel_tipo_user_vs_servicos ADD CONSTRAINT tbl_rel_tipo_user_vs_servicos_pkey PRIMARY KEY (id_tipo_user, id_servicos);

CREATE TABLE tbl_list (
 id BIGSERIAL,
 title VARCHAR(500) NOT NULL,
 done INTEGER NOT NULL,
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL,
 email_user VARCHAR(500) NOT NULL
);


ALTER TABLE tbl_list ADD CONSTRAINT tbl_list_pkey PRIMARY KEY (id);

CREATE TABLE tbl_cards (
 id BIGSERIAL,
 order_id INTEGER NOT NULL,
 descri VARCHAR(1000) NOT NULL,
 id_list INTEGER NOT NULL,
 data_entrega DATE,
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL
);


ALTER TABLE tbl_cards ADD CONSTRAINT tbl_cards_pkey PRIMARY KEY (id);

CREATE TABLE tbl_labels (
 id BIGSERIAL,
 content VARCHAR(500) NOT NULL,
 id_card INTEGER NOT NULL,
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL
);


ALTER TABLE tbl_labels ADD CONSTRAINT tbl_labels_pkey PRIMARY KEY (id);

CREATE TABLE tbl_check_list (
 id BIGSERIAL,
 descri VARCHAR(5000) NOT NULL,
 id_card INTEGER NOT NULL,
 created_at DATE NOT NULL,
 updated_at DATE NOT NULL
);


ALTER TABLE tbl_check_list ADD CONSTRAINT tbl_check_list_pkey PRIMARY KEY (id);

ALTER TABLE tbl_user ADD CONSTRAINT tbl_user_id_status_fkey FOREIGN KEY (id_status) REFERENCES tbl_status(id);
ALTER TABLE tbl_user ADD CONSTRAINT tbl_user_id_tipouser_fkey FOREIGN KEY (id_tipouser) REFERENCES tbl_tipo_user(id);
ALTER TABLE tbl_user ADD CONSTRAINT tbl_user_id_org_fkey FOREIGN KEY (id_org) REFERENCES tbl_org(id);
ALTER TABLE tbl_servicos ADD CONSTRAINT tbl_servicos_id_org_fkey FOREIGN KEY (id_org) REFERENCES tbl_org(id);
ALTER TABLE tbl_rel_user_vs_servicos ADD CONSTRAINT tbl_rel_user_vs_servicos_email_user_fkey FOREIGN KEY (email_user) REFERENCES tbl_user(email);
ALTER TABLE tbl_rel_user_vs_servicos ADD CONSTRAINT tbl_rel_user_vs_servicos_id_servicos_fkey FOREIGN KEY (id_servicos) REFERENCES tbl_servicos(id);
ALTER TABLE tbl_rel_tipo_user_vs_servicos ADD CONSTRAINT tbl_rel_tipo_user_vs_servicos_id_servicos_fkey FOREIGN KEY (id_servicos) REFERENCES tbl_servicos(id);
ALTER TABLE tbl_rel_tipo_user_vs_servicos ADD CONSTRAINT tbl_rel_tipo_user_vs_servicos_id_tipo_user_fkey FOREIGN KEY (id_tipo_user) REFERENCES tbl_tipo_user(id);
ALTER TABLE tbl_list ADD CONSTRAINT tbl_list_email_user_fkey FOREIGN KEY (email_user) REFERENCES tbl_user(email);
ALTER TABLE tbl_cards ADD CONSTRAINT tbl_cards_id_list_fkey FOREIGN KEY (id_list) REFERENCES tbl_list(id);
ALTER TABLE tbl_labels ADD CONSTRAINT tbl_labels_id_card_fkey FOREIGN KEY (id_card) REFERENCES tbl_cards(id);
ALTER TABLE tbl_check_list ADD CONSTRAINT tbl_check_list_id_card_fkey FOREIGN KEY (id_card) REFERENCES tbl_cards(id);





DELETE FROM public.tbl_rel_user_vs_servicos;
DELETE FROM public.tbl_user;
DELETE FROM public.tbl_servicos;
DELETE FROM public.tbl_org;
DELETE FROM public.tbl_tipo_user;
DELETE FROM public.tbl_status;









INSERT INTO public.tbl_status(
	id, descstatus, created_at, updated_at)
	VALUES 	(1, 'Ativo', '03/01/2021', '03/01/2021'),
			(2, 'Ativo', '03/01/2021', '03/01/2021')
;

INSERT INTO public.tbl_tipo_user(
	id, desctipouser, created_at, updated_at)
	VALUES 	(1, 'Adim', '03/01/2021', '03/01/2021'),
			(2, 'Others', '03/01/2021', '03/01/2021')
;

INSERT INTO public.tbl_org(
	id, nomeorg, created_at, updated_at)
	VALUES 	(1, 'Gestão de Produtos', '03/01/2021', '03/01/2021'),
			(2, 'Gestão pessoal', '03/01/2021', '03/01/2021')
;

INSERT INTO public.tbl_servicos(
	id, path, name, componente, icone, id_org, created_at, updated_at)
	VALUES 	(1, '/Painel/BlankPage','BlankPage', 'BlankPage', '', 1,  '03/01/2021', '03/01/2021')
;

INSERT INTO public.tbl_user(
	email, fistname, lastname, token, id_status, id_tipouser, id_org, capacidade, created_at, updated_at)
	VALUES 	('maruan.hamdan@gmail.com', 'Myke', 'Pedro Paduelo', '', 1, 1, 1, 1, '03/01/2021', '03/01/2021')
;

INSERT INTO public.tbl_rel_user_vs_servicos(
	email_user, id_servicos)
	VALUES 	('pedropaduelo@gmail.com', 1)
;

CREATE OR REPLACE VIEW view_users AS
SELECT 
    tbl_user.email,
	tbl_user.fistname,
	tbl_user.lastname,

	tbl_user.id_status,
	tbl_user.id_tipouser,
	tbl_user.id_org,

	tbl_user.token_gemail,

	tbl_status.descstatus,
	tbl_tipo_user.desctipouser,
	tbl_org.nomeorg,

	tbl_user.created_at,
	tbl_user.updated_at
	
FROM tbl_user 
	left join tbl_tipo_user on tbl_user.id_tipouser = tbl_tipo_user.id
	left join tbl_status on tbl_user.id_status = tbl_status.id
	left join tbl_org on tbl_org.id = tbl_user.id_org
;

CREATE OR REPLACE VIEW view_rel_user_vs_servicos AS
SELECT 

	tbl_rel_user_vs_servicos.id_servicos,
	tbl_rel_user_vs_servicos.email_user,

	tbl_servicos.path,
	tbl_servicos.name,
	tbl_servicos.componente,
	tbl_servicos.icone,

	view_users.fistname,
	view_users.lastname,

	view_users.descstatus,
	view_users.desctipouser,
	view_users.nomeorg

FROM tbl_rel_user_vs_servicos 

	left join view_users on view_users.email = email_user
	left join tbl_servicos on tbl_servicos.id = id_servicos
;

CREATE OR REPLACE VIEW view_rel_tipo_user_vs_servicos AS
SELECT 
	tbl_tipo_user.desctipouser,

	tbl_rel_tipo_user_vs_servicos.id_servicos,
	tbl_rel_tipo_user_vs_servicos.id_tipo_user,

	tbl_servicos.path,
	tbl_servicos.name,
	tbl_servicos.componente,
	tbl_servicos.icone

FROM tbl_rel_tipo_user_vs_servicos 

	left join tbl_tipo_user on tbl_tipo_user.id = tbl_rel_tipo_user_vs_servicos.id_tipo_user
	left join tbl_servicos on tbl_servicos.id = id_servicos
;


