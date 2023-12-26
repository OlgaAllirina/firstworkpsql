CREATE table if not exists Musical_genre (
genre_id SERIAL primary key,
name VARCHAR(60) not NULL
);

CREATE table if not exists Musician_performer (
performer_id SERIAL primary key,
name VARCHAR(60) not NULL
);

CREATE table if not exists Album (
album_id SERIAL primary key,
name VARCHAR(80) not NULL,
year_of_issue VARCHAR(4) not null
);

CREATE table if not exists Track (
track_id SERIAL primary key ,
name VARCHAR(40) not NULL,
duration TIME not null,
album INTEGER not NULL references Album(album_id) 
);

CREATE TABLE IF NOT EXISTS Performer_Genre (
genre INTEGER NOT NULL references Musical_genre(genre_id),
performer INTEGER NOT NULL references Musician_performer(performer_id)
);

CREATE table if not exists Album_performer (
album INTEGER not NULL REFERENCES Album(album_id),
performer INTEGER not NULL REFERENCES Musician_performer(performer_id)
);

CREATE table if not exists Collection (
collection_id SERIAL primary key,
name VARCHAR(60) not NULL,
year_of_issue VARCHAR(4) not null,
track INTEGER NOT NULL references Track(track_id)
);

