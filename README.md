# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |


## room_users テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| title      | string     | null: false |
| catch_copy | text       | null: false |
| concept    | text       | null: false |
| user       | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |


## messages テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |