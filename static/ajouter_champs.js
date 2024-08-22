// Define the DOMAINES string
var DOMAINES = `services aux entreprises
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
ingénierie génétique`;

// Your ajouterChampDomaine function
function ajouterChampDomaine() {
    var container = document.getElementById('domaines-container');
    var nombreChampsActuels = container.children.length;

    // Vérifiez si le nombre de champs est inférieur à 3 avant d'ajouter un nouveau champ
    if (nombreChampsActuels < 4) {
        // Create a select element
        var select = document.createElement('select');
        select.className = 'form-3';
        select.name = 'domaine';

        // Split the options string into an array of options
        var optionsArray = DOMAINES.split("\n").map(option => option.trim());

        // Create and append option elements based on the options array
        optionsArray.forEach(optionText => {
            var option = document.createElement('option');
            option.value = optionText;
            option.text = optionText;
            select.appendChild(option);
        });

        container.appendChild(select);
    } else {
        alert('Vous ne pouvez pas ajouter plus de 3 domaines.');
    }
}
