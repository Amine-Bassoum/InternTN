from flask import Flask, render_template, redirect, url_for, request
import sqlite3
import json
from flask_paginate import Pagination
import tempfile
app = Flask(__name__)

DATABASE = 'database/pp2i.db'

DOMAINES = """services aux entreprises
bâtiment et travaux publics
commerce de détail
agriculture et pêche
services publics
services sociaux
immobilier
hôtellerie et restauration
ingénierie
logistique et transport
internet et télécommunications
industrie automobile
énergie
maintenance et réparation
santé et action sociale
construction
plastique et caoutchouc
soins personnels et bien-être
sport et loisirs
technologies de l'information et de la communication
ameublement et décoration intérieure
travaux publics
formation en ligne
finance et assurance
location d'équipement
location de véhicules
marketing et publicité
recyclage
réseaux sociaux
services de consultation en informatique
transformation numérique
art et culture
vente en ligne
bijouterie et horlogerie
coaching sportif
conseil en communication
conseil en marketing
cyber sécurité
design graphique
énergie solaire
événements d'entreprise
gestion de crise
gestion des ressources humaines
gestion du changement
gestion immobilière
industrie cinématographique
industrie musicale
intelligence artificielle
associations et organisations
éducation et formation
fabrication de machines et d'équipements
vente au détail
industrie textile
informatique et services informatiques
métallurgie
services juridiques
artisanat
coaching et développement personnel
conseil en gestion
coopératives
design
édition et impression
énergie renouvelable
événementiel
fabrication de jouets et de jeux
gestion de patrimoine
laboratoires de recherche
marketing de contenu
microfinance
parcs d'attractions
placements financiers
robotique
technologie médicale
animation et vidéo
commerce de gros
services de santé mentale
industrie aérospatiale
industrie pharmaceutique
transports
imagerie médicale
biotechnologie
environnement
médias sociaux
métiers d'art
publicité en ligne
relations publiques
ressources humaines
soutien à la parentalité
traduction et interprétation
bourse et trading
soins de beauté
spectacles vivants
location de vacances
agroalimentaire
biens de consommation
nutrition et diététique
biens d'équipement
ingénierie génétique""".split('\n')

@app.route('/', methods=['GET'])
def accueil():
    return(render_template('page_accueil.html'))

@app.route('/recherche', methods=['GET'])
def afficher_formulaire():
    return render_template('recherche.html', domaines=DOMAINES)

@app.route('/intern', methods=['POST'])
def traiter_formulaire():
    nom_entreprise = request.form["entreprise"]
    grade = request.form['categories']
    domaines = request.form.getlist('domaine')
    localisation = request.form['lieu_stage']
    pays = request.form['pays']

    con = sqlite3.connect(DATABASE)
    c = con.cursor()

    resultats = """SELECT * FROM stages
                WHERE 1=1"""
    formulaire_soumis = []

    if nom_entreprise:
        resultats += " AND entreprise.nom_entreprise COLLATE NOCASE LIKE ?"
        formulaire_soumis.append(f'%{nom_entreprise}%')
        
    if grade:
        resultats += " AND stages.Type_stage COLLATE NOCASE LIKE ?"
        formulaire_soumis.append(f'%{grade}%')
        
    domaines_non_vides = [domaine.strip() for domaine in domaines if domaine.strip()]
    if domaines_non_vides:
        conditions_domaines = " OR ".join(["domaines.domaine COLLATE NOCASE LIKE ?" for _ in domaines_non_vides])
        resultats += f" AND ({conditions_domaines})"
        formulaire_soumis.extend([f'%{domaine}%' for domaine in domaines_non_vides])
    
    if localisation:    
        resultats += " AND stages.ville COLLATE NOCASE LIKE ?"
        formulaire_soumis.append(f'%{localisation}%')

    if pays:    
        resultats += " AND stages.pays COLLATE NOCASE LIKE ?"
        formulaire_soumis.append(f'%{pays}%')

    # Exécuter la requête avec le formulaire soumis
    print("ent:", nom_entreprise)
    print("dom:", domaines_non_vides)
    print("Résultats:", resultats)
    c.execute(resultats, tuple(formulaire_soumis))
    resultats = c.fetchall()
    
    with tempfile.NamedTemporaryFile(mode='w', delete=False) as temp_file:
        json.dump(resultats, temp_file)

    temp_file_path = temp_file.name

    # Fermeture de la connexion à la base de données
    con.close()

    # Redirection vers /stages_correspondants pour afficher les résultats
    return redirect(url_for('stages_correspondants', temp_file_path=temp_file_path))

@app.route('/stages_correspondants', methods=['GET'])
def stages_correspondants():
    # Obtenir les résultats de la requête des arguments de requête
    temp_file_path = request.args.get('temp_file_path')
    with open(temp_file_path, 'r') as temp_file:
        resultat = json.load(temp_file)
    #print(resultat)

    #Pagination
    page = request.args.get('page', 1, type=int)
    par_page = 30
    total = len(resultat)
    début = (page-1)*30
    fin = début + par_page

    #Utilisation de la bibliotèque Flask-Paginate
    pagination = Pagination(page=page, per_page=par_page, total=total, css_framework='bootstrap4')

    #Print résultats de la page actuelle
    resultat_page = resultat[début: fin]
    


    return render_template('stages.html', resultat=resultat_page, pagination=pagination)
    


if __name__ == '__main__':
    app.run(debug=True)


