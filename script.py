import requests
import json
import argparse

# 引数の処理
def get_args():
    parser = argparse.ArgumentParser(description='Chat Completion API Request')
    parser.add_argument('model', type=str, help='Model identifier for the request')
    return parser.parse_args()

# APIのURL
url = "http://localhost:11434/v1/chat/completions"

# 引数を取得
args = get_args()

# リクエストデータ
data = {
    "model": args.model,  # 第一引数で指定されたmodel
    "messages": [
        {
            "role": "user",
            "content": "富士山の高さを教えてください。"
        }
    ],
    "max_tokens": 1024
}

print(f"{data}")
# ヘッダー情報
headers = {
    "Content-Type": "application/json"
}

# POSTリクエストを送信
response = requests.post(url, headers=headers, data=json.dumps(data))

# レスポンスの確認
if response.status_code == 200:
    # JSONレスポンスをパース
    response_json = response.json()
    # 結果を表示
    print(response_json["choices"][0]["message"]["content"])
else:
    print(f"Error: {response.status_code}, {response.text}")
