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