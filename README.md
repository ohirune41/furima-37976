## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false | 
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_katakana  | string  | null: false |
| first_name_katakana | string  | null: false |
| birthday_year       | integer | null: false |
| birthday_month      | integer | null: false |
| birthday_day        | integer | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| item_name   | string  | null: false |
| explanation | text    | null: false |
| category    | string  | null: false |
| quality     | string  | null: false |
| payment     | string  | null: false |
| area        | string  | null: false |
| days        | string  | null: false |
| price       | integer | null: false |

### Association

- belongs_to :user
- has_many :buys, through: :items_buy
- has_many :items_buy

## items_buy テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| buy    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :buy

## buy テーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| number | integer | null: false |
| month  | integer | null: false |
| year   | integer | null: false |
| code   | integer | null: false |

### Association

- belongs_to :user
- has_many :items, through: :items_buy
- has_many :items_buy

## buy_address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buy     | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
- belongs_to :address

## address テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| postal       | string | null: false |
| state        | string | null: false |
| cities       | string | null: false |
| house_number | string | null: false |
| building     | string | null: false |
| telephone    | string | null: false |

### Association

- has_many :buys, through: :buy_address
- has_many :buy_address