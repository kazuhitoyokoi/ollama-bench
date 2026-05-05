echo $1
sleep 10
ollama pull $1 1> /dev/null 2> /dev/null
sleep 10

mkdir -p logs
echo --- >> logs/$1.txt

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
    }" | jq -r '.choices[0].message.content | select(. != null) | "---\n" + .' >> logs/$1.txt
sleep 10
ollama rm $1
sleep 10

git pull
git config --global user.email "kazuhitoyokoi@nodered.jp"
git config --global user.name "Kazuhito Yokoi"
git add logs/*
git commit -m "Update catalogue $1"
git push
