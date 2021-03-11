# README

## users テーブル

| Column             | Type   | Options                   |
| ----------------   | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name        | string | null: false               |
| family_name_kana   | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| name          | string     | null: false                    |
| info          | text       | null: false                    |
| cost_id       | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| furimadate_id | integer    | null: false                    |
| price         | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase_record
- has_one_attached :image

## purchase_records テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| item       | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| area_id         | integer    | null: false                    |
| cities          | string     | null: false                    |
| house_number    | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record