-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 16 juin 2025 à 03:09
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `locatvente`
--

-- --------------------------------------------------------

--
-- Structure de la table `appli_accueilparti1`
--

DROP TABLE IF EXISTS `appli_accueilparti1`;
CREATE TABLE IF NOT EXISTS `appli_accueilparti1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_accueilparti1`
--

INSERT INTO `appli_accueilparti1` (`id`, `titre`, `description`) VALUES
(1, 'Choisissez un véhicule', 'Vivez des aventures sans précédent et des voyages mémorables avec notre vaste flotte de véhicules adaptés à tous les besoins, goûts et destinations'),
(2, 'Choisissez le lieu & la date', 'Choisissez votre lieu et votre date idéaux et laissez-nous vous emmener dans un voyage rempli de commodité, de flexibilité et d\'expériences inoubliables.'),
(3, 'Faire une réservation', 'Sécurisez votre réservation en toute simplicité, libérez un monde de possibilités et embarquez pour votre prochaine aventure en toute confiance.'),
(4, 'Asseyez-vous & détendez-vous', 'Un confort sans tracas car nous prenons soin de chaque détail, vous permettant de vous détendre et de profiter d\'un voyage rempli de confort'),
(5, 'Securité', 'Tous nos véhicules font l’objet d’un entretien rigoureux et régulier selon les recommandations des constructeurs. Avant chaque mise en location, un contrôle technique et visuel est effectué pour garantir leur bon état mécanique et sécuritaire.');

-- --------------------------------------------------------

--
-- Structure de la table `appli_actu`
--

DROP TABLE IF EXISTS `appli_actu`;
CREATE TABLE IF NOT EXISTS `appli_actu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `imageactu` varchar(100) NOT NULL,
  `jour` varchar(100) NOT NULL,
  `mois` varchar(100) NOT NULL,
  `modal` longtext NOT NULL DEFAULT (_utf8mb3'standard'),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_actu`
--

INSERT INTO `appli_actu` (`id`, `titre`, `description`, `imageactu`, `jour`, `mois`, `modal`) VALUES
(1, 'L\'avenir de la location de voitures', 'Alors que la technologie continue de progresser à un rythme rapide, le secteur de la location de voitures est sur le point de connaître un changement transformateur. L’avenir de la location de voitures promet.', 'images/Lamborghini.jpg', '17', 'Juillet', 'L\'avenir de la localisation des voitures s\'oriente vers plus de flexibilité, de technologie et de durabilité. On observe une croissance des emplacements de courte durée facilitées par les applications mobiles et les plateformes en ligne, offrant une expérience rapide et sans contact. Par ailleurs, la demande pour des véhicules électriques et hybrides augmente, répondant à une conscience écologique plus forte. La localisation avec chauffeur et les services personnalisés gagnent également en popularité, tandis que l\'intégration de l\'intelligence artificielle permet d\'optimiser la gestion des flottes et la relation client. En résumé, la location de voitures devient plus accessible, écologique et connectée pour mieux répondre aux attentes des clients modernes..'),
(3, 'Profitez de la meilleure expérience de voyage', 'Voyager est une expérience enrichissante qui nous permet d\'explorer de nouvelles destinations, de nous immerger dans différentes cultures et de créer des souvenirs inoubliables.', 'images/pic-blog-2.jpg', '21', 'Août', 'Profitez de la meilleure expérience de voyage en combinant confort, liberté et authenticité. Que vous fassiez une escapade en ville, une aventure en pleine nature ou un long périple à l\'étranger, chaque détail compte : le choix du bon véhicule ou d\'hébergement, la planification intelligente, la découverte de nouvelles cultures et surtout, la liberté d\'explorer à votre rythme. Voyagez léger, ouvrez-vous aux rencontres, et laissez chaque destination vous offrir des souvenirs inoubliables..'),
(2, 'Conseils de vacances pour les routards', 'Pour les amateurs d’aventure et les voyageurs soucieux de leur budget, la randonnée offre une manière passionnante et immersive d’explorer le monde. Que vous embarquiez..', 'images/pic-blog-3.jpg', '13', 'Août', 'Les vacances en mode routard offrent une manière authentique, économique et flexible de voyager. Avec un sac à dos bien organisé, des offres abordables comme les auberges de jeunesse ou le couchsurfing, et une bonne gestion du budget, le routard vit une aventure enrichissante..');

-- --------------------------------------------------------

--
-- Structure de la table `appli_base`
--

DROP TABLE IF EXISTS `appli_base`;
CREATE TABLE IF NOT EXISTS `appli_base` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `localisation` varchar(255) NOT NULL,
  `imagelogo` varchar(100) NOT NULL,
  `about` longtext NOT NULL,
  `jour_ouverture` varchar(20) NOT NULL,
  `jour_fermeture` varchar(20) NOT NULL,
  `heure_ouverture` time(6) NOT NULL,
  `heure_fermeture` time(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_base`
--

INSERT INTO `appli_base` (`id`, `numero`, `email`, `localisation`, `imagelogo`, `about`, `jour_ouverture`, `jour_fermeture`, `heure_ouverture`, `heure_fermeture`) VALUES
(1, '0759225434', 'adouauto@gmail.com', 'Abidjan-Yopougon', 'logos/logo-light4_VqQu1bI.PNG', 'Où la qualité rencontre l\'abordabilité. Nous comprenons l’importance d’un voyage fluide et agréable sans le fardeau de coûts excessifs. C\'est pourquoi nous avons méticuleusement élaboré nos offres pour vous proposer des véhicules haut de gamme à un coût minimum.', 'Lundi', 'Samedi', '08:00:00.000000', '20:00:00.000000');

-- --------------------------------------------------------

--
-- Structure de la table `appli_caracteristiquetechnique`
--

DROP TABLE IF EXISTS `appli_caracteristiquetechnique`;
CREATE TABLE IF NOT EXISTS `appli_caracteristiquetechnique` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_sieges` smallint UNSIGNED NOT NULL,
  `nombre_portes` smallint UNSIGNED NOT NULL,
  `vitesse_max` smallint UNSIGNED NOT NULL,
  `climatisation` tinyint(1) NOT NULL,
  `transmission` varchar(10) NOT NULL,
  `carburant` varchar(10) NOT NULL,
  `consommation` double DEFAULT NULL,
  `vehicule_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicule_id` (`vehicule_id`)
) ;

--
-- Déchargement des données de la table `appli_caracteristiquetechnique`
--

