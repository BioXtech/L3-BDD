# Base De Données 2 - Rapport projet

*Jamoteau Vincent - Kortsmit Simon - Porro Guillaume*
*Licence Informatique - L3 - 2021-2022*
*UFR SFA - Université de Poitiers*

## Introduction
Ce projet s'inscrit dans la matière Base de données 2. L'objectif de ce projet est de concevoir une base de donneés pour une plateforme de VOD en ligne. Ce projet se divise en douze livrables.

## Livrable 1
Pour notre schéma MCD, nous avons commencé par définir les grandes parties de la base de donnée. Nous avons donc deux parties distinctes:
- La partie contenu de la plateforme VOD
- La partie relative aux utilisateurs/client de la plateforme VOD

La partie relative aux contenus est divisée selon les quatre types possible de contenu que distribue la plateforme:
- Les films (Table Movie)
- Les séries (Table Series)
- Les dessins animés (Table Youth)
- Les divertissements (Table Shows) 

Chacune de ces parties est reliée aux tables qui lui sont propre selon la définition des attributs du contenu (Exemple: un compositeur et un scénariste pour un dessin animé).
Tous ces contenus sont reliés par une table centrale (Content) qui stocke tous les éléments communs entre les quatre types de contenu.
On retrouve également une table pour gérer la classification selon l'age du public  des contenus.

La partie relative aux utilisateurs se compose d'une table pour stocker les utilisateurs (Customer), d'une table pour les abonnement (Subscription type), d'un éventuel abonnement par un utilisateur (Subscription). On y retrouve aussi des tables pour gérer les achats et locations des utilisateurs (Renting et Purchase).

## Livrable 2
Le script de création des tables traduit notre schéma MCD en SQL.

## Livrable 3
Les deux correction utilisent un `UPDATE` pour s'effectuer.

La première déplace le contenu de la colonne `RATING` vers la colonne `DURATION` si le contenu dans `RATING` n'est pas une des valeurs possibles pour la classification des contenu aux États-Unis.

La deuxième retire l'éventuelle virgule en début de ligne de la colonne `COUNTRY`.

## Livrable 4

