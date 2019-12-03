# Meshistagram - こだわりのメシを投稿して、お店を共有しよう！ -
<img width="1676" alt="Top page" src="https://user-images.githubusercontent.com/51078777/69052557-aaf10000-0a4a-11ea-96e6-9a0a55406288.png">
<img width="1680" alt="スクリーンショット 2019-12-03 16 07 45" src="https://user-images.githubusercontent.com/51078777/70028714-badf1700-15e8-11ea-9e0a-f8a8b4204590.png">
<img width="1680" alt="スクリーンショット 2019-12-03 15 26 39" src="https://user-images.githubusercontent.com/51078777/70028836-009bdf80-15e9-11ea-8678-da9985268a07.png">

# アプリケーション概要
Meshistagramは、自分のこだわりのレストランを検索して皆と共有するためのSNSアプリケーションです。
<br>このアプリの利用ユーザーは、都市圏の老若男女を想定しております。

# アプリケーションURL
https://www.meshistagram.work/
<br>ログイン画面の「かんたんログイン」ボタンからテストユーザーとして利用可能です。

# アプリケーション機能一覧
* ユーザー関連
  * ログイン・ログアウト
  * OAuth認証(Facebookログイン)
  * プロフィール編集
  * 通知機能（フォロー、いいね、コメント）
  * ユーザー検索
  * ユーザーフォロー
  * 画像投稿機能
  * つぶやき機能
  * いいね機能
  * フォロー・フォロワー一覧表示
  * コメント投稿（つぶやきに対して）
* レストラン関連
  * レストラン検索（店名）
  * レストラン検索（フリーワード）
  * レストランお気に入り登録（myメシ）

# 使用技術
* Ruby 2.5.3
* Rails 5.2.2
* AWS(EC2 RDS VPC Route53 ALB ACM ) ※awsブランチにて実装
* Docker
* Docker Compose
* Heroku(CD用)　※masterブランチにて実装
* CircleCI（CI/CD自動テスト自動デプロイ）
* Facebook API
* ぐるなび API
