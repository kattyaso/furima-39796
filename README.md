# テーブル設計

## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| email              | string | null:false unique:true |
| encrypted_password | string | null:false             |
| nick_name          | string | null:false             |
| last_name          | string | null:false             |
| first_name         | string | null:false             |
| last_name_kana     | string | null:false             |
| first_name_kana    | string | null:false             |
| birth_date         | date   | null:false             |

### has_many :items

### has_many:sales_recode

## items テーブル

| Column               | Type       | Options                     |
| -------------------- | ---------- | --------------------------- |
| item                 | string     | null:false                  |
| description          | text       | null:false                  |
| category_id          | string     | null:false                  |
| sales_status_id      | string     | null:false                  |
| fee_status_id        | string     | null:false                  |
| schedule_delivery_id | string     | null:false                  |
| origin_address_id    | string     | null:false                  |
| processing_time_id   | string     | null:false                  |
| price                | integer    | null:false                  |
| user_id              | references | null:false foreign_key:true |

### belongs_to :users

### has_many:sales_recode

## sales_recode テーブル

| Column  | Type       | Options                     |
| ------- | ---------- | --------------------------- |
| item_id | references | null:false foreign_key:true |
| user_id | references | null:false foreign_key:true |

### belongs_to:users

### belongs_to:items

### has_one :orders

## orders テーブル

| Column        | Type       | Options                     |
| ------------- | ---------- | --------------------------- |
| postcode      | string     | null:false                  |
| prefecture_id | integer    | null:false                  |
| city          | string     | null:false                  |
| address       | string     | null:false                  |
| building      | string     |                             |
| phone_number  | string     | null:false                  |
| user_id       | references | null:false foreign_key:true |

### belongs_to :sales_recode
