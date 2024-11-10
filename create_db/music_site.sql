CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS autor (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS autor_genre (
	autor_id INTEGER NOT NULL REFERENCES autor(id),
	genre_id INTEGER NOT NULL REFERENCES genre(id),
	CONSTRAINT autor_genre_id PRIMARY KEY (autor_id, genre_id) 
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year DATE CHECK (year > '1930-01-01' and year < NOW()) NOT NULL
);

CREATE TABLE IF NOT EXISTS autor_album (
	autor_id INTEGER NOT NULL REFERENCES autor(id),
	album_id INTEGER NOT NULL REFERENCES album(id),
	CONSTRAINT autor_album_id PRIMARY KEY (autor_id, album_id) 
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year DATE CHECK (year > '1930-01-01' and year < NOW()) NOT NULL
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	time INTEGER CHECK (time > 30 and time < 360) NOT NULL,
	album_id INTEGER NOT NULL REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collection_track (
	collection_id INTEGER NOT NULL REFERENCES collection(id),
	track_id INTEGER NOT NULL REFERENCES track(id),
	CONSTRAINT collection_track_id PRIMARY KEY (collection_id, track_id) 
);
