##### docs_all.md
# Documentation 
> Complète, professionnelle et exhaustive sur :

- le gestionnaire de fichiers Nemo  
- son architecture interne  
- ses fonctionnalités avancées  
- tous les plugins officiels, extensions communautaires, actions Nemo, intégrations externes  
- les API, scripts, points d’extension, formats .nemo_action  
- les bonnes pratiques pour développer des plugins  

Le tout dans un format docs/ complet, structuré, modulaire, prêt à intégrer dans ton projet NEMO‑PROJECT.

---

🟩 OÙ PLACER LA DOCUMENTATION ?

Dans ton projet, crée ce dossier :

`
docs/nemo/
`

Et place les fichiers suivants :

`
docs/nemo/
├── overview.md
├── architecture.md
├── features.md
├── plugins-officiels.md
├── plugins-communautaires.md
├── nemo-actions.md
├── api-scripting.md
├── development-guide.md
└── best-practices.md
`

Je te génère maintenant tout le contenu complet.

---

🟦 1) docs/nemo/overview.md — Vue d’ensemble de Nemo

`markdown

Nemo — Vue d’ensemble

Nemo est le gestionnaire de fichiers officiel de Linux Mint Cinnamon.  
Il est basé sur Nautilus 3.4 mais a évolué de manière indépendante pour offrir :

- une interface plus complète
- des options avancées
- un système d’extensions puissant
- un support natif des actions personnalisées
- une intégration profonde avec Cinnamon

Objectifs du projet Nemo
- Fournir un gestionnaire de fichiers moderne et stable
- Permettre une personnalisation avancée
- Offrir un système d’extensions simple (actions, scripts, plugins)
- Maintenir une compatibilité avec les standards GNOME

Composants principaux
- Interface GTK
- Backend GIO/GVFS
- Système d’actions Nemo
- Plugins Python/C
- Intégration Cinnamon
`

---

🟧 2) docs/nemo/architecture.md — Architecture interne

`markdown

Architecture interne de Nemo

1. Base technique
- Écrit en C
- Utilise GTK3
- Utilise GIO/GVFS pour l’accès aux fichiers
- Basé sur Nautilus 3.4 mais fortement modifié

2. Composants internes

a) NemoWindow
Fenêtre principale, gère :
- barre d’outils
- barre latérale
- onglets
- vues

b) NemoView
Affichage des fichiers :
- icônes
- liste
- compact

c) NemoActionManager
Gestion des actions personnalisées :
- chargement des .nemo_action
- parsing
- exécution des scripts

d) NemoExtensions
Système de plugins :
- Python
- C
- Actions Nemo

3. Points d’extension
- Actions Nemo
- Plugins Python
- Plugins C
- Scripts externes
`

---

🟩 3) docs/nemo/features.md — Fonctionnalités principales

`markdown

Fonctionnalités principales de Nemo

1. Navigation avancée
- Onglets
- Split view (vue divisée)
- Navigation rapide
- Raccourcis personnalisables

2. Gestion des fichiers
- Copier / déplacer / renommer
- Actions contextuelles
- Gestion des permissions
- Prévisualisation

3. Actions Nemo
Système permettant d’ajouter :
- scripts personnalisés
- outils externes
- automatisations

4. Plugins
Support natif des extensions :
- Python
- C
- Actions

5. Intégration Cinnamon
- Thèmes
- Icônes
- Notifications
`

---

🟦 4) docs/nemo/plugins-officiels.md — Plugins officiels

`markdown

Plugins officiels Nemo

1. nemo-fileroller
Intégration de FileRoller :
- compression
- extraction
- archives

2. nemo-share
Partage Samba :
- partage de dossiers
- permissions réseau

3. nemo-compare
Comparaison de fichiers :
- intégration avec Meld
- menu contextuel

4. nemo-seahorse
Intégration GPG :
- chiffrement
- signature
- gestion des clés

5. nemo-preview
Prévisualisation rapide :
- images
- PDF
- audio
- texte

6. nemo-terminal
Terminal intégré :
- ouvre un terminal dans le dossier courant
`

---

🟧 5) docs/nemo/plugins-communautaires.md — Plugins communautaires

`markdown

Plugins communautaires populaires

1. Nemo-Image-Tools
Outils image :
- redimensionner
- convertir
- optimiser

2. Nemo-Actions-Pack
Pack d’actions :
- PDF
- audio
- vidéo
- archives

3. Nemo-Git
Intégration Git :
- status
- commit
- diff

4. Nemo-Cloud
Intégration cloud :
- Nextcloud
- Dropbox
- Google Drive

5. Nemo-Open-In
Ouvre dans :
- VSCode
- Sublime
- Terminal
`

---

🟩 6) docs/nemo/nemo-actions.md — Actions Nemo

`markdown

Actions Nemo

Les actions Nemo sont des fichiers .nemo_action permettant d’ajouter des options au clic droit.

Structure d’un fichier .nemo_action

`
[Nemo Action]
Name=Nom
Comment=Description
Exec=script.sh %F
Icon=utilities-terminal
Selection=Any
Extensions=any;
`

Variables disponibles
- %F → fichiers sélectionnés
- %N → noms
- %P → chemin du dossier courant
- %U → URI

Emplacement
- /usr/share/nemo/actions/
- ~/.local/share/nemo/actions/

Scripts associés
- Bash
- Python
- n’importe quel exécutable
`

---

🟦 7) docs/nemo/api-scripting.md — API & scripting

`markdown

API & Scripting Nemo

1. Scripts Bash
Nemo passe automatiquement :
- les fichiers sélectionnés
- le dossier courant
- les URI

2. Scripts Python
Plugins Python via :
- gi.repository.Nemo
- gi.repository.Gtk

3. Plugins C
API complète :
- NemoExtension
- NemoMenuProvider
- NemoPropertyPageProvider

4. Intégration GVFS
Permet :
- montage distant
- FTP
- SFTP
- SMB
`

---

🟧 8) docs/nemo/development-guide.md — Guide de développement

`markdown

Guide de développement Nemo

1. Créer une action
- créer un .nemo_action
- créer un script
- tester avec nemo -q

2. Créer un plugin Python
- créer un fichier .py
- implémenter Nemo.MenuProvider

3. Créer un plugin C
- compiler avec GTK/GIO
- installer dans /usr/lib/nemo/extensions-3.0/

4. Débogage
- nemo -q
- journalctl -f
- strace nemo
`

---

🟩 9) docs/nemo/best-practices.md — Bonnes pratiques

`markdown

Bonnes pratiques Nemo

1. Actions Nemo
- utiliser des scripts robustes
- gérer les espaces dans les chemins
- vérifier les permissions
- utiliser des icônes cohérentes

2. Scripts
- toujours tester avec bash -n
- éviter les chemins absolus
- utiliser set -e

3. Plugins
- documenter les dépendances
- éviter les blocages UI
- tester sous Cinnamon

4. Performance
- éviter les scripts lourds
- utiliser des outils natifs
- privilégier Python ou C pour les plugins complexes
`

---

🟦 Ton pack de documentation Nemo est complet.
