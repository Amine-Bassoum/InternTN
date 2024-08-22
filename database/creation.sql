-- Création de la table avec une colonne ID comme clé primaire auto-incrémentée
CREATE TABLE IF NOT EXISTS entreprise (
    id_entreprise INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_entreprise TEXT
    -- Ajoutez d'autres colonnes au besoin
);
-- Insertion des données sélectionnées depuis le CSV dans la nouvelle table
INSERT INTO entreprise (nom_entreprise)
SELECT Distinct entreprise
FROM "Clean-preGPT";
-- Ajout de la colonne id_entreprise à "Clean-preGPT"
ALTER TABLE "Clean-preGPT"
ADD COLUMN id_entreprise INTEGER;
-- Mise à jour de la colonne id_entreprise de "Clean-preGPT" avec les identifiants de la table entreprise
UPDATE "Clean-preGPT"
SET id_entreprise = (
    SELECT entreprise.id_entreprise
    FROM entreprise
    WHERE "Clean-preGPT".Entreprise = entreprise.nom_entreprise
);


-- Création de la table avec une colonne ID comme clé primaire auto-incrémentée
CREATE TABLE IF NOT EXISTS eleves (
    id_eleve INTEGER PRIMARY KEY AUTOINCREMENT,
    Nom TEXT,
	Prenom Text
    -- Ajoutez d'autres colonnes au besoin
);

INSERT INTO eleves (Nom, Prenom)
SELECT Distinct Nom_Etudiant, Prenom_Etudiant
FROM "Clean-preGPT";
-- Ajout de la colonne id_eleve à "Clean-preGPT"
ALTER TABLE "Clean-preGPT"
ADD COLUMN id_eleve INTEGER;
-- Mise à jour de la colonne id_eleve de "Clean-preGPT" avec les identifiants de la table eleves
UPDATE "Clean-preGPT"
SET id_eleve = (
    SELECT id_eleve
    FROM eleves
    WHERE "Clean-preGPT".Nom_Etudiant = eleves.Nom AND "Clean-preGPT".Prenom_Etudiant = eleves.Prenom
);

-- Création de la table avec une colonne ID comme clé primaire auto-incrémentée
CREATE TABLE IF NOT EXISTS masters (
    id_master INTEGER PRIMARY KEY AUTOINCREMENT,
    Nom TEXT,
    Prenom Text,
    Tél Text,
    Portable Text,
    Courriel Text
);
-- Insertion des données sélectionnées depuis le CSV dans la nouvelle table
INSERT INTO masters (Nom, Prenom, Tél, Portable, Courriel)
SELECT Distinct Nom_Contact_1, Prenom_Contact_1, Telephone_1, Portable_1, Courriel_1
FROM "Clean-preGPT";

INSERT INTO masters (Nom, Prenom, Tél, Portable, Courriel)
SELECT Distinct Nom_Contact_2, Prenom_Contact_2, Telephone_2, Portable_2, Courriel_2
FROM "Clean-preGPT";

INSERT INTO masters (Nom, Prenom, Tél, Portable, Courriel)
SELECT Distinct Nom_Contact_3, Prenom_Contact_3, Telephone_3, Portable_3, Courriel_3
FROM "Clean-preGPT";
-- Ajout de la colonne id_entreprise à "Clean-preGPT"
ALTER TABLE "Clean-preGPT"
ADD COLUMN id_master INTEGER;
ALTER TABLE "Clean-preGPT"
ADD COLUMN id_master2 INTEGER;
ALTER TABLE "Clean-preGPT"
ADD COLUMN id_master3 INTEGER;
-- Mise à jour de la colonne id_entreprise de "Clean-preGPT" avec les identifiants de la table entreprise
-- Update for Contact_1
UPDATE "Clean-preGPT"
SET id_master = (
    SELECT masters.id_master
    FROM masters
    WHERE 
        ("Clean-preGPT".Nom_Contact_1 IS NULL OR "Clean-preGPT".Nom_Contact_1 = masters.Nom) AND
        ("Clean-preGPT".Prenom_Contact_1 IS NULL OR "Clean-preGPT".Prenom_Contact_1 = masters.Prenom) AND
        ("Clean-preGPT".Telephone_1 IS NULL OR "Clean-preGPT".Telephone_1 = masters.Tél) AND
        ("Clean-preGPT".Portable_1 IS NULL OR "Clean-preGPT".Portable_1 = masters.Portable) AND
        ("Clean-preGPT".Courriel_1 IS NULL OR "Clean-preGPT".Courriel_1 = masters.Courriel)
);

-- Update for Contact_2
UPDATE "Clean-preGPT"
SET id_master2 = (
    SELECT masters.id_master
    FROM masters
    WHERE 
        ("Clean-preGPT".Nom_Contact_2 IS NULL OR "Clean-preGPT".Nom_Contact_2 = masters.Nom) AND
        ("Clean-preGPT".Prenom_Contact_2 IS NULL OR "Clean-preGPT".Prenom_Contact_2 = masters.Prenom) AND
        ("Clean-preGPT".Telephone_2 IS NULL OR "Clean-preGPT".Telephone_2 = masters.Tél) AND
        ("Clean-preGPT".Portable_2 IS NULL OR "Clean-preGPT".Portable_2 = masters.Portable) AND
        ("Clean-preGPT".Courriel_2 IS NULL OR "Clean-preGPT".Courriel_2 = masters.Courriel)
);

