echo $1
sleep 10
ollama pull $1 1> /dev/null 2> /dev/null
sleep 10
time curl -s http://localhost:11434/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d "{
        \"model\": \"$1\",
        \"messages\": [
            {
                \"role\": \"user\",
                \"content\": \"Explain Japan in Japanese language\"
            }
        ],
        \"max_tokens\": 1024
    }" | jq .choices[0].message.content
sleep 10
ollama rm $1
sleep 10
