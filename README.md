# README

## usersテーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| nickname           | string     | null: false                |
| email              | string     | null: false, unique: true  |
| password           | string     | null: false                |
| last_name          | string     | null: false                |
| first_name         | string     | null: false                |
| last_name_kana     | string     | null: false                |
| first_name_kana    | string     | null: false                |
| birth_date         | date       | null: false                |

### Association
- has_many :item
- has_many :purchase
- has_many :delivery

## itemsテーブル


| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| description     | text       | null: false                   |
| category        | string     | null: false                   |
| condition       | string     | null: false                   |
| shipping_fee    | string     | null: false                   |
| shipping_region | string     | null: false                   |
| days_to_ship    | string     | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase
- has_one :delivery

## ordersテーブル

| Column          | Type       | Options                       |
| ----------------| ---------- | ----------------------------- |
| user            | references | null: false, foreign_key: true|
| item            | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル

| Column          | Type       | Options                    |
| ----------------| ---------- | -------------------------- |
| postal_code     | string     | null: false                | 
| prefecture      | string     | null: false                | 
| city            | string     | null: false                | 
| street_address  | string     | null: false                | 
| building_name   | string     |                            | 
| phone_number    | string     | null: false                | 

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :order
