CREATE table if not exists Musical_genre (
genre_id SERIAL primary key,
name VARCHAR(60) UNIQUE not NULL
);

CREATE table if not exists Musician_performer (
performer_id SERIAL primary key,
name VARCHAR(60) not NULL
);

CREATE table if not exists Album (
album_id SERIAL primary key,
name VARCHAR(80) not NULL,
year_of_issue int
);

CREATE table if not exists Track (
track_id SERIAL primary key ,
name VARCHAR(60) not NULL,
duration integer not null,
album INTEGER not NULL references Album(album_id) 
);

CREATE TABLE IF NOT EXISTS Performer_Genre (
genre INTEGER NOT NULL references Musical_genre(genre_id),
performer INTEGER NOT NULL references Musician_performer(performer_id),
CONSTRAINT pk_genre_performer PRIMARY key (genre, performer)
);

CREATE table if not exists Album_performer (
album INTEGER not NULL REFERENCES Album(album_id),
performer INTEGER not NULL REFERENCES Musician_performer(performer_id),
CONSTRAINT pk_albums_performer PRIMARY KEY (album, performer)
);

CREATE TABLE IF NOT EXISTS collections_tracks (
track int NOT NULL REFERENCES Track(track_id),
collection int NOT NULL REFERENCES Collection(collection_id),
CONSTRAINT pk_collections_tracks PRIMARY KEY (track, collection)
);

CREATE table if not exists Collection (
collection_id SERIAL primary key,
name VARCHAR(60) not NULL,
date int
);

