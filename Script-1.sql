CREATE table if not exists Musical_genre (
genre_id SERIAL primary key,
name VARCHAR(60) not NULL
);

CREATE table if not exists Musician_performer (
performer_id SERIAL primary key,
name VARCHAR(60) not NULL
);

CREATE table if not exists Performer_Genre (
performer INTEGER not NULL REFERENCES Musician_performer(performer_id),
genre INTEGER not NULL REFERENCES Musical_genre(genre_id),
constraint performer_genre_pk primary KEY(performer, genre)
);

CREATE table if not exists Album (
album_id SERIAL primary key,
name VARCHAR(80) not NULL,
date INTEGER not NULL
);

CREATE table if not exists Album_performer (
album INTEGER not NULL REFERENCES Album(album_id),
performer INTEGER not NULL REFERENCES Musician_performer(performer_id),
constraint album_performer_pk primary KEY(album, performer)
);

CREATE table if not exists Track (
track_id SERIAL primary key ,
name VARCHAR(80) UNIQUE not NULL,
duration INTEGER not NULL
);

CREATE table if not exists Collection (
collection_id SERIAL primary key,
name VARCHAR(60) not NULL,
year_of_issue date 
);

CREATE table if not exists Track_collection (
track INTEGER not NULL REFERENCES Track(track_id),
collection INTEGER not NULL REFERENCES Collection(collection_id),
constraint track_collection_pk primary KEY(track, collection)
);

