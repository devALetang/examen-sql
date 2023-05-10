exo 1
SELECT nom, annéeNaiss
    FROM artiste
    WHERE annéeNaiss < 1950;

exo 2
SELECT titre
    FROM film
    WHERE genre = "drame";

exo 3
SELECT titre, nomRôle
	from artiste 
    natural join role
    NATURAL JOIN film
    	where nom = "Willis"
    	and prénom = "Bruce"
        AND idActeur = idArtiste

exo 4
SELECT nom, prénom, idRéalisateur
	FROM artiste natural join film
    where titre = "memento"
    AND idArtiste = idRéalisateur

exo 5
SELECT titre, note
	FROM notation NATURAL JOIN  film
    where titre = "Fargo"

exo 6
SELECT nom, prénom, nomRôle
	from role NATURAL JOIN artiste
    WHERE nomRôle = "Chewbacca"

exo 7
SELECT titre, nom, prénom, nomRôle
	FROM (artiste INNER JOIN role)
    NATURAL JOIN film
    WHERE nom = "Willis"
    AND prénom = "Bruce"
    AND nomRôle = "John McClane"

exo 8
SELECT nom, prénom, nomRôle, titre
FROM role
NATURAL JOIN film
NATURALl JOIN artiste
WHERE titre = "Sueurs froides"
AND idArtiste = idActeur

exo 9
SELECT prénom, nom, titre, note
	FROM internaute
    NATURAL JOIN film
    INNER JOIN notation
    WHERE prénom = "prénom0"
    AND nom = "nom0"

exo 10
select titre
from Film f
INNER JOIN artiste a
INNER JOIN artiste b 
INNER JOIN role r
where f.idFilm = r.idFilm
and r.idActeur = a.idArtiste
and f.idRéalisateur = b.idArtiste
and b.nom='Burton'
and a.nom='Depp'

exo 11
select titre, nomRôle
from film f
INNER JOIN artiste a
INNER JOIN role r
where f.idFilm = r.idFilm
and r.idActeur = a.idArtiste
and a.nom='Allen'
and a.prénom='Woody'

exo 12
select prénom, nom, nomRôle, titre
from role r
INNER JOIN artiste a
INNER JOIN film f
where f.idFilm = r.idFilm
and f.idRéalisateur = a.idArtiste
and r.idActeur = a.idArtiste

exo 13
SELECT idFilm, nom, prénom, titre
FROM artiste NATURAL JOIN film
WHERE idRéalisateur = idArtiste
AND nom != "Tarantino"

exo 14
select prénom, nom, nomRôle
from role r
INNER JOIN Film f1
INNER JOIN Film f2
INNER JOIN Artiste a
where f1.idFilm = r.idFilm
and f2.idRéalisateur = a.idArtiste
and r.idActeur = a.idArtiste

exo 15
select titre from Film f, Artiste a
where f.idRéalisateur = a.idArtiste
and a.nom='Hitchcock'
and not exists (select '' from Artiste a2, role r
where a2.idArtiste = r.idActeur
and r.idFilm=f.idFilm
and nom='Stewart')

exo 16
select a1.prénom as prénom1, a1.nom as nom1, titre,
a2.prénom as prénom2, a2.nom as nom2
from   role r, Film f, Artiste a1, Artiste a2
where  f.idFilm = r.idFilm
and    a1.idArtiste != a2.idArtiste
and    f.idRéalisateur = a1.idArtiste
and    r.idActeur = a2.idArtiste
and    a1.prénom = a2.prénom

exo 17
select titre
from Film
where idFilm not in  (select idFilm  from role)

exo 18
SELECT nom , titre 
FROM ((notation INNER JOIN film ON notation.idFilm = film.idFilm) 
INNER JOIN internaute ON notation.email = internaute.email) 
WHERE nom = "Nom1" AND prénom = "Prénom1";

exo 19
select prénom, nom
from Artiste as a
where not exists (select * from Film as f
where a.idArtiste = f.idRéalisateur)

exo 20
select avg (note) as moyenne
from Film as f, Notation as n
where f.idFilm = n.idFilm
and f.titre = 'Memento'

exo 21
SELECT idRéalisateur, nom, prénom, COUNT(idfilm)
FROM film, artiste
WHERE idRéalisateur = idArtiste
GROUP BY idRéalisateur

exo 22
select  nom, prénom
from   Artiste as a, Film as f
where f.idRéalisateur = a.idArtiste
group by nom, prénom
having count(*) > 1

exo 23
SELECT titre, note
FROM film
NATURAL join notation
WHERE note > 7