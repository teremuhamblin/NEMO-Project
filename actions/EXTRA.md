# EXTRA
>Pack complet de 20 actions Nemo, toutes propres, modulaires, professionnelles, avec 20 fichiers .nemo_action + 20 scripts Bash prêts à être intégrés dans ton projet Nemo-cinnamon

🎯 Objectif :  
>Un pack massif, cohérent, robuste, couvrant :  
- compression  
- conversion  
- multimédia  
- réseau  
- sécurité  
- images  
- documents  
- utilitaires système  
- productivité avancée  

>Chaque action est fournie avec :  
- 1 fichier .nemo_action  
- 1 script Bash dans actions/scripts/  
- Style minimaliste, silencieux, compatible Nemo  
- Sans dépendances inutiles  

---

🟩 LISTE DES 20 ACTIONS NEMO

🔹 Compression / Archivage
1. Créer ZIP  
2. Créer TAR.GZ  
3. Extraire archive  
4. Compresser en 7z

🔹 Documents / Conversion
5. Convertir en PDF  
6. Convertir images en WEBP  
7. Convertir audio en MP3  
8. Convertir vidéo en MP4

🔹 Images / Multimédia
9. Optimiser image  
10. Redimensionner image  
11. Convertir image en PNG  
12. Extraire audio d’une vidéo

🔹 Sécurité / Système
13. Suppression sécurisée  
14. Vérifier SHA256  
15. Vérifier GPG  
16. Nettoyer métadonnées EXIF

🔹 Réseau / Utilitaires
17. Envoyer fichier via SCP  
18. Créer checksum MD5  
19. Renommer en masse  
20. Dupliquer fichier/dossier

---

🟦 PACK COMPLET — 20 ACTIONS + SCRIPTS

---

1) Créer ZIP

create-zip.nemo_action
`
[Nemo Action]
Name=Créer ZIP
Comment=Compresse en archive ZIP
Exec=/opt/nemo-project/actions/scripts/create-zip.sh %F
Icon-Name=package-x-generic
Selection=Any
Extensions=any;
Quote=double
`

scripts/create-zip.sh
`

!/bin/bash
TARGET="$1"
zip -r "${TARGET}.zip" "$TARGET"
notify-send "ZIP créé" "$(basename "$TARGET").zip"
`

---

2) Créer TAR.GZ

create-tar.nemo_action
`
[Nemo Action]
Name=Créer TAR.GZ
Comment=Archive en tar.gz
Exec=/opt/nemo-project/actions/scripts/create-tar.sh %F
Icon-Name=package-x-generic
Selection=Any
Extensions=any;
Quote=double
`

scripts/create-tar.sh
`

!/bin/bash
TARGET="$1"
tar -czf "${TARGET}.tar.gz" "$TARGET"
notify-send "Archive créée" "$(basename "$TARGET").tar.gz"
`

---

3) Extraire archive

extract-archive.nemo_action
`
[Nemo Action]
Name=Extraire archive
Comment=Décompresse ZIP/TAR/7z
Exec=/opt/nemo-project/actions/scripts/extract-archive.sh %F
Icon-Name=folder-extract
Selection=Any
Extensions=zip;tar;gz;7z;
Quote=double
`

scripts/extract-archive.sh
`

!/bin/bash
FILE="$1"
7z x "$FILE"
notify-send "Extraction terminée" "$(basename "$FILE")"
`

---

4) Compresser en 7z

create-7z.nemo_action
`
[Nemo Action]
Name=Créer 7z
Comment=Compresse en 7z
Exec=/opt/nemo-project/actions/scripts/create-7z.sh %F
Icon-Name=package-x-generic
Selection=Any
Extensions=any;
Quote=double
`

scripts/create-7z.sh
`

!/bin/bash
TARGET="$1"
7z a "${TARGET}.7z" "$TARGET"
notify-send "7z créé" "$(basename "$TARGET").7z"
`

---

5) Convertir en PDF

convert-pdf.nemo_action
`
[Nemo Action]
Name=Convertir en PDF
Comment=Convertit via LibreOffice
Exec=/opt/nemo-project/actions/scripts/convert-pdf.sh %F
Icon-Name=application-pdf
Selection=Any
Extensions=doc;docx;odt;xls;xlsx;ppt;pptx;
Quote=double
`

scripts/convert-pdf.sh
`

!/bin/bash
FILE="$1"
libreoffice --headless --convert-to pdf "$FILE"
notify-send "PDF généré" "$(basename "$FILE").pdf"
`

