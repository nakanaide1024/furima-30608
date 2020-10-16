# テーブル設計

## Usersテーブル

| column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kana   | string  | null: false |
| birth_date       | date    | null: false |

### Association

- has_many :Comments
- has_many :Products
- has_many :Purchasers

## Productsテーブル

| column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| product_name          | string     | null: false                    |
| description           | string     | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| delivery_charger_id   | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| delivery_date         | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- has_many :Comments
- belongs_to :User
- has_one :Purchaser

## Purchaserテーブル

| column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| credit_number    | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| post_code        | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | integer    | null: false                    |
| building_number  | string     | null: false                    |
| phon_number      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true | 

### Association

- belongs_to :User
- belongs_to :Product

## Commentsテーブル

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Product