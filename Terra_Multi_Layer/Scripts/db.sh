sudo yum install -y mariadb105-server
sudo systemctl start mariadb
mysql -h $DB_HOST -u $DB_USER -p$DB_PASS <<EOF

CREATE DATABASE IF NOT EXISTS movie_db;
USE movie_db;
-- Tabla de publicaciones
CREATE TABLE publications (
name VARCHAR(250) NOT NULL,
avatar VARCHAR(250),
PRIMARY KEY (name)
);

-- Tabla de revisores
CREATE TABLE reviewers (
name VARCHAR(255) NOT NULL,
publication VARCHAR(250),
avatar VARCHAR(250),
PRIMARY KEY (name)
);

-- Tabla de películas
CREATE TABLE movies (
title VARCHAR(250) NOT NULL,
release_year YEAR,
score INT NULL,
reviewer VARCHAR(250) NULL,
publication VARCHAR(250) NULL,
PRIMARY KEY (title)
);

INSERT INTO publications (name, avatar)
VALUES
  ('The Daily Reviewer', 'glyphicon-eye-open'),
  ('International Movie Critic', 'glyphicon-fire'),
  ('MoviesNow', 'glyphicon-time'),
  ('MyNextReview', 'glyphicon-record'),
  ('Movies Games', 'glyphicon-heart-empty'),
  ('TheOne', 'glyphicon-globe'),
  ('ComicBookHero.com', 'glyphicon-flash');

INSERT INTO reviewers (name, publication, avatar)
VALUES
  ('Robert Smith', 'The Daily Reviewer', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Robert_Smith_%28musician%29_crop.jpg/800px-Robert_Smith_%28musician%29_crop.jpg'),
  ('Chris Harris', 'International Movie Critic', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Chris_Harris_%28journalist%29.jpg/1024px-Chris_Harris_%28journalist%29.jpg'),
  ('Janet Garcia', 'MoviesNow', 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Yanet_Garc%C3%ADa_OnlyFans_2.jpg'),
  ('Andrew West', 'MyNextReview', 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Andrew_J._West_2017.jpg'),
  ('Mindy Lee', 'Movies Games', 'https://upload.wikimedia.org/wikipedia/commons/4/48/Mindy_Sterling_by_Gage_Skidmore_2.jpg'),
  ('Martin Thomas', 'TheOne', 'https://upload.wikimedia.org/wikipedia/en/a/a6/Rick_Sanchez.png'),
  ('Anthony Miller', 'ComicBookHero.com', 'https://upload.wikimedia.org/wikipedia/en/c/c3/Morty_Smith.png');

INSERT INTO movies (title, release_year, score, reviewer, publication)
VALUES
  ('Suicide Squad', '2016', 8, 'Robert Smith', 'The Daily Reviewer'),
  ('Batman vs. Superman', '2016', 6, 'Chris Harris', 'International Movie Critic'),
  ('Captain America: Civil War', '2016', 9, 'Janet Garcia', 'MoviesNow'),
  ('Deadpool', '2016', 9, 'Andrew West', 'MyNextReview'),
  ('Avengers: Age of Ultron', '2015', 7, 'Mindy Lee', 'Movies Games'),
  ('Ant-Man', '2015', 8, 'Martin Thomas', 'TheOne'),
  ('Guardians of the Galaxy', '2014', 10, 'Anthony Miller', 'ComicBookHero.com'),
  ('Doctor Strange', '2016', 7, 'Anthony Miller', 'ComicBookHero.com'),
  ('Superman: Homecoming', '2017', 10, 'Chris Harris', 'International Movie Critic'),
  ('Wonder Woman', '2017', 8, 'Martin Thomas', 'TheOne');
EOF
exit;