-- Update for Contact_3
UPDATE "Clean-preGPT"
SET id_master3 = (
    SELECT masters.id_master
    FROM masters
    WHERE 
        ("Clean-preGPT".Nom_Contact_3 IS NULL OR "Clean-preGPT".Nom_Contact_3 = masters.Nom) AND
        ("Clean-preGPT".Prenom_Contact_3 IS NULL OR "Clean-preGPT".Prenom_Contact_3 = masters.Prenom) AND
        ("Clean-preGPT".Telephone_3 IS NULL OR "Clean-preGPT".Telephone_3 = masters.Tél) AND
        ("Clean-preGPT".Portable_3 IS NULL OR "Clean-preGPT".Portable_3 = masters.Portable) AND
        ("Clean-preGPT".Courriel_3 IS NULL OR "Clean-preGPT".Courriel_3 = masters.Courriel)
);

-- Update for Contact_2
UPDATE "Clean-preGPT"
SET id_master2 = (
    SELECT masters.id_master
    FROM masters
    WHERE 
        ("Clean-preGPT".Nom_Contact_2 IS NULL OR "Clean-preGPT".Nom_Contact_2 = masters.Nom) AND
        ("Clean-preGPT".Prenom_Contact_2 IS NULL OR "Clean-preGPT".Prenom_Contact_2 = masters.Prenom) AND
        ("Clean-preGPT".Telephone_2 IS NULL OR "Clean-preGPT".Telephone_2 = masters.Tél) AND
        ("Clean-preGPT".Portable_2 IS NULL OR "Clean-preGPT".Portable_2 = masters.Portable) AND
        ("Clean-preGPT".Courriel_2 IS NULL OR "Clean-preGPT".Courriel_2 = masters.Courriel)
);
UPDATE "Clean-preGPT"
SET id_master2 = 0
WHERE Nom_Contact_2 IS NULL
  AND Prenom_Contact_2 IS NULL
  AND Telephone_2 IS NULL
  AND Portable_2 IS NULL
  AND Courriel_2 IS NULL;

-- Update for Contact_3
UPDATE "Clean-preGPT"
SET id_master3 = (
    SELECT masters.id_master
    FROM masters
    WHERE 
        ("Clean-preGPT".Nom_Contact_3 IS NULL OR "Clean-preGPT".Nom_Contact_3 = masters.Nom) AND
        ("Clean-preGPT".Prenom_Contact_3 IS NULL OR "Clean-preGPT".Prenom_Contact_3 = masters.Prenom) AND
        ("Clean-preGPT".Telephone_3 IS NULL OR "Clean-preGPT".Telephone_3 = masters.Tél) AND
        ("Clean-preGPT".Portable_3 IS NULL OR "Clean-preGPT".Portable_3 = masters.Portable) AND
        ("Clean-preGPT".Courriel_3 IS NULL OR "Clean-preGPT".Courriel_3 = masters.Courriel)
);
UPDATE "Clean-preGPT"
SET id_master3 = 0
WHERE Nom_Contact_3 IS NULL
  AND Prenom_Contact_3 IS NULL
  AND Telephone_3 IS NULL
  AND Portable_3 IS NULL
  AND Courriel_3 IS NULL;

-- Suppression de la colonne entreprise de "Clean-preGPT"
--ALTER TABLE "Clean-preGPT" 
--DROP COLUMN Entreprise;
-- Suppression de la colonne nom eleve prenom eleve de "Clean-preGPT"
--ALTER TABLE "Clean-preGPT"
--DROP COLUMN Nom_Etudiant, Prenom_Etudiant;
-- Suppression de la colonne master de "Clean-preGPT"
--ALTER TABLE "Clean-preGPT" 
--DROP COLUMN Nom_Contact_1, Prenom_Contact_1, Telephone_1, Portable_1, Courriel_1;


--changed name of "Clean-preGPT" to "stages"

CREATE TABLE IF NOT EXISTS domaines (
    id_domaine INTEGER PRIMARY KEY AUTOINCREMENT,
    id_entreprise INTEGER,
	domaine TEXT
);
INSERT INTO domaines (id_entreprise)
SELECT id_entreprise
FROM entreprise;

UPDATE domaines
SET domaine = (SELECT Domaine FROM "Clean-preGPT" WHERE "Clean-preGPT".id_entreprise = domaines.id_entreprise);

ALTER TABLE stages
ADD COLUMN durée REAL;


UPDATE stages
SET durée = julianday(date_fin) - julianday(date_debut) + julianday(inter_debut) - julianday(inter_fin)
WHERE inter_debut IS NOT NULL AND inter_fin IS NOT NULL;

-- domaine part

DELETE FROM domaines
WHERE domaine_id NOT IN (
    SELECT MIN(domaine_id)
    FROM domaines
    GROUP BY entreprise, domaine
);

UPDATE domaines
SET id_entreprise = (SELECT id_entreprise FROM entreprise WHERE entreprise.nom_entreprise = domaines.id_entreprise);
