echo $1
sleep 10
ollama pull $1 1> /dev/null 2> /dev/null
sleep 10

echo --- >> logs.txt
echo $1 start >> logs.txt

time curl -s http://localhost:11434/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d "{
        \"model\": \"$1\",
        \"messages\": [
            {
                \"role\": \"user\",
                \"content\": \"さかなクンとは\"
            }
        ],
        \"max_tokens\": 1024
    }" | jq .choices[0].message.content >> logs.txt
sleep 10
ollama rm $1
sleep 10

echo $1 end >> logs.txt

git pull
git config --global user.email "kazuhitoyokoi@nodered.jp"
git config --global user.name "Kazuhito Yokoi"
git add logs.txt
git commit -m "Update catalogue $1"
git push
