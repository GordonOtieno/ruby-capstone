Create table music_albums(
    id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    on_spotify BOOLEAN,
    publish_date DATE NOT NULL,
    achived BOOLEAN NOT NULL,
    CONSTRAINT fk_music_albums FOREIGN KEY(id) REFERENCES Items(id),
)

Create table genres (
     id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
     
    name VARCHAR(255) NOT NULL,
    CONSTRAINT fk_genres FOREIGN KEY(id) REFERENCES Items(id),
)