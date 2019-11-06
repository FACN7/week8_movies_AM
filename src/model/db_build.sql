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
        name TEXT NOT NULL,
        pic TEXT NOT NULL,
        descrip TEXT NOT NULL,
        rate INTEGER NOT NULL,
        genre VARCHAR(255) NOT NULL,
        outyear INTEGER NOT NULL
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



insert into movies (name ,pic, descrip,rate,genre,outyear)values 
('Tropa de Elite 2','/1odL7ZU4rP8wOqPj2NLDOTyMJCh.jpg','After a bloody invasion of the BOPE in the High-Security Penitentiary Bangu',4,'Animation, Action, Drama',2022),   

('Ben-Hur','/uOQPSUGG3ZHiDg9ecN8irQNZ4T1.jpg','Judah Ben-Hur, a Palestinian Jew, is battling the Roman empire at the time of Chr',6,'Adventure, Comedy, Sci-Fi',2015),

('he Perks of Being a Wallflower','/uhLcaTPeBpUNgYhZXhDWkj7gMkp.jpg','15-year-old freshman Charlie is a wallflower, always watching life from the sidel',9,'Animation, Action, Drama',1999),

('Stagecoach','/tkKUnTgSWg3xkN6ouDUM1JH2zGK.jpg','A group of people traveling on a stagecoach find their journey complicated by the',4,'Adult',2027),

('Il primo re','/4aeVyDOEziHwoE0qkuivvmcebGy.jpg','Two brothers, Romulus and Remus, will have to rely on each other to survive in foo ',2,'Animation, Action, Drama',1997),

('Philadelphia','/eRlkgrUeaX8LsVMjqN9f6YYw9Dw.jpg','wo competing lawyers join forces to sue a prestigious law firm for AIDS discrimision',4,'Adventure, Comedy, Sci-Fi',1997),

('Ernest et Célestine','/yUB3G9hTINHYlSpWSFvoSvyPtDx.jpg','Celestine is a little mouse trying to avoid a dental career; Ernest is a big bear',2,'Adventure, Comedy, Sci-Fi',2020),

('The Blues Brothers','/q3eNcig4YFEsUTnmIYDA90FdndO.jpg','Jake Blues is just out of jail, and teams up with his brother, Elwood on a miss',10,'Animation, Action, Drama',2005),

('Le scaphandre et le papillon','/AsCyxEogqOHKEb79G5lwjfx8uSa.jpg','The true story of Elle France editor Jean-Dominique Bauby, who, in 1995 at the age',4,'Adventure, Comedy, Sci-Fi',1995);    
COMMIT;