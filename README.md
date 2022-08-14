# README

# テーブル設計

## usersテーブル

| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|email              |string    |null: false, unique: true      |
|encrypted_password |string    |null: false                    |
|nickname           |string    |null: false                    |
|birthday           |integer   |null: false                    |
|name               |string    |null: false                    |

### Association
- has_many :items
- has_many :buys

## itemsテーブル

| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|image              |binary    |null: false                    |
|price              |integer   |null: false                    |
|name               |string    |null: false                    |
|category           |string    |null: false                    |
|explanation        |text      |null: false                    |
|delivery_period    |integer   |null: false                    |
|user               |reference |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :buy

## buyテーブル

| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|user               |reference |null: false, foreign_key: true |
|comment            |text      |null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :profile

## profileテーブル
| Column            | Type     | Option                        |
|-------------------|----------|-------------------------------|
|postal_code        |integer   |null: false                    |
|prefecture         |string    |null: false                    |
|city               |string    |null: false                    |
|address            |string    |null: false                    |
|phone_number       |integer   |null: false                    |
|user               |reference |null: false, foreign_key: true |

### Association
- belongs_to :buy
