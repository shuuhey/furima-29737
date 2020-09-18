# テーブル設計

## users テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| nickname         | string | null: false                    |
| email            | string | null: false, foreign_key: true |
| password         | string | null: false                    |
| family_name      | string | null: false                    |
| first_name       | string | null: false                    |
| family_name_kana | string | null: false                    |
| first_name_kana  | string | null: false                    |
| birth_day        | date   | null: false                    |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee    | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| preparation_day | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :prefecture

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| product | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false, unique:true       |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture