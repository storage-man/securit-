#on donne notre addresse ip comme variable du systeme 
myIpad="192.168.1.106"
#on se connecte avec le telephone mobile 
adb connect $myIpad
#on verifie si le telephone est connectée 
adb devices
#on entre dans le shell du telephone
adb shell
# on liste le contenue des données du telephone
cd /data/data
# on liste la liste des applictaions installées sur le telephone
cd /data/app
# 
cd /mnt
# on voit le contenue de la carte memoire
cd /mnt/sdcard
# on exit le shell du telephone
exit
# on install l'application diva beta qui est version beta dangereuse pour le telephone portable 
wget https://github.com/tjunxiang92/Android-Vulnerabilities/blob/master/diva-beta.apk?raw=true
keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore diva-beta.apk alias_name
adb install diva-beta.apk
# on entre la deuxieme fois dans le shell du telephone
adb shell
#on liste la liste des données afin de trouver une application à desinstaller 
ls /data/data
#on desinstalle l'application qu'on veut
adb uninstall [pakage-name]
# on quitte le shell du telephone
exit
#on affiches le log du telephone afin de connaitre ce que l'utilisateur realise dans le telephone
adb logcat
# on entre encore dans le shell
adb shell
# on liste les applications
cd /data/app
#on sort du shell
exit
#on importe du telephone vers notre machine le fichier apk apidemos
adb pull ApiDemos.apk
#on exporte un fichier vers le telephone
adb push [filename] [directory to be sent]
adb shell
ps
ls
#on voit le process init qui initialise le telephone android
cat init.cr | less
# on verifie qu'il existe le processus zygote 
ps | grep “zygote”
#unziper un fichier d'application apk
unzip –d [destination folder] [your apk archive]
#on affiche le contenu du ficher AndroidManifest.xml
vim AndroidManifest.xml
#reverse engineering application apk 
git clone https://github.com/tjunxiang92/Android-Vulnerabilities/blob/master/diva-beta.apk
apktool d diva-beta.apk
cd diva-beta
#on visualise le contenu de manifest xml
vim AndroidManifest.xml
#on visualise le contenu du dossier smali
cd smali
#on visualise le source code de l'application 
cd jakhar/aseem/diva
ls
cd ~
apktool b diva –o new_diva.apk
# utilisation de Jadx
wget https://github.com/skylot/jadx/releases/download/v1.2.0/jadx-1.2.0.zip
unzip -d jadx jadx-1.2.0.zip
cp diva-beta.apk jadx/bin
cd jadx/bin
./jadx –d diva divabeta.apk
cd diva
ls
#on visualise le source code de l'application 
cd jakhar/aseem/diva

