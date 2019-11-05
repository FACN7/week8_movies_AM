BEGIN;
    DROP TABLE IF EXISTS users,movies,movierates;

    CREATE TABLE
    IF NOT EXISTS users(
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        email VARCHAR (80) UNIQUE NOT NULL,
        password TEXT NOT NULL 
    );

    CREATE TABLE
    IF NOT EXISTS movies(
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        pic TEXT NOT NULL,
        descrip VARCHAR (255) NOT NULL,
        rate INTEGER NOT NULL
    );


     CREATE TABLE
    IF NOT EXISTS movierates(
        movie_id INTEGER,
        user_id INTEGER,
        rate INTEGER NOT NULL,
        FOREIGN KEY (movie_id) REFERENCES movies (id),
        FOREIGN KEY (user_id) REFERENCES users (id)
    );

INSERT INTO users
    (name,email,password)
  VALUES
    ('Ariel', 'djariellb@gmail.com', '$2a$10$jaE1jYP32AEiEqbLQpyCBuCfLcXyqfmzNZHt5rUptz5xoRxW/RbgG'),
    ('diab', 'diab@gmail.com', '$2a$10$jaE1jYP32AEiEqbLQpyCBuCfLcXyqfmzNZHt5rUptz5xoRxW/RbgG');

INSERT INTO movies
    (name,pic,descrip,rate)
  VALUES
    ('joker','https://hips.hearstapps.com/digitalspyuk.cdnds.net/18/38/1537552289-joker1.jpg?resize=480', 'joker',7),
    ('spiderman', 'https://upload.wikimedia.org/wikipedia/en/f/f9/Spider-Man_Homecoming_poster.jpg','spiderman',9);


COMMIT;