
Minima-Recipe
=============

必要最低限(minimalism)の材料で作れるレシピの投稿サイトです。 

ユーザーは最も重要な食材を2つ選択し、レシピを投稿します。 

検索フォームから今家にある食材を選択し検索を行うことで、レシピが簡単に検索できます。 

# URL

※デプロイ完了後に入力予定 
  
# テスト用アカウント

- メールアドレス：q1q1q1@q1.com
- パスワード：q1q1q1

# 利用方法
レシピの閲覧・検索はログイン状況に問わず可能です。 トップページから食材を選んで検索を行ってください。食材は何個でも選択可能です。レシピの必須食材2つともに該当する場合は、検索結果として一覧に表示されます。
 
レシピの投稿はログインユーザーのみ可能です。 ログイン後、ヘッダーの投稿ボタンよりレシピ投稿が行えます。投稿が完了すると、トップ画面の一覧に表示されます。

# 画面遷移図

![](img/minima-recipe_transition.svg)

# 目指した課題解決

Minima-Recipeでは、毎日料理を頑張る人へ向けた、今家にあるものでの献立悩みを簡単に解決することを目的にしています。 

最低限の食材でのレシピを簡単に投稿・検索できるアプリケーションです。

# 要件

## ユーザー
| 機能             | 目的                                                    |
| --------------- | ------------------------------------------------------- | 
| 登録・編集機能    | 登録・ログイン・アカウント情報の変更をできるようにする            | 
| マイページ機能    | ユーザー情報の確認と変更画面への遷移・ユーザーの過去の投稿一覧の確認 |
| お気に入り登録機能 | 気に入ったレシピをお気に入り登録できるようにする                 |
| フォロー機能      | ユーザーが自分以外のユーザーをフォロー登録できる                 |
| SNS認証機能      | ユーザーアカウント登録方法の選択肢を増やす                      |

## レシピ
| 機能                        | 目的                                                 |
| -------------------------- | ---------------------------------------------------- | 
| 登録機能                    | ユーザーがレシピの登録をできるようにする                    | 
| 一覧表示機能                 | トップ画面でレシピの一覧を表示できるようにする               |
| 検索機能（材料）              | ユーザーがレシピを簡単に検索できるようにする                |
| 編集機能                     | ユーザーが自分の投稿したレシピ情報の編集をできるようにする    |
| 削除機能                     | ユーザーが自分が投稿したレシピ情報を削除をできるようにする    |
| 検索機能（ジャンル・キーワード） | ユーザーがレシピを簡単に検索できるようにする                |
| ピックアップ表示機能           | お気に入り登録の多いレシピが自動で表示されるようにする        |
| 任意食材の登録機能             | ユーザーが任意材料の登録をできるようにする                  |
| 食材の分量登録機能             | ユーザーが食材の分量を登録できるようにする                  |
| コメント機能                  | ユーザーがレシピ詳細画面でコメントを投稿・閲覧できるようにする |
| 栄養成分表示機能               | レシピ詳細に栄養素成分を表示させる                        |



# データベース設計

## ER図

![](img/minima-recipe_er.svg)

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | --------------------------|
| nickname           | string  | null: false               | #ニックネーム
| email              | string  | null: false, unique: true | #メールアドレス
| encrypted_password | string  | null: false               | #パスワード
| gender_id          | integer | null: false               | #性別
| birthday           | date    | null: false               | #生年月日

### Association
- has_many :recipes
- has_many :favorites
- has_many :comments


## recipesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| cooking_name | string     | null: false                    | #料理名
| how_to_cook  | text       | null: false                    | #レシピの説明
| genre_id     | integer    | null: false                    | #カテゴリー
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :favorites
- has_many :comments
- has_many :recipes_foods
- has_many :foods, through: :recipes_foods


## foodsテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false | #食材名
| category_id | integer | null: false | #カテゴリー

### Association
- has_many :recipes_foods
- has_many :recipes, through: :recipes_foods


## recipes_foods テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| recipe | references | null: false, foreign_key: true |
| food   | references | null: false, foreign_key: true |

### Association

- belongs_to :recipe
- belongs_to :food


## favoritesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| recipe | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe


## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    | #コメント
| user   | references | null: false, foreign_key: true |
| recipe | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe

# ローカルでの動作方法

* huga 3.5.2
* hogehuga 1.0.2