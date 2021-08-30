# テーブル設計

## users テーブル
| Column       | Type       | Options                    |
| -------------| ---------- | -------------------------- |
| name         | string     | null: false                |
| email        | string     | null: false                |
| password     | string     | null: false                |
### Association
has_many :friends

## friends テーブル
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
### Association
belongs_to :user
