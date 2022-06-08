## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true | 
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_katakana  | string | null: false               |
| first_name_katakana | string | null: false               |
| birth_day           | date   | null: false               |

### Association
- has_many :items
- has_many :item_buys

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| explanation    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| quality_id     | integer    | null: false                    |
| payment_id     | integer    | null: false                    |
| area_id        | integer    | null: false                    |
| preparation_id | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_buy

## item_buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal       | string     | null: false                    |
| area_id      | integer    | null: false                    |
| cities       | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     |                                |
| telephone    | string     | null: false                    |
| item_buy     | references | null: false, foreign_key: true |

### Association

- belongs_to :item_buy
