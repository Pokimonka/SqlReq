--Название и продолжительность самого длительного трека.
--у меня 2 трека с самой длинной продолжительностью, поставила лимит на 1 трек
SELECT title, time FROM track
WHERE time = (SELECT MAX(time) FROM track)
LIMIT 1


--Название треков, продолжительность которых не менее 3,5 минут.
SELECT title FROM track
WHERE time >= 180

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title FROM collection
WHERE year BETWEEN '2018-01-01' AND '2020-12-31'

--Исполнители, чьё имя состоит из одного слова.
SELECT name FROM autor
WHERE NOT name LIKE '%% %%'

--Название треков, которые содержат слово «мой» или «my»
SELECT title FROM track
WHERE title LIKE '%мой%' OR title LIKE '%my%'
