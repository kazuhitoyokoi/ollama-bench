ollama pull $1 &> /dev/null
time curl http://localhost:11434/v1/chat/completions \
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
                \"content\": \"Hello!\"
            }
        ],
        \"max_tokens\": 1024
    }"
ollama rm $1