INSERT INTO `appli_caracteristiquetechnique` (`id`, `nombre_sieges`, `nombre_portes`, `vitesse_max`, `climatisation`, `transmission`, `carburant`, `consommation`, `vehicule_id`) VALUES
(1, 5, 4, 180, 1, 'AUTO', 'ESSENCE', 16, 8),
(2, 5, 4, 234, 1, 'AUTO', 'DIESEL', 9.1, 7),
(3, 5, 4, 250, 1, 'AUTO', 'ESSENCE', 12.7, 6),
(4, 5, 2, 250, 1, 'AUTO', 'ESSENCE', 11.8, 5),
(5, 4, 2, 350, 0, 'AUTO', 'ESSENCE', 23, 4),
(6, 4, 2, 300, 1, 'AUTO', 'HYBRIDE', 12.7, 3),
(7, 5, 4, 250, 1, 'AUTO', 'ELECTRIQUE', 10.2, 2),
(8, 5, 4, 193, 1, 'AUTO', 'DIESEL', 6, 1),
(9, 5, 4, 233, 0, 'AUTO', 'ESSENCE', 7.5, 9),
(10, 7, 2, 167, 1, 'AUTO', 'HYBRIDE', 7.5, 10),
(11, 5, 2, 270, 1, 'AUTO', 'ESSENCE', 11.1, 11),
(12, 4, 2, 318, 0, 'AUTO', 'ESSENCE', 14.1, 12),
(13, 4, 4, 180, 1, 'AUTO', 'ESSENCE', 7.9, 13),
(14, 4, 4, 200, 0, 'AUTO', 'ESSENCE', 6.8, 14),
(15, 4, 2, 410, 1, 'AUTO', 'HYBRIDE', 14, 15),
(16, 4, 2, 325, 1, 'AUTO', 'ESSENCE', 15.2, 16),
(17, 4, 2, 326, 1, 'AUTO', 'ESSENCE', 11.6, 17);

-- --------------------------------------------------------

--
-- Structure de la table `appli_choix`
--

DROP TABLE IF EXISTS `appli_choix`;
CREATE TABLE IF NOT EXISTS `appli_choix` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_choix`
--

INSERT INTO `appli_choix` (`id`, `titre`, `description`) VALUES
(2, 'Assistance routière 24h/24 et 7j/7', 'Une assistance fiable lorsque vous en avez le plus besoin, pour vous permettre de bouger en toute confiance et tranquillité d\'esprit'),
(3, 'La qualité à moindre coût', 'Libérer une brillance abordable avec une qualité élevée tout en minimisant les coûts pour une valeur maximale.');

-- --------------------------------------------------------

--
-- Structure de la table `appli_choix2`
--

DROP TABLE IF EXISTS `appli_choix2`;
CREATE TABLE IF NOT EXISTS `appli_choix2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_choix2`
--

INSERT INTO `appli_choix2` (`id`, `titre`, `description`) VALUES
(1, 'Prestations de première classe', 'Où le luxe rencontre des soins exceptionnels, créant des moments inoubliables et dépassant toutes vos attentes.'),
(2, 'Prise en charge et retour gratuits', 'Bénéficiez de services de prise en charge et de dépose gratuits, ajoutant une couche supplémentaire de simplicité à votre expérience de location de voiture');

-- --------------------------------------------------------

--
-- Structure de la table `appli_defile`
--

DROP TABLE IF EXISTS `appli_defile`;
CREATE TABLE IF NOT EXISTS `appli_defile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_defile`
--

INSERT INTO `appli_defile` (`id`, `titre`) VALUES
(1, 'vehicule exotique'),
(2, 'Sedan'),
(3, 'véhicule  coupé'),
(4, 'Cabriolet'),
(5, 'voiture hayon'),
(6, 'Vehicule de luxe'),
(7, 'Véhicules vus');

-- --------------------------------------------------------

--
-- Structure de la table `appli_direction`
--

DROP TABLE IF EXISTS `appli_direction`;
CREATE TABLE IF NOT EXISTS `appli_direction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `fonction` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_direction`
--

INSERT INTO `appli_direction` (`id`, `nom`, `prenom`, `fonction`, `photo`) VALUES
(1, 'ADOPO', 'FREDY', 'Bureau de création en chef', 'images/adopo_2025-06-16_à_00.37.46_e6fbf26a.jpg'),
(2, 'KONE', 'ABOUDRAMANE', 'Directeur de la technologie', 'images/kone_2025-06-16_à_00.36.44_f8f828a1.jpg'),
(3, 'AKA', 'ANELKA', 'Directeur général', 'images/aka_2025-06-16_à_00.36.46_8d1942f3.jpg'),
(4, 'SEKONGO', 'YAA', 'Directrice des Finances', 'images/segongo_2025-06-16_à_00.36.45_982850b4.jpg'),
(5, 'KOUASSI', 'HAZARD', 'Chef Comptable', 'images/kouassi_2025-06-16_à_00.36.45_fdca44c6.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `appli_fond`
--

DROP TABLE IF EXISTS `appli_fond`;
CREATE TABLE IF NOT EXISTS `appli_fond` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `imagefond` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_fond`
--

