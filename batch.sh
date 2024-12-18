ollama pull $1 &> /dev/null
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
ollama rm $1
