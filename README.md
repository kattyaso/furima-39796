# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null:false , unique:true |
| encrypted_password | string | null:false               |
| nick_name          | string | null:false               |
| last_name          | string | null:false               |
| first_name         | string | null:false               |
| last_name_kana     | string | null:false               |
| first_name_kana    | string | null:false               |
| birth_date         | date   | null:false               |

### has_many :items

### has_many:sales_recodes

## items テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| item                 | string     | null:false                    |
| description          | text       | null:false                    |
| category_id          | integer    | null:false                    |
| sales_status_id      | integer    | null:false                    |
| fee_status_id        | integer    | null:false                    |
| origin_address_id    | integer    | null:false                    |
| schedule_delivery_id | integer    | null:false                    |
| price                | integer    | null:false                    |
| user                 | references | null:false , foreign_key:true |

### belongs_to :user

### has_one:sales_recode

## sales_recodes テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| item   | references | null:false , foreign_key:true |
| user   | references | null:false , foreign_key:true |

### belongs_to:user

### belongs_to:item

### has_one :order

## orders テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| postcode          | string     | null:false                    |
| origin_address_id | integer    | null:false                    |
| city              | string     | null:false                    |
| address           | string     | null:false                    |
| building          | string     |                               |
| phone_number      | string     | null:false                    |
| sales_recode      | references | null:false , foreign_key:true |

### belongs_to :sales_recode
