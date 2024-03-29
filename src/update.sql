-- Modifier l'adresse mail d'un client
UPDATE client SET adresse_mail = 'nouvelle_adresse@email.com' WHERE numero_client = 1;

-- Changer le statut d'une prescription
UPDATE prescription SET statut = 'Terminé' WHERE numero_prescription = 501;

-- Ajouter une intervention à un client existant
INSERT INTO intervention (numero_intervention, date_entree, date_retour, duree_prevu, devis, facture, numero_vehicule, numero_garage, id_type)
VALUES (2000, '2023-09-01', '2023-09-05', 3, 120.00, 150.00,  109, 212, 6); 

INSERT INTO prescriptions_par_interventions (numero_prescription, numero_intervention)
VALUES (504, 2000);

-- Modifier le numéro de téléphone d'un garage
UPDATE garage SET numero_telephone = '+33666641798' WHERE numero_garage = 201;


--Ajouter un nouveau type d'intervention 
INSERT INTO types_interventions (id_type, libelle) VALUES (10, 'Révision générale');

--Supprimer un type d'intervention 
DELETE FROM types_interventions WHERE id_type = 10;

-- Ajouter une nouvelle prescription pour un véhicule existant 
INSERT INTO prescription (numero_prescription, description, duree, statut, date_realisation, numero_vehicule)
VALUES (504, 'Réparation de la climatisation', 3, 'En attente', NULL, 101);


-- Suppression de données
DELETE FROM client WHERE numero_client = 1;

DELETE FROM intervention WHERE numero_intervention = 1008;


--Supprimer un client et tous ses véhicules associés :
DELETE FROM client WHERE numero_client = 1;
DELETE FROM vehicule WHERE client_numero = 1;


-- Modification de données
UPDATE intervention SET devis = 200.00 WHERE numero_intervention = 1001;
UPDATE prescription SET statut = 'En cours' WHERE statut = 'En attente';

-- Requêtes utiles pour la gestion

-- Liste tous les clients avec leurs véhicules associés
SELECT client.*, vehicule.*
FROM client
LEFT JOIN vehicule ON client.numero_client = vehicule.client_numero;


