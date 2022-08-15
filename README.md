# README

# テーブル設計

## usersテーブル

| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|email              |string    |null: false, unique: true      |
|encrypted_password |string    |null: false                    |
|nickname           |string    |null: false                    |
|birthday           |date      |null: false                    |
|first_name         |string    |null: false                    |
|last_name          |string    |null: false                    |
|first_name_kana    |string    |null: false                    |
|last_name_kana     |string    |null: false                    |

### Association
- has_many :items
- has_many :buys

## itemsテーブル

| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|price              |integer   |null: false                    |
|name               |string    |null: false                    |
|category_id        |integer   |null: false                    |
|explanation        |text      |null: false                    |
|delivery_time_id   |integer   |null: false                    |
|condition_id       |integer   |null: false                    |
|shipping_fee_id    |integer   |null: false                    |
|prefectures_id     |integer   |null: false                    |
|user               |reference |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buysテーブル

| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|user               |reference |null: false, foreign_key: true |
|item               |reference |null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :profile

## profilesテーブル
| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|postal_code        |string    |null: false                    |
|prefecture_id      |integer   |null: false                    |
|city               |string    |null: false                    |
|address            |string    |null: false                    |
|phone_number       |string    |null: false                    |
|building           |string    |                               |
|buy                |reference |null: false, foreign_key: true |

### Association
- belongs_to :buy
