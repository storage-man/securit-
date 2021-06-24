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
ls
# on liste la liste des applictaions installées sur le telephone
cd /data/app
ls
# 
cd /mnt
ls
# on voit le contenue de la carte memoire
cd /mnt/sdcard
ls
# on exit le shell du telephone
exit
# on install l'application diva beta qui est version beta dangereuse pour le telephone portable 
wget https://github.com/tjunxiang92/Android-Vulnerabilities/blob/master/diva-beta.apk?raw=true
mv diva-beta.apk?raw=true diva-beta.apk 
keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore diva-beta.apk alias_name
adb install diva-beta.apk

#on desinstalle diva beta
adb uninstall jakhar.aseem.diva

#on affiches le log du telephone afin de connaitre ce que l'utilisateur realise dans le telephone
adb logcat
# on entre encore dans le shell
adb shell
# on liste les applications
cd /data/app
#on sort du shell
exit
#on importe du telephone vers notre machine le fichier apk apidemos
adb pull /data/app/ApiDemos.apk
#on exporte un fichier vers le telephone
echo "hello world" > file.txt
adb push file.txt /data/data/
#les processus android
adb shell
ps
#on voit le process init qui initialise le telephone android
cat init.rc | less
# on verifie qu'il existe le processus zygote 
ps | grep zygote
#unziper un fichier d'application apk
unzip –d diva diva-beta.apk
#on affiche le contenu du ficher AndroidManifest.xml
vim AndroidManifest.xml
#reverse engineering application apk 
apktool d diva-beta.apk
cd diva-beta
ls
#on visualise le contenu de manifest xml
vim AndroidManifest.xml
#on visualise le contenu du dossier smali
cd smali
ls
#on visualise le source code de l'application 
cd jakhar/aseem/diva
ls
cd ../../../../../
apktool b diva-beta –o new_diva.apk
# utilisation de Jadx
wget https://github.com/skylot/jadx/releases/download/v0.6.1/jadx-0.6.1.zip
unzip -d jadx jadx-0.6.1.zip 
cp diva-beta.apk jadx/bin
cd jadx/bin
./jadx -d diva diva-beta.apk
cd diva
ls
#on visualise le source code de l'application 
cd jakhar/aseem/diva
ls
# on visulaise le contenu de manifest avec dexdump
unzip d diva diva-beta.apk
dexdump -l plain classes.dex | less
dexdump -l xml classes.dex | less 
