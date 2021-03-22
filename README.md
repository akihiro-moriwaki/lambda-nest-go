# lambda-nest-go
Lambda nest application

## 設定
デプロイ時に必要なため環境変数に以下を設定する
```
AWS_PROFILE（クレデンシャルのプロファイル）
BUCKET_NAME（S3のバケット名）
PREFIX_NAME（S3のプリフィックス名）
```

## ビルド
```bash
make build
```

## ローカルで起動
```bash
make start
```

## デプロイ
```bash
make deploy
```