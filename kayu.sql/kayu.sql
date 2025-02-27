CREATE TABLE livres (
    id INT AUTO_INCREMENT PRIMARY KEY,        
    titre VARCHAR(100) NOT NULL,               
    auteur VARCHAR(50) NOT NULL,               
    annee_publication YEAR,                    
    genre VARCHAR(30),                         
    isbn VARCHAR(13) UNIQUE                   
);

CREATE TABLE lecteurs (
    id INT AUTO_INCREMENT PRIMARY KEY,        
    nom VARCHAR(50) NOT NULL,                  
    prenom VARCHAR(50) NOT NULL,               
    date_naissance DATE,                       
    email VARCHAR(100) UNIQUE                  
);

INSERT INTO livres (titre, auteur, annee_publication, genre, isbn)
VALUES 
    ('Le Petit Prince', 'Antoine de Saint-Exupéry', 1943, 'Conte', '9782070612758'),
    ('1984', 'George Orwell', 1949, 'Science-fiction', '9780451524935'),
    ('Harry Potter à l\'école des sorciers', 'J.K. Rowling', 1997, 'Fantasy', '9782070541270');

INSERT INTO lecteurs (nom, prenom, date_naissance, email)
VALUES 
    ('Dupont', 'Marie', '1990-05-15', 'marie.dupont@email.com'),
    ('Martin', 'Pierre', '1985-11-30', 'pierre.martin@email.com'),
    ('Lefebvre', 'Sophie', '1992-08-22', 'sophie.lefebvre@email.com');

SELECT * FROM livres;

SELECT titre, auteur 
FROM livres 
WHERE annee_publication > 1950;

SELECT nom, prenom 
FROM lecteurs 
WHERE date_naissance < '1990-01-01';

UPDATE lecteurs 
SET email = 'marie.dupont@nouveauemail.com' 
WHERE nom = 'Dupont' AND prenom = 'Marie';

DELETE FROM livres 
WHERE isbn = '9780451524935';

SELECT COUNT(*) AS nombre_total_de_livres 
FROM livres;

SELECT * 
FROM livres 
WHERE titre LIKE '%Potter%';

SELECT nom, prenom 
FROM lecteurs 
ORDER BY nom ASC;

SELECT * 
FROM livres 
ORDER BY annee_publication ASC 
LIMIT 1;

SELECT CONCAT(prenom, ' ', nom) AS nom_complet, 
       TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age 
FROM lecteurs;

SELECT genre, COUNT(*) AS nombre_de_livres
FROM livres
GROUP BY genre
ORDER BY nombre_de_livres DESC;
