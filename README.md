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
|category           |integer   |null: false                    |
|explanation        |text      |null: false                    |
|delivery_time      |integer   |null: false                    |
|condition          |integer   |null: false                    |
|shipping_fee       |integer   |null: false                    |
|prefectures        |integer   |null: false                    |
|user               |reference |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buyテーブル

| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|user               |reference |null: false, foreign_key: true |
|item               |reference |null: false, foreign_key: true |
|profile            |reference |null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :profile

## profileテーブル
| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|postal_code        |integer   |null: false                    |
|prefecture         |integer   |null: false                    |
|city               |string    |null: false                    |
|address            |string    |null: false                    |
|phone_number       |integer   |null: false                    |
|building           |integer   |                               |
|user               |reference |null: false, foreign_key: true |

### Association
- belongs_to :buy
