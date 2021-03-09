# README

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| password         | string | null: false |
| email            | string | null: false |
| first_name       | string | null: false |
| first_name_kana  | string | null: false |
| family_name      | string | null: false |
| family_name_kana | string | null: false |
| birth_date       | date   |             |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| category  | string     | null: false                    |
| status    | string     | null: false                    |
| name      | string     | null: false                    |
| info      | text       | null: false                    |
| cost      | text       | null: false                    |
| area      | text       | null: false                    |
| date      | text       | null: false                    |
| price     | integer    | null: false                    |

### Association

- belongs_to :users
- has_one :purchase-record
- has_one_attached :image

## purchase_records テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | string       | null: false, foreign_key: true |
| item       | string       | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| cities       | string     | null: false                    |
| address      | string     | null: false                    |
| building     | text       | null: false                    |
| phone_number | text       | null: false                    |

### Association

- belongs_to :purchase_record