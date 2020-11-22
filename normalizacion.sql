CREATE DATABASE biblioteca;
CREATE DATABASE
\c biblioteca
You are now connected to database "biblioteca" as user "kennojc".

 CREATE TABLE editoriales(
 house_id VARCHAR(25),
 publisher VARCHAR(50) NOT NULL,
 PRIMARY KEY (house_id)
 );

 CREATE TABLE autores(
 author_id SERIAL,
 author_name VARCHAR(25),
 author_lastname VARCHAR(25) NOT NULL,
 publisher_id VARCHAR(25) REFERENCES editoriales(house_id),
 PRIMARY KEY (author_id)
 );

 CREATE TABLE libros(
 book_code SERIAL,
 title VARCHAR(500) NOT NULL,
 last_returned DATE,
 id_publisher VARCHAR(25) REFERENCES editoriales(house_id),
 PRIMARY KEY (book_code)
 );

 CREATE TABLE libros_autores(
 id SERIAL,
 id_book INT NOT NULL REFERENCES libros(book_code),
 id_author INT NOT NULL REFERENCES autores(author_id),
 PRIMARY KEY (id)
 );

 CREATE TABLE lectores(
 reader_id INT,
 reader_lastname VARCHAR(250) NOT NULL,
 reader_name VARCHAR(50),
 PRIMARY KEY (reader_id)
 );

 CREATE TABLE lectores_libros(
 id SERIAL,
 id_reader INT NOT NULL REFERENCES lectores(reader_id),
 id_book INT NOT NULL REFERENCES libros(book_code),
 PRIMARY KEY (id)
 );
