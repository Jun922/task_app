# テーブル設計

## users テーブル
| Column   | Type   | Options     |
| ---------| -------| ------------|
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
### Association
has_many :friends[following, follower]


## friends テーブル
| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| follower_id | string     | null: false                    |
| followed_id | references | null: false, foreign_key: true |
### Association
belongs_to :user

## posts テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |
### Association
belongs_to :user
