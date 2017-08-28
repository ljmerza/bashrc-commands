# set git user
git config --global user.name "Leonardo Merza"
git config --global user.email ljmerza@gmail.com


# disable audio focus Android
adb shell
cmd appops set com.nianticlabs.pokemongo TAKE_AUDIO_FOCUS ignore