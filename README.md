# fukuoka-de-longi-bot-prepare
## 概要
- CDを行うために必要なリソースについて作成を行っている
- `make create-sam-deploy-user-access-key` で `fukuoka-de-longi-bot-cloud` と `fukuoka-de-longi-bot-layer` 用のIAM Userのアクセスキーを発行している
    - 発行している場合は削除して再発行。
- `make create-ssm-deploy-user-access-key` で `fukuoka-de-longi-bot-ssm` 用のIAM Userのアクセスキーを発行している
    - 発行している場合は削除して再発行。