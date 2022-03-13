CREATE TABLE users (
	id serial PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(255) NOT NULL,
	created_at DATE NOT NULL
);

CREATE TABLE artists (
	id serial PRIMARY KEY,
  	user_id INT,
	artist_name VARCHAR(100),
	tagline VARCHAR(255) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE tracks (
	id serial PRIMARY KEY,
	artist_id INT NOT NULL,
	name VARCHAR(255) NOT NULL,
	isrc VARCHAR(12),
	FOREIGN KEY (artist_id) REFERENCES artists (id)
);

insert into users (username, email, created_at) values ('vasya', 'vasya@gmail.com', '2022-10-10')
insert into users (username, email, created_at) values ('petya', 'petya@gmail.com', '2022-10-11')
insert into users (username, email, created_at) values ('kolya', 'kolya@gmail.com', '2022-10-12')
insert into users (username, email, created_at) values ('masha', 'masha@gmail.com', '2022-10-13')

insert into artists (user_id, artist_name, tagline) values (1, '_v_a_s_y_a_', 'Vvvvv')
insert into artists (user_id, artist_name, tagline) values (3, '_k_o_l_y_a_', 'Kkkkkk')
insert into artists (user_id, artist_name, tagline) values (4, '_m_a_s_h_a_', 'Mmmmmm')

insert into tracks (artist_id, name, isrc) values (1, 'Track_V 1', 'ISRC V')
insert into tracks (artist_id, name, isrc) values (1, 'Track_V 2', 'ISRC V')
insert into tracks (artist_id, name, isrc) values (1, 'Track_V 3', 'ISRC V')
insert into tracks (artist_id, name, isrc) values (3, 'Track_M 1', 'ISRC M')
insert into tracks (artist_id, name, isrc) values (3, 'Track_M 2', 'ISRC M')

SELECT u.id AS user_id, u.username, u.email, arts.id as artist_id, arts.tagline, tks.name as track_name, tks.isrc FROM users AS u
LEFT JOIN artists AS arts ON u.id = arts.user_id
LEFT JOIN tracks AS tks ON arts.id = tks.artist_id