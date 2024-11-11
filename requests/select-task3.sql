
--Количество исполнителей в каждом жанре.
SELECT title, COUNT(a.name) FROM genre g
LEFT JOIN autor_genre ag ON g.id =ag.genre_id 
LEFT JOIN autor a  ON ag.autor_id = a.id 
GROUP BY g.title

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.title) FROM track t 
LEFT JOIN album a ON t.album_id = a.id 
WHERE a.year BETWEEN '2019-01-01' AND '2020-12-31'

--Средняя продолжительность треков по каждому альбому.
SELECT a.title, AVG(t.time) FROM album a 
LEFT JOIN track t ON t.album_id = a.id 
GROUP BY a.title 


--Все исполнители, которые не выпустили альбомы в 2020 году

SELECT au.name FROM autor au 
WHERE au.name NOT IN (
SELECT au.name FROM autor au 
LEFT JOIN autor_album aa ON aa.autor_id = au.id 
LEFT JOIN album al ON al.id = aa.album_id 
WHERE al.year BETWEEN '2020-01-01' AND '2020-12-31'
)



--Названия сборников, в которых присутствует конкретный исполнитель .
SELECT DISTINCT c.title FROM collection c 
LEFT JOIN collection_track ct ON ct.collection_id = c.id 
LEFT JOIN track t ON t.id = ct.track_id 
LEFT JOIN album a ON a.id = t.album_id 
LEFT JOIN autor_album aa ON aa.album_id = a.id 
LEFT JOIN autor au ON aa.autor_id = au.id 
WHERE au.name = 'Miyagi'






