Cours complet “Développer pour Nemo” en un seul fichier .rst, structuré comme un vrai manuel professionnel, exhaustif, pédagogique, et directement intégré dans le dossier docs/.
Formaté en ReStructuredText, et couvre :

- architecture interne  
- actions Nemo  
- scripting Bash / Python  
- plugins C / Python  
- API  
- bonnes pratiques  
- packaging  
- debugging  
- tests  
- intégration dans Cinnamon  

Tu peux le placer ici :

`
docs/cours.rst
`

📘 cours.rst — Cours complet “Développer pour Nemo”

`rst
===========================================================
Développer pour Nemo — Cours complet (Linux Mint Cinnamon)
===========================================================

Introduction
============

Nemo est le gestionnaire de fichiers officiel de Linux Mint Cinnamon.
Il est basé sur Nautilus 3.4 mais a évolué indépendamment pour offrir :

- une interface plus complète
- un système d’extensions puissant
- un support natif des actions personnalisées
- une intégration profonde avec Cinnamon
- une architecture modulaire

Ce cours fournit une formation complète pour développer :

- des actions Nemo (.nemo_action)
- des scripts associés (Bash, Python, etc.)
- des plugins Python
- des plugins C
- des modules externes
- des intégrations avancées

Il s’adresse aux développeurs souhaitant étendre Nemo de manière propre,
professionnelle et maintenable.


==========================
1. Architecture de Nemo
==========================

Composants principaux
---------------------

Nemo est structuré autour de plusieurs modules internes :

- NemoWindow : fenêtre principale
- NemoView : affichage des fichiers (icônes, liste, compact)
- NemoActionManager : gestion des actions personnalisées
- NemoExtensions : système de plugins
- NemoFileOperations : opérations sur les fichiers
- NemoSidebar : panneau latéral
- NemoToolbar : barre d’outils

Technologies utilisées
----------------------

- Langage : C
- Interface : GTK3
- Backend fichiers : GIO / GVFS
- Extensions : Python, C, Actions Nemo
- Intégration : Cinnamon Desktop


=========================================
2. Actions Nemo (.nemo_action + scripts)
=========================================

Les actions Nemo sont le moyen le plus simple d’étendre Nemo.

Structure d’un fichier .nemo_action
-----------------------------------

::

    [Nemo Action]
    Name=Convertir en PDF
    Comment=Convertit un document en PDF
    Exec=convert-to-pdf.sh %F
    Icon=document-save
    Selection=Any
    Extensions=txt;doc;docx;

Champs obligatoires
-------------------

- Name : nom affiché dans le menu
- Comment : description
- Exec : script exécuté
- Icon : icône GTK
- Selection : type de sélection
- Extensions : extensions supportées

Variables disponibles
---------------------

- %F : fichiers sélectionnés
- %N : noms des fichiers
- %P : dossier courant
- %U : URI

Emplacements
------------

- Système : /usr/share/nemo/actions/
- Utilisateur : ~/.local/share/nemo/actions/


===========================
3. Développer des scripts
===========================

Scripts Bash
------------

Bonnes pratiques :

- toujours utiliser #!/usr/bin/env bash
- activer la sécurité : set -e
- gérer les espaces : "$variable"
- tester avec bash -n script.sh

Exemple :

::

    #!/usr/bin/env bash
    set -e
    for file in "$@"; do
        echo "Traitement : $file"
    done

Scripts Python
--------------

::

    #!/usr/bin/env python3
    import sys
    for f in sys.argv[1:]:
        print("Fichier :", f)


===============================
4. Plugins Python pour Nemo
===============================

Nemo supporte les plugins Python via gi.repository.

Exemple minimal
---------------

::

    from gi.repository import Nemo, Gtk

    class ExampleExtension(Nemo.MenuProvider):
        def init(self):
            pass

        def getfileitems(self, window, files):
            item = Nemo.MenuItem(
                name="ExampleExtension::Hello",
                label="Dire Bonjour",
                tip="Affiche un message"
            )
            item.connect('activate', self.run)
            return [item]

        def run(self, menu, files):
            print("Bonjour depuis Nemo !")

Installation
------------

Placer le fichier dans :

/usr/share/nemo-python/extensions/


=============================
5. Plugins C pour Nemo
=============================

Les plugins C offrent les meilleures performances.

Structure minimale
------------------

::

    #include <nemo-extension.h>

    void nemomoduleinitialize(GTypeModule *module) {
        / Initialisation /
    }

Compilation
-----------

::

    gcc -shared -fPIC plugin.c -o plugin.so \
        pkg-config --cflags --libs nemo-extension-3.0


===========================================
6. API Nemo (Python / C / Actions)
===========================================

API Python
----------

- Nemo.MenuProvider
- Nemo.PropertyPageProvider
- Nemo.LocationWidgetProvider

API C
-----

- NemoExtension
- NemoMenuProvider
- NemoPropertyPageProvider

API Actions
-----------

- Variables : %F, %N, %P, %U
- Exec : script externe
- Extensions : filtrage


===========================================
7. Débogage et outils de développement
===========================================

Redémarrer Nemo
---------------

::

    nemo -q

Logs
----

::

    journalctl -f | grep nemo

Tracer Nemo
-----------

::

    strace nemo


===============================
8. Packaging et distribution
===============================

Packaging .deb
--------------

Structure :

::

    DEBIAN/control
    usr/share/nemo/actions/
    usr/share/nemo/scripts/

Construction :

::

    dpkg-deb --build packaging/deb nemo-project.deb


===========================
9. Tests et validation
===========================

Tests unitaires
---------------

- validation syntaxique des actions
- tests des scripts
- sandbox

Tests d’intégration
-------------------

::

    ./tests/integration_test.sh


===========================
10. Bonnes pratiques
===========================

- utiliser des scripts robustes
- éviter les chemins absolus
- documenter chaque action
- tester sous Cinnamon
- éviter les scripts lourds
- privilégier Python ou C pour les plugins complexes


===========================
Conclusion
===========================

Vous disposez maintenant d’un cours complet pour développer :

- actions Nemo
- scripts
- plugins Python
- plugins C
- modules externes
- intégrations avancées

Nemo est un gestionnaire puissant, modulaire et extensible.
Ce cours vous permet de créer des extensions professionnelles,
maintenables et performantes.
`

---

🟦 Ton cours complet .rst est prêt.
