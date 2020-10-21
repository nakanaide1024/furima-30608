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
- has_many :Buyers

## Productsテーブル

| column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| delivery_charger_id   | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| delivery_date_id      | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- has_many :Comments
- belongs_to :User
- has_one :Buyer

## Addressesテーブル

| column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_number  | string     |                                |
| phon_number      | string     | null: false                    |
| Buyer            | references | null: false, foreign_key: true | 

### Association

- belongs_to :Buyer

## Commentsテーブル

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Product

## Buyers
 
| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Product
- has_one :Address