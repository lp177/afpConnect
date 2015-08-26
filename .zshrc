if [[ "$(uname)" == "Darwin" ]]; then
  source /Volumes/afp177/.cfgMac.sh
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  source /home/luperez/.cfgServer.sh
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
  echo "What do you fuck dude ?"
fi

source $HOME/.cfgAllSys.sh
