-- phpMyAdmin SQL Dump
-- version 4.4.7
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 18 Mars 2018 à 01:17
-- Version du serveur :  5.5.59
-- Version de PHP :  5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `inspectbox`
--

-- --------------------------------------------------------

--
-- Structure de la table `choix`
--

CREATE TABLE IF NOT EXISTS `choix` (
  `IdChoix` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `IdTypeReponse` int(11) NOT NULL,
  `Valeur` varchar(255) NOT NULL,
  `NonConforme` tinyint(1) NOT NULL,
  `Tri` int(11) NOT NULL,
  `Masque` tinyint(1) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `IdClient` int(11) NOT NULL,
  `Nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CodeAcces` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ClefClient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NombreNiveaux` int(11) NOT NULL,
  `NombreNiveauxObjets` int(11) NOT NULL,
  `Masque` tinyint(1) NOT NULL,
  `NombrePhoto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cloture`
--

CREATE TABLE IF NOT EXISTS `cloture` (
  `idField` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `idTerminal` varchar(40) NOT NULL,
  `idNiveau` int(11) NOT NULL,
  `statutCloture` int(11) NOT NULL,
  `dateCloture` datetime DEFAULT NULL,
  `debDateCloture` datetime DEFAULT NULL,
  `userCloture` int(11) NOT NULL,
  `dayCloture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `codebarretmp`
--

CREATE TABLE IF NOT EXISTS `codebarretmp` (
  `IdCodeBarreTmp` int(11) NOT NULL,
  `IdImpression` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Date` datetime NOT NULL,
  `CodeBarre` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Libelle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Ariane` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvcount`
--

CREATE TABLE IF NOT EXISTS `csvcount` (
  `idClient` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `droitutilisateur`
--

CREATE TABLE IF NOT EXISTS `droitutilisateur` (
  `IdDroitUtilisateur` int(11) NOT NULL,
  `Nom` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `AdminClient` tinyint(1) NOT NULL,
  `Consultation` tinyint(1) NOT NULL,
  `Terminal` tinyint(1) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gammes`
--

CREATE TABLE IF NOT EXISTS `gammes` (
  `idgammes` int(11) NOT NULL,
  `IdClient` int(11) DEFAULT NULL,
  `Libelle` varchar(255) NOT NULL,
  `Masque` bit(1) NOT NULL,
  `Tri` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gammesNiveau`
--

CREATE TABLE IF NOT EXISTS `gammesNiveau` (
  `Masque` bit(1) NOT NULL,
  `idNiveau` int(11) NOT NULL,
  `idgammes` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gammesNiveauObjet`
--

CREATE TABLE IF NOT EXISTS `gammesNiveauObjet` (
  `Masque` bit(1) NOT NULL,
  `idNiveauObjet` int(11) NOT NULL,
  `idgammes` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `import`
--

CREATE TABLE IF NOT EXISTS `import` (
  `idImport` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `inspection`
--

CREATE TABLE IF NOT EXISTS `inspection` (
  `IdInspection` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `IdUtilisateur` int(11) NOT NULL,
  `IdNiveau` int(11) NOT NULL,
  `IdNiveauObjet` int(11) DEFAULT NULL,
  `IdTerminal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IdInformation` text COLLATE utf8_unicode_ci NOT NULL,
  `DateInformation` datetime NOT NULL,
  `DateRemise` datetime NOT NULL,
  `IdChoix` int(11) DEFAULT NULL,
  `Reponse` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defekt` tinyint(1) NOT NULL,
  `limite` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `libelleniveau`
--

CREATE TABLE IF NOT EXISTS `libelleniveau` (
  `IdLibelleNiveau` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `TypeNiveau` int(11) NOT NULL,
  `Num` int(11) NOT NULL,
  `Libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `IdNiveau` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `IdTypeReponse` int(11) DEFAULT NULL,
  `Tri` int(11) NOT NULL,
  `Libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AreaTag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CodeBarre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IdNiveauParent` int(11) DEFAULT NULL,
  `IdNiveauObjet` int(11) DEFAULT NULL,
  `Masque` tinyint(1) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveauobjet`
--

CREATE TABLE IF NOT EXISTS `niveauobjet` (
  `IdNiveauObjet` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `IdTypeReponse` int(11) DEFAULT NULL,
  `Tri` int(11) NOT NULL,
  `Libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CodeBarre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IdNiveauObjetParent` int(11) DEFAULT NULL,
  `Masque` tinyint(1) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `existe` bit(1) NOT NULL,
  `unitmeasure` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lowlimit` double DEFAULT NULL,
  `lowborder` double DEFAULT NULL,
  `highborder` double DEFAULT NULL,
  `highborderalert` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lowborderalert` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `highlimit` double DEFAULT NULL,
  `CommentaireAutorise` tinyint(4) DEFAULT NULL,
  `PhotoAutorise` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `objeteam`
--

CREATE TABLE IF NOT EXISTS `objeteam` (
  `idteam` int(11) NOT NULL,
  `idObjet` int(11) NOT NULL,
  `idField` int(11) NOT NULL,
  `masque` tinyint(4) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idClient` int(11) DEFAULT '19',
  `dim` tinyint(1) NOT NULL,
  `jeu` tinyint(1) NOT NULL,
  `lun` tinyint(1) NOT NULL,
  `mar` tinyint(1) NOT NULL,
  `mer` tinyint(1) NOT NULL,
  `sam` tinyint(1) NOT NULL,
  `ven` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statuspi`
--

CREATE TABLE IF NOT EXISTS `statuspi` (
  `idTag` int(11) NOT NULL,
  `AreaTag` varchar(255) DEFAULT NULL,
  `TagName` varchar(250) DEFAULT NULL,
  `tagDescription` varchar(900) DEFAULT NULL,
  `tagUnit` varchar(255) DEFAULT NULL,
  `Value` varchar(50) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `lowLimit` varchar(255) DEFAULT NULL,
  `highLimit` varchar(255) DEFAULT NULL,
  `lowBorder` varchar(255) DEFAULT NULL,
  `highBorder` varchar(255) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `sendTime` datetime NOT NULL,
  `idClient` int(11) NOT NULL,
  `clientName` varchar(255) NOT NULL,
  `idTerminal` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE IF NOT EXISTS `statut` (
  `IdStatus` int(11) NOT NULL,
  `Label` varchar(255) NOT NULL,
  `Masque` bit(1) NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statutInac`
--

CREATE TABLE IF NOT EXISTS `statutInac` (
  `idField` int(11) NOT NULL,
  `idNiveau` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `objet` int(11) NOT NULL,
  `dateinacc` datetime NOT NULL,
  `statutValue` tinyint(4) DEFAULT NULL,
  `idTerminal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `IdTeam` int(11) NOT NULL,
  `BeginHour` varchar(45) NOT NULL,
  `EndHour` varchar(45) NOT NULL,
  `DayOfWork` varchar(45) NOT NULL,
  `IdUser` int(11) NOT NULL,
  `Masque` tinyint(4) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idClient` int(11) NOT NULL DEFAULT '19'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typereponse`
--

CREATE TABLE IF NOT EXISTS `typereponse` (
  `IdTypeReponse` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `Libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ModeReponse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Masque` tinyint(1) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Mode` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `IdUtilisateur` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `IdDroitUtilisateur` int(11) NOT NULL,
  `CodeAcces` varchar(255) CHARACTER SET latin1 NOT NULL,
  `MotDePasse` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Prenom` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Nom` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Masque` tinyint(1) NOT NULL,
  `ClefTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TypeUser` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `choix`
--
ALTER TABLE `choix`
  ADD PRIMARY KEY (`IdChoix`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IdClient`);

--
-- Index pour la table `cloture`
--
ALTER TABLE `cloture`
  ADD PRIMARY KEY (`idField`);

--
-- Index pour la table `codebarretmp`
--
ALTER TABLE `codebarretmp`
  ADD PRIMARY KEY (`IdCodeBarreTmp`);

--
-- Index pour la table `csvcount`
--
ALTER TABLE `csvcount`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `droitutilisateur`
--
ALTER TABLE `droitutilisateur`
  ADD PRIMARY KEY (`IdDroitUtilisateur`);

--
-- Index pour la table `gammes`
--
ALTER TABLE `gammes`
  ADD PRIMARY KEY (`idgammes`),
  ADD UNIQUE KEY `idgammes` (`idgammes`);

--
-- Index pour la table `gammesNiveau`
--
ALTER TABLE `gammesNiveau`
  ADD PRIMARY KEY (`idNiveau`,`idgammes`),
  ADD KEY `FKF1E5D3A613FADB9A` (`idgammes`);

--
-- Index pour la table `gammesNiveauObjet`
--
ALTER TABLE `gammesNiveauObjet`
  ADD PRIMARY KEY (`idNiveauObjet`,`idgammes`),
  ADD UNIQUE KEY `idNiveauObjet` (`idNiveauObjet`),
  ADD UNIQUE KEY `idgammes` (`idgammes`),
  ADD KEY `FKA391EBE013FADB9A` (`idgammes`);

--
-- Index pour la table `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`idImport`),
  ADD UNIQUE KEY `idImport` (`idImport`);

--
-- Index pour la table `inspection`
--
ALTER TABLE `inspection`
  ADD PRIMARY KEY (`IdInspection`),
  ADD KEY `FK_inspection_niveau_IdNiveau` (`IdNiveau`),
  ADD KEY `FK_inspection_choix_IdChoix` (`IdChoix`),
  ADD KEY `FK_inspection_utilisateur_IdUtilisateur` (`IdUtilisateur`),
  ADD KEY `FK_inspection_niveauobjet_IdNiveauObjet` (`IdNiveauObjet`),
  ADD KEY `FK_inspection_client_IdClient` (`IdClient`),
  ADD KEY `FK686B0D74D86C6586` (`IdNiveauObjet`),
  ADD KEY `FK686B0D74E0B10DFC` (`IdUtilisateur`),
  ADD KEY `FK686B0D742CC81E06` (`IdNiveau`),
  ADD KEY `FK686B0D743AAE28` (`IdChoix`),
  ADD KEY `FK686B0D747863EE0` (`IdClient`);

--
-- Index pour la table `libelleniveau`
--
ALTER TABLE `libelleniveau`
  ADD PRIMARY KEY (`IdLibelleNiveau`),
  ADD KEY `FK_libelleniveau_client_IdClient` (`IdClient`),
  ADD KEY `FK2810A8037863EE0` (`IdClient`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`IdNiveau`),
  ADD KEY `FK_niveau_client_IdClient` (`IdClient`),
  ADD KEY `FK_niveau_typereponse_IdTypeReponse` (`IdTypeReponse`),
  ADD KEY `FK_niveau_niveauobjet_IdNiveauObjet` (`IdNiveauObjet`),
  ADD KEY `FK_niveau_niveau_IdNiveauParent` (`IdNiveauParent`),
  ADD KEY `FKC1B3E35ED86C6586` (`IdNiveauObjet`),
  ADD KEY `FKC1B3E35E393EA31E` (`IdTypeReponse`),
  ADD KEY `FKC1B3E35E7863EE0` (`IdClient`),
  ADD KEY `FKC1B3E35EBC2257F0` (`IdNiveauParent`);

--
-- Index pour la table `niveauobjet`
--
ALTER TABLE `niveauobjet`
  ADD PRIMARY KEY (`IdNiveauObjet`,`IdClient`),
  ADD KEY `FK_niveauobjet_typereponse_IdTypeReponse` (`IdTypeReponse`),
  ADD KEY `FK_niveauobjet_client_IdClient` (`IdClient`),
  ADD KEY `FK_niveauobjet_niveauobjet_IdNiveauObjetParent` (`IdNiveauObjetParent`),
  ADD KEY `FK58F3DF4897F10070` (`IdNiveauObjetParent`),
  ADD KEY `FK58F3DF48393EA31E` (`IdTypeReponse`),
  ADD KEY `FK58F3DF487863EE0` (`IdClient`);

--
-- Index pour la table `objeteam`
--
ALTER TABLE `objeteam`
  ADD PRIMARY KEY (`idField`);

--
-- Index pour la table `statuspi`
--
ALTER TABLE `statuspi`
  ADD PRIMARY KEY (`idTag`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`IdStatus`),
  ADD UNIQUE KEY `IdStatus` (`IdStatus`);

--
-- Index pour la table `statutInac`
--
ALTER TABLE `statutInac`
  ADD PRIMARY KEY (`idField`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`IdTeam`);

--
-- Index pour la table `typereponse`
--
ALTER TABLE `typereponse`
  ADD PRIMARY KEY (`IdTypeReponse`) USING BTREE,
  ADD KEY `FK_typereponse_client_IdClient` (`IdClient`),
  ADD KEY `FK95CFE147863EE0` (`IdClient`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`IdUtilisateur`),
  ADD KEY `FK_utilisateur_client_IdClient` (`IdClient`),
  ADD KEY `FK_utilisateur_droitutilisateur_IdDroitUtilisateur` (`IdDroitUtilisateur`),
  ADD KEY `FKDD1633837863EE0` (`IdClient`),
  ADD KEY `FKDD163383AE95ADB8` (`IdDroitUtilisateur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `choix`
--
ALTER TABLE `choix`
  MODIFY `IdChoix` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `IdClient` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `cloture`
--
ALTER TABLE `cloture`
  MODIFY `idField` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `codebarretmp`
--
ALTER TABLE `codebarretmp`
  MODIFY `IdCodeBarreTmp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `droitutilisateur`
--
ALTER TABLE `droitutilisateur`
  MODIFY `IdDroitUtilisateur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `gammes`
--
ALTER TABLE `gammes`
  MODIFY `idgammes` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `import`
--
ALTER TABLE `import`
  MODIFY `idImport` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `inspection`
--
ALTER TABLE `inspection`
  MODIFY `IdInspection` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `libelleniveau`
--
ALTER TABLE `libelleniveau`
  MODIFY `IdLibelleNiveau` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `IdNiveau` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `niveauobjet`
--
ALTER TABLE `niveauobjet`
  MODIFY `IdNiveauObjet` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `objeteam`
--
ALTER TABLE `objeteam`
  MODIFY `idField` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `statuspi`
--
ALTER TABLE `statuspi`
  MODIFY `idTag` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `IdStatus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `statutInac`
--
ALTER TABLE `statutInac`
  MODIFY `idField` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `team`
--
ALTER TABLE `team`
  MODIFY `IdTeam` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typereponse`
--
ALTER TABLE `typereponse`
  MODIFY `IdTypeReponse` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `IdUtilisateur` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
