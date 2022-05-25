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
- has_many :addresses, through: :user_addresses
- has_many :user_addresses

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
- belongs_to :address

## item_buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

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

- has_many :user, through: :user_addresses
- has_many :items
- has_many :item_buys
- has_many :user_addresses

## user_addresses テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address