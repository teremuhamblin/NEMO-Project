name: 🛠️ Improvement
description: Amélioration d’un élément existant (action, script, config, docs)
title: "[IMPROVEMENT] "
labels: ["enhancement"]
assignees: [teremuhamblin]

---

## 🔧 Élément à améliorer
Décris ce qui doit être optimisé.

Exemple (pré-rempli) :
Optimiser le script `scripts/compress-folder.sh` pour gérer les noms de fichiers contenant des espaces.

## 📌 État actuel
Explique le comportement actuel.

Exemple :
- Le script fonctionne mais échoue sur certains chemins
- Pas de gestion des erreurs
- Pas de message utilisateur clair

## 🚀 Amélioration proposée
Décris la modification souhaitée.

Exemple :
- Ajouter des guillemets autour des variables
- Ajouter un test de présence du dossier
- Ajouter un message de confirmation

## 📎 Impact
- Action concernée : `compress-folder.nemo_action`  
- Script concerné : `scripts/compress-folder.sh`  
- Documentation : oui (docs/actions.md)  

## ✔️ Critères d’acceptation
- [x] Amélioration implémentée
- [x] Tests validés
- [x] Documentation mise à jour