---

6) Convertir images en WEBP

convert-webp.nemo_action
`
[Nemo Action]
Name=Convertir en WEBP
Comment=Convertit l’image en WEBP
Exec=/opt/nemo-project/actions/scripts/convert-webp.sh %F
Icon-Name=image-x-generic
Selection=Any
Extensions=jpg;jpeg;png;
Quote=double
`

scripts/convert-webp.sh
`

!/bin/bash
FILE="$1"
cwebp "$FILE" -o "${FILE%.*}.webp"
notify-send "Conversion WEBP" "$(basename "$FILE")"
`

---

7) Convertir audio en MP3

convert-mp3.nemo_action
`
[Nemo Action]
Name=Convertir en MP3
Comment=Convertit audio en MP3
Exec=/opt/nemo-project/actions/scripts/convert-mp3.sh %F
Icon-Name=audio-x-generic
Selection=Any
Extensions=wav;flac;ogg;aac;
Quote=double
`

scripts/convert-mp3.sh
`

!/bin/bash
FILE="$1"
ffmpeg -i "$FILE" -vn -ar 44100 -ac 2 -b:a 192k "${FILE%.*}.mp3"
notify-send "MP3 généré" "$(basename "$FILE")"
`

---

8) Convertir vidéo en MP4

convert-mp4.nemo_action
`
[Nemo Action]
Name=Convertir en MP4
Comment=Convertit vidéo en MP4
Exec=/opt/nemo-project/actions/scripts/convert-mp4.sh %F
Icon-Name=video-x-generic
Selection=Any
Extensions=avi;mkv;mov;flv;
Quote=double
`

scripts/convert-mp4.sh
`

!/bin/bash
FILE="$1"
ffmpeg -i "$FILE" -vcodec libx264 -acodec aac "${FILE%.*}.mp4"
notify-send "MP4 généré" "$(basename "$FILE")"
`

---

9) Optimiser image

optimize-image.nemo_action
`
[Nemo Action]
Name=Optimiser image
Comment=Optimise JPEG/PNG
Exec=/opt/nemo-project/actions/scripts/optimize-image.sh %F
Icon-Name=image-x-generic
Selection=Any
Extensions=jpg;jpeg;png;
Quote=double
`

scripts/optimize-image.sh
`

!/bin/bash
FILE="$1"
EXT="${FILE##*.}"

case "$EXT" in
  jpg|jpeg) jpegoptim --strip-all "$FILE" ;;
  png) optipng -o7 "$FILE" ;;
esac

notify-send "Optimisation OK" "$(basename "$FILE")"
`

---

10) Redimensionner image

resize-image.nemo_action
`
[Nemo Action]
Name=Redimensionner image
Comment=Resize 1080p
Exec=/opt/nemo-project/actions/scripts/resize-image.sh %F
Icon-Name=image-resize
Selection=Any
Extensions=jpg;jpeg;png;
Quote=double
`

scripts/resize-image.sh
`

!/bin/bash
FILE="$1"
convert "$FILE" -resize 1920x1080 "${FILE%.}_1080p.${FILE##.}"
notify-send "Image redimensionnée" "$(basename "$FILE")"
`

---

11) Convertir image en PNG

convert-png.nemo_action
`
[Nemo Action]
Name=Convertir en PNG
Comment=Convertit l’image en PNG
Exec=/opt/nemo-project/actions/scripts/convert-png.sh %F
Icon-Name=image-x-generic
Selection=Any
Extensions=jpg;jpeg;webp;
Quote=double
`

scripts/convert-png.sh
`

!/bin/bash
FILE="$1"
convert "$FILE" "${FILE%.*}.png"
notify-send "PNG généré" "$(basename "$FILE")"
`

---

12) Extraire audio d’une vidéo

extract-audio.nemo_action
`
[Nemo Action]
Name=Extraire audio
Comment=Extrait audio d’une vidéo
Exec=/opt/nemo-project/actions/scripts/extract-audio.sh %F
Icon-Name=audio-x-generic
Selection=Any
Extensions=mp4;mkv;mov;avi;
Quote=double
`

scripts/extract-audio.sh
`

!/bin/bash
FILE="$1"
ffmpeg -i "$FILE" -q:a 0 -map a "${FILE%.*}.mp3"
notify-send "Audio extrait" "$(basename "$FILE")"
`

---

13) Suppression sécurisée