INSERT INTO `appli_fond` (`id`, `titre`, `imagefond`) VALUES
(1, 'fond', 'images/1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `appli_impression`
--

DROP TABLE IF EXISTS `appli_impression`;
CREATE TABLE IF NOT EXISTS `appli_impression` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `photo` varchar(100) NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Appli_impression_utilisateur_id_d7d28876` (`utilisateur_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_impression`
--

INSERT INTO `appli_impression` (`id`, `description`, `photo`, `utilisateur_id`) VALUES
(1, 'J\'utilise ADOU AUTO pour mes besoins de location de voitures depuis plus de 5 ans maintenant. Je n\'ai jamais eu de problèmes avec leur service. Leur support client est toujours réactif et utile. Je recommanderais  ADOU AUTO à tous ceux qui recherchent un fournisseur de location de voitures fiable.', 'images/ad.jpg', 5),
(2, 'Nous utilisons ADOU AUTO pour nos voyages depuis plusieurs années maintenant et avons toujours été satisfaits de leur service. Leur support client est un excellent service ! et ils sont toujours disponibles pour vous aider à résoudre tous les problèmes que nous rencontrons. Leurs prix sont également très compétitifs', 'images/413026835_1723257031521739_9201580698042409376_n.jpg', 9),
(3, 'Approuvée par des experts du secteur, ADOU AUTO est la solution de location de voitures à laquelle vous pouvez faire confiance. Avec des années d\'expérience dans le domaine, nous fournissons des services de location de voitures rapides, fiables et sécurisés.', 'images/WhatsApp_Image_2023-08-28_at_08.09.37.jpeg', 6);

-- --------------------------------------------------------

--
-- Structure de la table `appli_publicite`
--

DROP TABLE IF EXISTS `appli_publicite`;
CREATE TABLE IF NOT EXISTS `appli_publicite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_publicite`
--

INSERT INTO `appli_publicite` (`id`, `titre`, `description`, `photo`) VALUES
(1, 'Nous proposons à nos clients une large gamme de voitures commerciales et de voitures de luxe  pour toutes les occasions', 'Chez notre agence de location de voitures, nous pensons que chacun mérite de connaître le plaisir de conduire un véhicule fiable et confortable, quel que soit son budget. Nous avons constitué une flotte diversifiée de voitures bien entretenues, allant des berlines élégantes aux SUV spacieux, le tout à des prix compétitifs. Grâce à notre processus de location simplifié, vous pouvez réserver rapidement et facilement le véhicule de votre choix. Que vous ayez besoin d\'un moyen de transport pour un voyage d\'affaires, des vacances en famille ou simplement pour profiter d\'un week-end, nous proposons des options de location flexibles pour s\'adapter à votre emploi du temps.', 'images/2.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `appli_question`
--

DROP TABLE IF EXISTS `appli_question`;
CREATE TABLE IF NOT EXISTS `appli_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `reponse` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_question`
--

INSERT INTO `appli_question` (`id`, `titre`, `reponse`) VALUES
(1, 'Comment puis-je démarrer avec la location de voitures ?', 'Pour démarrer avec la localisation de la voiture, il vous suffit de choisir le véhicule qui correspond à vos besoins, de nous fournir une pièce d\'identité, un permis de conduire valide et, selon le cas, un acompte ou une prudence. Une fois la réservation faite par téléphone, WhatsApp, sur notre site ou en agence, nous procédons à la signature d\'un contrat de location clair et sécurisé. Le véhicule vous est ensuite remis propre, en bon état et avec le plein de carburant. Tous nos véhicules sont assurés et bien entretenus, et notre service client reste disponible pour toute assistance pendant la période de localisation'),
(2, 'Puis-je louer une voiture avec une carte de débit ?', 'Oui, il est possible de louer une voiture avec une carte de débit, à condition que celle-ci soit au nom du conducteur principal et dispose de suffisamment de fonds pour couvrir la location ainsi que la prudence éventuelle. Toutefois, certaines restrictions peuvent s\'appliquer selon le type de véhicule ou la durée de la localisation. Il est donc recommandé de nous contacter à l\'avance pour vérifier les conditions spécifiques et faciliter le traitement de votre réservation.'),
(3, 'De quel type de location de voiture ai-je besoin ?', 'Le type de localisation de voiture dont vous avez besoin dépend de votre utilisation. Pour un déplacement ponctuel ou une sortie en ville, un emplacement courte durée (à la journée ou demi-journée) d\'une petite voiture est idéal. Si vous partez en famille ou avec des bagages, un SUV ou un véhicule 7 places sera plus adapté. Pour les voyages professionnels ou de longues périodes, une localisation longue durée offre plus de confort et de flexibilité. Enfin, si vous préférez ne pas conduire, nous proposons également des véhicules avec chauffeur. N\'hésitez pas à nous expliquer vos besoins, et nous vous conseillerons le véhicule le plus adapté.'),
(4, 'Qu\'est-ce qu\'un dépôt de garantie pour une voiture de location', 'Le dépôt de garantie, également appelé caution, est une somme d\'argent temporairement bloquée ou laissée en garantie lors de la localisation d\'une voiture. Il permet de couvrir d\'éventuels frais supplémentaires, comme des dommages non déclarés, du carburant manquant ou un retour en retard. Le montant varie selon le type de véhicule et la durée de la localisation. Ce dépôt est entièrement remboursé à la fin du contrat si le véhicule est rendu en bon état, à l\'heure, et avec le carburant requis.'),
(5, 'Puis-je annuler ou modifier ma réservation ?', 'Oui, vous pouvez annuler ou modifier votre réservation. Nous comprenons que des imprévus peuvent survenir. Il suffit de nous contacter le plus tôt possible pour nous informer du changement. Selon les conditions de votre réservation, des frais d\'annulation ou de modification peuvent s\'appliquer, surtout si cela est fait à la dernière minute. Nous faisons cependant toujours de notre mieux pour vous offrir de la flexibilité et un service adapté à votre situation.'),
(6, 'Est-il possible de prolonger ma durée de location ?', 'Il est tout à fait possible de prolonger la durée de votre localisation. Il vous suffit de nous prévenir avant la fin du contrat initial afin que nous puissions vérifier la disponibilité du véhicule et mettre à jour les documents. Le tarif sera ajusté en fonction de la durée supplémentaire. Plus vous nous informez tôt, plus nous pouvons garantir la continuité de votre emplacement sans interruption.');

-- --------------------------------------------------------

--
-- Structure de la table `appli_reservation`
--

DROP TABLE IF EXISTS `appli_reservation`;
CREATE TABLE IF NOT EXISTS `appli_reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `prix_total` decimal(10,2) DEFAULT NULL,
  `date_creation` datetime(6) NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  `vehicule_id` bigint NOT NULL,
  `destination` varchar(100) NOT NULL,
  `lieu_prise` varchar(100) NOT NULL,
  `date_modification` datetime(6) NOT NULL,
  `piece_identite_recto` varchar(100) DEFAULT NULL,
  `piece_identite_verso` varchar(100) DEFAULT NULL,
  `statut` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Appli_reservation_utilisateur_id_350dcabb` (`utilisateur_id`),
  KEY `Appli_reservation_vehicule_id_72a915a6` (`vehicule_id`)
) ;

--
-- Déchargement des données de la table `appli_reservation`
--

INSERT INTO `appli_reservation` (`id`, `date_debut`, `date_fin`, `prix_total`, `date_creation`, `utilisateur_id`, `vehicule_id`, `destination`, `lieu_prise`, `date_modification`, `piece_identite_recto`, `piece_identite_verso`, `statut`) VALUES
(2, '2025-06-15', '2025-06-19', '225000.00', '2025-06-15 21:16:36.092992', 5, 3, 'Alepé', 'cocody', '2025-06-15 23:27:04.579854', 'pieces_identite/recto/202505310949230000.jpg', 'pieces_identite/verso/projet_25_05_2025_16_08_59.png', 'EN_ATTENTE'),
(3, '2025-06-15', '2025-06-21', '490000.00', '2025-06-15 21:33:28.392516', 5, 16, 'Dabou', 'cocody', '2025-06-15 23:28:55.189505', 'pieces_identite/recto/projet_25_05_2025_16_07_08.png', 'pieces_identite/verso/projet_25_05_2025_16_08_46.png', 'EN_COURS');

-- --------------------------------------------------------

--
-- Structure de la table `appli_utilisateur`
--

DROP TABLE IF EXISTS `appli_utilisateur`;
CREATE TABLE IF NOT EXISTS `appli_utilisateur` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `adresse` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_utilisateur`
--

INSERT INTO `appli_utilisateur` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `telephone`, `adresse`) VALUES
(1, 'pbkdf2_sha256$600000$J9cSbqv7V8ssLaMgTyZTUn$FSZDTZMxEdPVe70y1h8BeuBCXjfKWlzkWcBm13Ayc1Y=', '2025-06-16 02:40:45.845734', 1, 'adoulocation', '', '', '', 1, 1, '2025-06-02 10:17:02.316485', NULL, NULL),
(5, 'pbkdf2_sha256$600000$ksE51G5lM8XHyiDhbBzUu7$uRXKN64O7211nOqwnJhEUfELej2QOpCeSGoEOb1SMiQ=', '2025-06-16 03:08:02.353501', 0, 'John', 'ADOU', 'JOHN', 'cyrieadu3@gmail.com', 0, 1, '2025-06-08 19:09:49.413822', '5342625262', 'poy'),
(4, 'pbkdf2_sha256$600000$Z5G4RvLK1TNPoNbIDqLRTe$VOD0fD57fEx8jHDh8xk5KGwS0X/6A1blBMNZVxGneKE=', '2025-06-07 00:02:12.059598', 0, 'hasard', 'aze', 'ver', 'cyrieadou3@gmail.com', 0, 1, '2025-06-07 00:02:11.527235', '5342625262', 'HYTR'),
(6, 'pbkdf2_sha256$600000$XtC6ss2pANbBdr6mEMgKff$iGwmpE4Ynu6DsXj4CSm+beFxqcmxY7OcWarXFC4gBKw=', '2025-06-08 23:08:11.661534', 0, 'djan', 'KOUASSI', 'JOHN', 'cyrilleado@gmail.com', 0, 1, '2025-06-08 23:08:11.126856', '53426252', 'poy'),
(7, 'pbkdf2_sha256$600000$S67Pyx5nmcpUf36I8ZgBTB$eqZZzd/G8Jrp+TPZBfeDy1f1Ulz97uOJ5R5Yofa4v8A=', '2025-06-12 18:55:48.339535', 0, 'hasar', '', '', 'cyrieadou4@gmail.com', 0, 1, '2025-06-12 18:55:47.794583', '0768543212', 'Abidjan, Yopougon'),
(8, 'pbkdf2_sha256$600000$K2oAt9EUomh7LsXqVqUwht$Gor0bm2A0QIYWiYT5Yjr5u3bGJ6Azt/eXvjQSNEsCEo=', '2025-06-12 22:46:49.256432', 0, 'yhap', 'KOUASSI', 'Yapo', 'cyrieyapou3@gmail.com', 0, 1, '2025-06-12 22:46:48.701298', '5342609823', 'Koumassi'),
(9, 'pbkdf2_sha256$600000$ngC3H7HwYhGFdyRFg5hxql$KYIZ/3wXu2MbqFTNpjVWMYV09xz7/F/uByHH6X2V6eo=', '2025-06-12 23:25:32.947459', 0, 'Hermo', 'ADOU', 'Hermann', 'cieadu3@gmail.com', 0, 1, '2025-06-12 23:25:32.414325', '0153426252', 'Abobo');

