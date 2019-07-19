#!/bin/sh
startDir="$PWD"
workDir='/tmp'

cd "$workDir" && \
git clone https://github.com/tbocek/dvorak && \
python -m platform | grep --quiet Ubuntu && \
yes | sudo apt install libx11-dev && \
cd dvorak && \
make && \
sudo make install && \
read -p 'reboot required. reboot now? (y|N) ' reply && \
echo "$reply" | grep --quiet --ignore-case y && \
sudo reboot

cd "$startDir"
