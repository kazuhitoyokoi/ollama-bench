sleep 10
ollama pull $1 &> /dev/null
sleep 10
time curl -s http://localhost:11434/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d "{
        \"model\": \"$1\",
        \"messages\": [
            {
                \"role\": \"system\",
                \"content\": \"You are a helpful assistant.\"
            },
            {
                \"role\": \"user\",
                \"content\": \"こんにちは\"
            }
        ],
        \"max_tokens\": 1024
    }" | jq .choices[0].message.content
sleep 10
ollama rm $1
