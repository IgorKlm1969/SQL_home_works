/* Задача 1
Написать крипт, добавляющий в БД vk, которую создали на занятии, 
3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)

*Добавим таблицу games со списком игр как в оригинальном Вконтакте*/
USE vk;

DROP TABLE IF EXISTS euro2020_schedule;
CREATE TABLE euro2020_schedule (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  team_1 varchar(100) DEFAULT NULL,
  team_2 varchar(100) DEFAULT NULL,
  game_shc datetime DEFAULT NULL,
  country varchar(100) DEFAULT NULL,
  sity varchar(100) DEFAULT NULL,
  place varchar(100) DEFAULT NULL,
  UNIQUE KEY id (id)
);

DROP TABLE IF EXISTS game_genre;
CREATE TABLE game_genre (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  aliases varchar(255) DEFAULT NULL,
  vesion varchar(255) DEFAULT NULL,
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY id (id)
);

DROP TABLE IF EXISTS games;
CREATE TABLE games (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  game_genre_id bigint unsigned NOT NULL,
  user_id bigint unsigned NOT NULL,
  body text,
  filename varchar(255) DEFAULT NULL,
  size int DEFAULT NULL,
  metadata json DEFAULT NULL,
  release_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY id (id),
  KEY user_id (user_id),
  KEY game_genre_id (game_genre_id),
  CONSTRAINT games_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id), 
  CONSTRAINT games_ibfk_2 FOREIGN KEY (game_genre_id) REFERENCES game_genre (id)
);