-- --------------------------------------------------------

--
-- Structure de la table `appli_utilisateur_groups`
--

DROP TABLE IF EXISTS `appli_utilisateur_groups`;
CREATE TABLE IF NOT EXISTS `appli_utilisateur_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `utilisateur_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Appli_utilisateur_groups_utilisateur_id_group_id_a2f09637_uniq` (`utilisateur_id`,`group_id`),
  KEY `Appli_utilisateur_groups_utilisateur_id_401e101e` (`utilisateur_id`),
  KEY `Appli_utilisateur_groups_group_id_03ab6d16` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appli_utilisateur_user_permissions`
--

DROP TABLE IF EXISTS `appli_utilisateur_user_permissions`;
CREATE TABLE IF NOT EXISTS `appli_utilisateur_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `utilisateur_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Appli_utilisateur_user_p_utilisateur_id_permissio_ff34766f_uniq` (`utilisateur_id`,`permission_id`),
  KEY `Appli_utilisateur_user_permissions_utilisateur_id_9d4f80f8` (`utilisateur_id`),
  KEY `Appli_utilisateur_user_permissions_permission_id_9f4c255d` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appli_vehicule`
--

DROP TABLE IF EXISTS `appli_vehicule`;
CREATE TABLE IF NOT EXISTS `appli_vehicule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_vehicule` varchar(10) NOT NULL,
  `marque` varchar(100) NOT NULL,
  `modele` varchar(100) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `prix_par_jour` decimal(8,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `immatriculation` (`immatriculation`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_vehicule`
--

INSERT INTO `appli_vehicule` (`id`, `type_vehicule`, `marque`, `modele`, `immatriculation`, `disponible`, `prix_par_jour`, `image`) VALUES
(1, 'luxe', 'Jeeps', 'Renégat', 'AB-1234-CD', 1, '55000.00', 'vehicules/jeep-renegade.jpg'),
(2, 'simple', 'BMW', 'M2', 'AB-1265-CD', 1, '45000.00', 'vehicules/bmw-m5.jpg'),
(3, 'vvip', 'Chevrolet', 'Corvette', 'AB-1534-CD', 1, '45000.00', 'vehicules/chevro.jpg'),
(4, 'vvip', 'Ferrari', 'Enzo', 'AB-1264-CD', 1, '70000.00', 'vehicules/ferrari-enzo.jpg'),
(5, 'vvip', 'Chevrolet', 'Camaro', 'AB-1134-CD', 1, '50000.00', 'vehicules/chevrolet-camaro.jpg'),
(6, 'luxe', 'Range Rover', 'Evoque', 'AB-1255-CD', 1, '55000.00', 'vehicules/range-rover.jpg'),
(7, 'luxe', 'Range Rover', 'Vogue 2024', 'AB-1734-CD', 1, '55000.00', 'vehicules/WhatsApp_Image_2024-02-21_at_15.39.51_0.jpeg'),
(8, 'simple', 'FORD', 'Raptor', 'AB-1554-CD', 0, '40000.00', 'vehicules/ford-raptor.jpg'),
(9, 'luxe', 'Mini Cooper', '2024', 'AB-1654-CD', 1, '30000.00', 'vehicules/mini-cooper.jpg'),
(10, 'simple', 'Hyundai Staria', 'Hybride 1.6 T-GD', 'AB-2234-CD', 1, '45000.00', 'vehicules/hyundai-staria.jpg'),
(11, 'vvip', 'Lexus', 'LC 500 V8 2024', 'AB-1765-CD', 1, '80000.00', 'vehicules/lexus.jpg'),
(12, 'vvip', 'bentley', 'Flying Spur V8', 'AB-1674-CD', 1, '70000.00', 'vehicules/bentley.jpg'),
(13, 'simple', 'toyota', 'RAV', 'AB-1244-CD', 1, '50000.00', 'vehicules/toyota-rav.jpg'),
(14, 'luxe', 'vw', 'polo', 'AB-1277-CD', 1, '40000.00', 'vehicules/vw-polo.jpg'),
(15, 'vvip', 'koenigsegg', 'Regera 2022', 'AB-1335-CD', 1, '80000.00', 'vehicules/koenigsegg.jpg'),
(16, 'vvip', 'Lamborghini', 'Huracán Técnica', 'AB-1444-CD', 1, '70000.00', 'vehicules/Lamborghini3.jpg'),
(17, 'vvip', 'Maserati', 'MC20 coupé', 'AB-1222-CD', 1, '200000.00', 'vehicules/merveille.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `appli_ville`
--

DROP TABLE IF EXISTS `appli_ville`;
CREATE TABLE IF NOT EXISTS `appli_ville` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appli_ville`
--

INSERT INTO `appli_ville` (`id`, `titre`) VALUES
(1, 'Abobo'),
(2, 'Adjamé'),
(3, 'Attécoubé'),
(4, 'Bonoua'),
(5, 'Bassam'),
(6, 'Bouake'),
(7, 'Cocody'),
(8, 'Anyama'),
(9, 'Marcory'),
(10, 'Plateau'),
(11, 'Alepé'),
(12, 'Aboisso'),
(13, 'Agboville'),
(14, 'Dabou'),
(15, 'Koumassi'),
(16, 'Yopougon'),
(17, 'Songon'),
(18, 'Adiaké'),
(19, 'Port-bouët'),
(20, 'Treichville');

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add vehicule', 6, 'add_vehicule'),
(22, 'Can change vehicule', 6, 'change_vehicule'),
(23, 'Can delete vehicule', 6, 'delete_vehicule'),
(24, 'Can view vehicule', 6, 'view_vehicule'),
(25, 'Can add user', 7, 'add_utilisateur'),
(26, 'Can change user', 7, 'change_utilisateur'),
(27, 'Can delete user', 7, 'delete_utilisateur'),
(28, 'Can view user', 7, 'view_utilisateur'),
(29, 'Can add reservation', 8, 'add_reservation'),
(30, 'Can change reservation', 8, 'change_reservation'),
(31, 'Can delete reservation', 8, 'delete_reservation'),
(32, 'Can view reservation', 8, 'view_reservation'),
(33, 'Can add base', 9, 'add_base'),
(34, 'Can change base', 9, 'change_base'),
(35, 'Can delete base', 9, 'delete_base'),
(36, 'Can view base', 9, 'view_base'),
(37, 'Can add accueilparti1', 10, 'add_accueilparti1'),
(38, 'Can change accueilparti1', 10, 'change_accueilparti1'),
(39, 'Can delete accueilparti1', 10, 'delete_accueilparti1'),
(40, 'Can view accueilparti1', 10, 'view_accueilparti1'),
(41, 'Can add fond', 11, 'add_fond'),
(42, 'Can change fond', 11, 'change_fond'),
(43, 'Can delete fond', 11, 'delete_fond'),
(44, 'Can view fond', 11, 'view_fond'),
(45, 'Can add choix', 12, 'add_choix'),
(46, 'Can change choix', 12, 'change_choix'),
(47, 'Can delete choix', 12, 'delete_choix'),
(48, 'Can view choix', 12, 'view_choix'),
(49, 'Can add defile', 13, 'add_defile'),
(50, 'Can change defile', 13, 'change_defile'),
(51, 'Can delete defile', 13, 'delete_defile'),
(52, 'Can view defile', 13, 'view_defile'),
(53, 'Can add choix2', 14, 'add_choix2'),
(54, 'Can change choix2', 14, 'change_choix2'),
(55, 'Can delete choix2', 14, 'delete_choix2'),
(56, 'Can view choix2', 14, 'view_choix2'),
(57, 'Can add actu', 15, 'add_actu'),
(58, 'Can change actu', 15, 'change_actu'),
(59, 'Can delete actu', 15, 'delete_actu'),
(60, 'Can view actu', 15, 'view_actu'),
(61, 'Can add question', 16, 'add_question'),
(62, 'Can change question', 16, 'change_question'),
(63, 'Can delete question', 16, 'delete_question'),
(64, 'Can view question', 16, 'view_question'),
(65, 'Can add impression', 17, 'add_impression'),
(66, 'Can change impression', 17, 'change_impression'),
(67, 'Can delete impression', 17, 'delete_impression'),
(68, 'Can view impression', 17, 'view_impression'),
(69, 'Can add caracteristique technique', 18, 'add_caracteristiquetechnique'),
(70, 'Can change caracteristique technique', 18, 'change_caracteristiquetechnique'),
(71, 'Can delete caracteristique technique', 18, 'delete_caracteristiquetechnique'),
(72, 'Can view caracteristique technique', 18, 'view_caracteristiquetechnique'),
(73, 'Can add ville', 19, 'add_ville'),
(74, 'Can change ville', 19, 'change_ville'),
(75, 'Can delete ville', 19, 'delete_ville'),
(76, 'Can view ville', 19, 'view_ville'),
(77, 'Can add direction', 20, 'add_direction'),
(78, 'Can change direction', 20, 'change_direction'),
(79, 'Can delete direction', 20, 'delete_direction'),
(80, 'Can view direction', 20, 'view_direction'),
(81, 'Can add publicite', 21, 'add_publicite'),
(82, 'Can change publicite', 21, 'change_publicite'),
(83, 'Can delete publicite', 21, 'delete_publicite'),
(84, 'Can view publicite', 21, 'view_publicite');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-06-10 17:33:38.511849', '1', 'adouauto@gmail.com - Abidjan-Yopougon', 1, '[{\"added\": {}}]', 9, 1),
(2, '2025-06-10 17:45:48.617813', '1', 'adouauto@gmail.com - Abidjan-Yopougon', 2, '[{\"changed\": {\"fields\": [\"Numero\", \"Imagelogo\"]}}]', 9, 1),
(3, '2025-06-10 17:54:26.244746', '1', 'adouauto@gmail.com - Abidjan-Yopougon', 2, '[{\"changed\": {\"fields\": [\"Imagelogo\"]}}]', 9, 1),
(4, '2025-06-10 23:37:54.763527', '1', 'Choisissez un véhicule', 1, '[{\"added\": {}}]', 10, 1),
(5, '2025-06-10 23:40:01.240358', '2', 'Choisissez le lieu & la date', 1, '[{\"added\": {}}]', 10, 1),
(6, '2025-06-10 23:41:38.097151', '3', 'Faire une réservation', 1, '[{\"added\": {}}]', 10, 1),
(7, '2025-06-10 23:43:37.434278', '4', 'Asseyez-vous & détendez-vous', 1, '[{\"added\": {}}]', 10, 1),
(8, '2025-06-10 23:46:10.360401', '1', 'fond', 1, '[{\"added\": {}}]', 11, 1),
(9, '2025-06-11 01:07:38.670461', '5', 'Securité', 1, '[{\"added\": {}}]', 10, 1),
(10, '2025-06-11 01:42:16.671288', '1', 'vehicule exotique', 1, '[{\"added\": {}}]', 13, 1),
(11, '2025-06-11 01:44:08.516143', '2', 'Sedan', 1, '[{\"added\": {}}]', 13, 1),
(12, '2025-06-11 01:45:29.052950', '3', 'véhicule  coupé', 1, '[{\"added\": {}}]', 13, 1),
(13, '2025-06-11 01:46:20.947076', '4', 'Cabriolet', 1, '[{\"added\": {}}]', 13, 1),
(14, '2025-06-11 01:47:34.593502', '5', 'voiture hayon', 1, '[{\"added\": {}}]', 13, 1),
(15, '2025-06-11 01:47:57.736907', '6', 'Vehicule de luxe', 1, '[{\"added\": {}}]', 13, 1),
(16, '2025-06-11 01:49:41.750772', '7', 'Véhicules vus', 1, '[{\"added\": {}}]', 13, 1),
(17, '2025-06-11 02:05:45.274089', '1', 'Prestations de première classe', 1, '[{\"added\": {}}]', 12, 1),
(18, '2025-06-11 02:07:33.451870', '2', 'Assistance routière 24h/24 et 7j/7', 1, '[{\"added\": {}}]', 12, 1),
(19, '2025-06-11 18:22:50.855640', '1', 'Jeeps Renegade - AB-1234-CD', 1, '[{\"added\": {}}]', 6, 1),
(20, '2025-06-11 23:02:55.490296', '2', 'BMW M2 - AB-1265-CD', 1, '[{\"added\": {}}]', 6, 1),
(21, '2025-06-11 23:07:45.736837', '3', 'Chevrolet Corvette - AB-1534-CD', 1, '[{\"added\": {}}]', 6, 1),
(22, '2025-06-11 23:35:35.294070', '4', 'Ferrari Enzo - AB-1264-CD', 1, '[{\"added\": {}}]', 6, 1),
(23, '2025-06-11 23:37:00.491430', '5', 'Chevrolet Camaro - AB-1134-CD', 1, '[{\"added\": {}}]', 6, 1),
(24, '2025-06-11 23:42:49.993506', '6', 'Range Rover Evoque - AB-1255-CD', 1, '[{\"added\": {}}]', 6, 1),
(25, '2025-06-11 23:49:23.484708', '7', 'Range Rover Vogue 2024 - AB-1734-CD', 1, '[{\"added\": {}}]', 6, 1),
(26, '2025-06-11 23:51:15.691274', '8', 'FORD Raptor - AB-1554-CD', 1, '[{\"added\": {}}]', 6, 1),
(27, '2025-06-13 16:50:24.111164', '3', 'La qualité à moindre coût', 1, '[{\"added\": {}}]', 12, 1),
(28, '2025-06-13 16:51:27.214336', '4', 'Prise en charge et retour gratuits', 1, '[{\"added\": {}}]', 12, 1),
(29, '2025-06-13 17:27:20.485030', '1', 'Prestations de première classe', 1, '[{\"added\": {}}]', 14, 1),
(30, '2025-06-13 17:27:37.952686', '1', 'Prestations de première classe', 3, '', 12, 1),
(31, '2025-06-13 17:28:50.936781', '2', 'Prise en charge et retour gratuits', 1, '[{\"added\": {}}]', 14, 1),
(32, '2025-06-13 17:29:05.152958', '4', 'Prise en charge et retour gratuits', 3, '', 12, 1),
(33, '2025-06-14 00:06:22.929711', '1', 'Comment puis-je démarrer avec la location de voitures ?', 1, '[{\"added\": {}}]', 16, 1),
(34, '2025-06-14 00:08:36.454416', '2', 'Puis-je louer une voiture avec une carte de débit ?', 1, '[{\"added\": {}}]', 16, 1),
(35, '2025-06-14 00:10:46.594729', '3', 'De quel type de location de voiture ai-je besoin ?', 1, '[{\"added\": {}}]', 16, 1),
(36, '2025-06-14 00:12:21.685808', '4', 'Qu\'est-ce qu\'un dépôt de garantie pour une voiture de location', 1, '[{\"added\": {}}]', 16, 1),
(37, '2025-06-14 00:13:52.102333', '5', 'Puis-je annuler ou modifier ma réservation ?', 1, '[{\"added\": {}}]', 16, 1),
(38, '2025-06-14 00:15:31.460054', '6', 'Est-il possible de prolonger ma durée de location ?', 1, '[{\"added\": {}}]', 16, 1),
(39, '2025-06-14 00:22:21.888396', '1', 'John', 1, '[{\"added\": {}}]', 17, 1),
(40, '2025-06-14 00:25:53.715669', '2', 'Hermo', 1, '[{\"added\": {}}]', 17, 1),
(41, '2025-06-14 00:27:52.887984', '3', 'djan', 1, '[{\"added\": {}}]', 17, 1),
(42, '2025-06-14 00:32:15.454013', '1', 'L\'avenir de la location de voitures', 1, '[{\"added\": {}}]', 15, 1),
(43, '2025-06-14 00:36:00.899148', '2', 'Conseils de vacances pour les routards', 1, '[{\"added\": {}}]', 15, 1),
(44, '2025-06-14 00:37:48.028315', '1', 'L\'avenir de la location de voitures', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 15, 1),
(45, '2025-06-14 00:40:12.083964', '3', 'Profitez de la meilleure expérience de voyage', 1, '[{\"added\": {}}]', 15, 1),
(46, '2025-06-14 01:10:29.689858', '1', 'L\'avenir de la location de voitures', 2, '[{\"changed\": {\"fields\": [\"Modal\"]}}]', 15, 1),
(47, '2025-06-14 01:12:34.966572', '2', 'Conseils de vacances pour les routards', 2, '[{\"changed\": {\"fields\": [\"Modal\"]}}]', 15, 1),
(48, '2025-06-14 01:13:25.630358', '3', 'Profitez de la meilleure expérience de voyage', 2, '[{\"changed\": {\"fields\": [\"Modal\"]}}]', 15, 1),
(49, '2025-06-14 15:08:20.131108', '3', 'Profitez de la meilleure expérience de voyage', 2, '[{\"changed\": {\"fields\": [\"Modal\"]}}]', 15, 1),
(50, '2025-06-14 15:09:07.208393', '2', 'Conseils de vacances pour les routards', 2, '[{\"changed\": {\"fields\": [\"Modal\"]}}]', 15, 1),
(51, '2025-06-14 15:09:52.210833', '1', 'L\'avenir de la location de voitures', 2, '[{\"changed\": {\"fields\": [\"Modal\"]}}]', 15, 1),
(52, '2025-06-14 15:44:59.148219', '8', 'FORD Raptor - AB-1554-CD', 2, '[{\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de FORD Raptor - AB-1554-CD\"}}]', 6, 1),
(53, '2025-06-14 15:49:53.886600', '7', 'Range Rover Vogue 2024 - AB-1734-CD', 2, '[{\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Range Rover Vogue 2024 - AB-1734-CD\"}}]', 6, 1),
(54, '2025-06-14 15:51:02.113513', '6', 'Range Rover Evoque - AB-1255-CD', 2, '[{\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Range Rover Evoque - AB-1255-CD\"}}]', 6, 1),
(55, '2025-06-14 15:58:56.129881', '5', 'Chevrolet Camaro - AB-1134-CD', 2, '[{\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Chevrolet Camaro - AB-1134-CD\"}}]', 6, 1),
(56, '2025-06-14 16:02:48.270431', '4', 'Ferrari Enzo - AB-1264-CD', 2, '[{\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Ferrari Enzo - AB-1264-CD\"}}]', 6, 1),
(57, '2025-06-14 16:06:28.503481', '3', 'Chevrolet Corvette - AB-1534-CD', 2, '[{\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Chevrolet Corvette - AB-1534-CD\"}}]', 6, 1),
(58, '2025-06-14 16:07:55.523718', '2', 'BMW M2 - AB-1265-CD', 2, '[{\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de BMW M2 - AB-1265-CD\"}}]', 6, 1),
(59, '2025-06-14 16:12:18.700538', '1', 'Jeeps Renégat - AB-1234-CD', 2, '[{\"changed\": {\"fields\": [\"Modele\"]}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Jeeps Ren\\u00e9gat - AB-1234-CD\"}}]', 6, 1),
(60, '2025-06-14 16:21:19.912806', '9', 'Mini Cooper 2024 - AB-1654-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Mini Cooper 2024 - AB-1654-CD\"}}]', 6, 1),
(61, '2025-06-14 16:26:50.450041', '10', 'Hyundai Staria Hybride 1.6 T-GD - AB-2234-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Hyundai Staria Hybride 1.6 T-GD - AB-2234-CD\"}}]', 6, 1),
(62, '2025-06-14 16:31:39.359890', '11', 'Lexus LC 500 V8 2024 - AB-1765-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Lexus LC 500 V8 2024 - AB-1765-CD\"}}]', 6, 1),
(63, '2025-06-14 16:35:41.093027', '12', 'bentley Flying Spur V8 - AB-1674-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de bentley Flying Spur V8 - AB-1674-CD\"}}]', 6, 1),
(64, '2025-06-14 16:39:23.960479', '13', 'toyota RAV - AB-1244-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de toyota RAV - AB-1244-CD\"}}]', 6, 1),
(65, '2025-06-14 16:43:10.518246', '14', 'vw polo - AB-1277-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de vw polo - AB-1277-CD\"}}]', 6, 1),
(66, '2025-06-14 16:50:11.778874', '15', 'koenigsegg Regera 2022 - AB-1335-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de koenigsegg Regera 2022 - AB-1335-CD\"}}]', 6, 1),
(67, '2025-06-14 16:55:34.053597', '16', 'Lamborghini Huracán Técnica - AB-1444-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Lamborghini Hurac\\u00e1n T\\u00e9cnica - AB-1444-CD\"}}]', 6, 1),
(68, '2025-06-14 17:05:34.354391', '17', 'Maserati MC20 coupé - AB-1222-CD', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"caracteristique technique\", \"object\": \"Caract. techniques de Maserati MC20 coup\\u00e9 - AB-1222-CD\"}}]', 6, 1),
(69, '2025-06-15 18:18:40.396243', '1', 'Abidjan', 1, '[{\"added\": {}}]', 19, 1),
(70, '2025-06-15 18:19:04.814399', '1', 'Abobo', 2, '[{\"changed\": {\"fields\": [\"Titre\"]}}]', 19, 1),
(71, '2025-06-15 18:19:22.844065', '2', 'Adjamé', 1, '[{\"added\": {}}]', 19, 1),
(72, '2025-06-15 18:19:52.907442', '3', 'Attécoubé', 1, '[{\"added\": {}}]', 19, 1),
(73, '2025-06-15 18:20:10.670402', '4', 'Bonoua', 1, '[{\"added\": {}}]', 19, 1),
(74, '2025-06-15 18:20:20.442031', '5', 'Bassam', 1, '[{\"added\": {}}]', 19, 1),
(75, '2025-06-15 18:20:49.176295', '6', 'Bouake', 1, '[{\"added\": {}}]', 19, 1),
(76, '2025-06-15 18:21:11.432075', '7', 'Cocody', 1, '[{\"added\": {}}]', 19, 1),
(77, '2025-06-15 18:21:26.544016', '8', 'Anyama', 1, '[{\"added\": {}}]', 19, 1),
(78, '2025-06-15 18:21:45.632540', '9', 'Marcory', 1, '[{\"added\": {}}]', 19, 1),
(79, '2025-06-15 18:21:57.262653', '10', 'Plateau', 1, '[{\"added\": {}}]', 19, 1),
(80, '2025-06-15 18:22:18.832281', '11', 'Alepé', 1, '[{\"added\": {}}]', 19, 1),
(81, '2025-06-15 18:22:31.340224', '12', 'Aboisso', 1, '[{\"added\": {}}]', 19, 1),
(82, '2025-06-15 18:22:41.269011', '13', 'Agboville', 1, '[{\"added\": {}}]', 19, 1),
(83, '2025-06-15 18:23:05.558598', '14', 'Dabou', 1, '[{\"added\": {}}]', 19, 1),
(84, '2025-06-15 18:23:23.928074', '15', 'Koumassi', 1, '[{\"added\": {}}]', 19, 1),
(85, '2025-06-15 18:23:32.723083', '16', 'Yopougon', 1, '[{\"added\": {}}]', 19, 1),
(86, '2025-06-15 18:23:39.629799', '17', 'Songon', 1, '[{\"added\": {}}]', 19, 1),
(87, '2025-06-15 18:23:56.218115', '18', 'Adiaké', 1, '[{\"added\": {}}]', 19, 1),
(88, '2025-06-15 18:24:21.529773', '19', 'Port-bouët', 1, '[{\"added\": {}}]', 19, 1),
(89, '2025-06-15 18:24:42.379497', '20', 'Treichville', 1, '[{\"added\": {}}]', 19, 1),
(90, '2025-06-15 23:28:55.191626', '3', 'Réservation #3 - John (2025-06-15 au 2025-06-21)', 2, '[{\"changed\": {\"fields\": [\"Statut\"]}}]', 8, 1),
(91, '2025-06-15 23:47:55.775088', '1', 'Nous proposons à nos clients une large gamme de voitures commerciales et de voitures de luxe pour to', 1, '[{\"added\": {}}]', 21, 1),
(92, '2025-06-16 00:06:55.326800', '1', 'Nous proposons à nos clients une large gamme de voitures commerciales et de voitures de luxe .', 2, '[{\"changed\": {\"fields\": [\"Titre\"]}}]', 21, 1),
(93, '2025-06-16 00:20:20.170469', '1', 'Nous proposons à nos clients une large gamme de voitures commerciales et de voitures de luxe  pour toutes les occasions', 2, '[{\"changed\": {\"fields\": [\"Titre\"]}}]', 21, 1),
(94, '2025-06-16 00:44:34.049056', '1', 'ADOPO', 1, '[{\"added\": {}}]', 20, 1),
(95, '2025-06-16 00:45:41.164134', '2', 'KONE', 1, '[{\"added\": {}}]', 20, 1),
(96, '2025-06-16 00:47:13.972874', '3', 'AKA', 1, '[{\"added\": {}}]', 20, 1),
(97, '2025-06-16 00:50:01.210555', '4', 'SEKONGO', 1, '[{\"added\": {}}]', 20, 1),
(98, '2025-06-16 00:51:01.929471', '5', 'KOUASSI', 1, '[{\"added\": {}}]', 20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'Appli', 'vehicule'),
(7, 'Appli', 'utilisateur'),
(8, 'Appli', 'reservation'),
(9, 'Appli', 'base'),
(10, 'Appli', 'accueilparti1'),
(11, 'Appli', 'fond'),
(12, 'Appli', 'choix'),
(13, 'Appli', 'defile'),
(14, 'Appli', 'choix2'),
(15, 'Appli', 'actu'),
(16, 'Appli', 'question'),
(17, 'Appli', 'impression'),
(18, 'Appli', 'caracteristiquetechnique'),
(19, 'Appli', 'ville'),
(20, 'Appli', 'direction'),
(21, 'Appli', 'publicite');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-02 10:03:23.843571'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-06-02 10:03:23.921709'),
(3, 'auth', '0001_initial', '2025-06-02 10:03:24.220045'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-06-02 10:03:24.267337'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-06-02 10:03:24.267337'),
(6, 'auth', '0004_alter_user_username_opts', '2025-06-02 10:03:24.283002'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-06-02 10:03:24.283002'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-06-02 10:03:24.298588'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-06-02 10:03:24.314249'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-06-02 10:03:24.314249'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-06-02 10:03:24.329843'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-06-02 10:03:24.361564'),
(13, 'auth', '0011_update_proxy_permissions', '2025-06-02 10:03:24.377181'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-06-02 10:03:24.377181'),
(15, 'Appli', '0001_initial', '2025-06-02 10:03:24.891103'),
(16, 'admin', '0001_initial', '2025-06-02 10:03:25.079633'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-06-02 10:03:25.079633'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-02 10:03:25.095213'),
(19, 'sessions', '0001_initial', '2025-06-02 10:03:25.142577'),
(20, 'Appli', '0002_base', '2025-06-10 16:45:58.570877'),
(21, 'Appli', '0003_accueilparti1_fond', '2025-06-10 23:22:21.817984'),
(22, 'Appli', '0004_choix_defile', '2025-06-11 01:27:20.205544'),
(23, 'Appli', '0005_remove_choix_imagelogo', '2025-06-11 02:02:23.134966'),
(24, 'Appli', '0006_alter_vehicule_disponible', '2025-06-11 23:00:35.789887'),
(25, 'Appli', '0007_choix2', '2025-06-13 17:11:57.795457'),
(26, 'Appli', '0008_actu_question_impression', '2025-06-13 23:38:54.232681'),
(27, 'Appli', '0009_actu_modal_caracteristiquetechnique', '2025-06-14 15:05:59.468217'),
(28, 'Appli', '0010_reservation_destiation_reservation_lieu_prise', '2025-06-14 23:55:31.373276'),
(29, 'Appli', '0011_rename_destiation_reservation_destination', '2025-06-15 00:05:43.288003'),
(30, 'Appli', '0012_alter_reservation_options_reservation_assurance_and_more', '2025-06-15 00:45:13.983484'),
(31, 'Appli', '0013_ville', '2025-06-15 10:08:55.692591'),
(32, 'Appli', '0014_remove_reservation_assurance_and_more', '2025-06-15 18:03:46.936572'),
(33, 'Appli', '0015_direction', '2025-06-15 19:11:04.107990'),
(34, 'Appli', '0016_publicite', '2025-06-15 23:36:28.303350'),
(35, 'Appli', '0017_publicite_photo', '2025-06-15 23:42:46.147122'),
(36, 'Appli', '0018_alter_publicite_titre_alter_reservation_date_debut', '2025-06-16 00:18:00.056799');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('j74mark02ggmt0qpn5sho7t0ffc33t8o', '.eJxVjEEOgjAQRe_StWnKdNqCS_eegUxnBkENTSisjHdXEha6_e-9_zI9bevYb1WXfhJzNsGcfrdM_NB5B3Kn-VYsl3ldpmx3xR602msRfV4O9-9gpDp-6xaHVkOKQ8QQOKbcQSOEIpEcJHXkfECB1HlIERkTM6tvQEFAshvM-wPR3zek:1uR0CY:yY6Zp1LDyFFiJv148NzjlHPbK9UWDXxjLWdmMAV1lv8', '2025-06-30 03:08:02.356505');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