secure-delete.nemo_action
`
[Nemo Action]
Name=Suppression sécurisée
Comment=Efface de manière irréversible
Exec=/opt/nemo-project/actions/scripts/secure-delete.sh %F
Icon-Name=user-trash
Selection=Any
Extensions=any;
Quote=double
`

scripts/secure-delete.sh
`

!/bin/bash
FILE="$1"
shred -u -z "$FILE"
notify-send "Suppression sécurisée" "$(basename "$FILE")"
`

---

14) Vérifier SHA256

sha256sum.nemo_action
`
[Nemo Action]
Name=SHA256
Comment=Calcule et copie le SHA256
Exec=/opt/nemo-project/actions/scripts/sha256sum.sh %F
Icon-Name=accessories-calculator
Selection=Any
Extensions=any;
Quote=double
`

scripts/sha256sum.sh
`

!/bin/bash
FILE="$1"
SUM=$(sha256sum "$FILE" | awk '{print $1}')
echo "$SUM" | xclip -selection clipboard
notify-send "SHA256 copié" "$SUM"
`

---

15) Vérifier signature GPG

verify-gpg.nemo_action
`
[Nemo Action]
Name=Vérifier signature GPG
Comment=Vérifie la signature d’un fichier
Exec=/opt/nemo-project/actions/scripts/verify-gpg.sh %F
Icon-Name=security-high
Selection=Any
Extensions=asc;sig;
Quote=double
`

scripts/verify-gpg.sh
`

!/bin/bash
FILE="$1"
gpg --verify "$FILE"
notify-send "Vérification GPG" "Terminé"
`

---

16) Nettoyer métadonnées EXIF

clean-exif.nemo_action
`
[Nemo Action]
Name=Nettoyer EXIF
Comment=Supprime les métadonnées EXIF
Exec=/opt/nemo-project/actions/scripts/clean-exif.sh %F
Icon-Name=image-x-generic
Selection=Any
Extensions=jpg;jpeg;
Quote=double
`

scripts/clean-exif.sh
`

!/bin/bash
FILE="$1"
exiftool -all= "$FILE"
notify-send "EXIF nettoyé" "$(basename "$FILE")"
`

---

17) Envoyer via SCP

send-scp.nemo_action
`
[Nemo Action]
Name=Envoyer via SCP
Comment=Envoie le fichier via SSH
Exec=/opt/nemo-project/actions/scripts/send-scp.sh %F
Icon-Name=network-server
Selection=Any
Extensions=any;
Quote=double
`

scripts/send-scp.sh
`

!/bin/bash
FILE="$1"
scp "$FILE" user@server:/destination/
notify-send "SCP" "Fichier envoyé"
`

---

18) Créer checksum MD5

md5sum.nemo_action
`
[Nemo Action]
Name=MD5
Comment=Calcule le MD5
Exec=/opt/nemo-project/actions/scripts/md5sum.sh %F
Icon-Name=accessories-calculator
Selection=Any
Extensions=any;
Quote=double
`

scripts/md5sum.sh
`

!/bin/bash
FILE="$1"
md5sum "$FILE" | xclip -selection clipboard
notify-send "MD5 copié" "$(basename "$FILE")"
`

---

19) Renommer en masse

bulk-rename.nemo_action
`
[Nemo Action]
Name=Renommer en masse
Comment=Ouvre l’outil de renommage
Exec=/opt/nemo-project/actions/scripts/bulk-rename.sh %F
Icon-Name=edit-rename
Selection=Any
Extensions=any;
Quote=double
`

scripts/bulk-rename.sh
`

!/bin/bash
nemo-bulk-rename "$@"
`

---

20) Dupliquer fichier/dossier

duplicate.nemo_action
`
[Nemo Action]
Name=Dupliquer
Comment=Crée une copie du fichier/dossier
Exec=/opt/nemo-project/actions/scripts/duplicate.sh %F
Icon-Name=edit-copy
Selection=Any
Extensions=any;
Quote=double
`

scripts/duplicate.sh
`

!/bin/bash
TARGET="$1"
cp -r "$TARGET" "${TARGET}_copy"
notify-send "Copie créée" "$(basename "$TARGET")_copy"
`

---

🟩 TON PACK COMPLET DE 20 ACTIONS EST PRÊT

Tu peux les intégrer directement dans :

`
Nemo-cinnamon/ actions/
Nemo-cinnamon/ actions/ scripts/
`

---
