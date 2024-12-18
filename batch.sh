memory_pressure -Q
sleep 10
ollama pull $1 1> /dev/null 2> /dev/null
sleep 10
pip3 install requests --break-system-packages
time python3 script.py $1
sleep 10
ollama rm $1
sleep 10
