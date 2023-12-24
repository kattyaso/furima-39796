# テーブル設計

## users テーブル

| Column             | Type   | Options               |
| ------------------ | ------ | --------------------- |
| email              | string | NOT NULL ユニーク制約 |
| encrypted_password | string | NOT NULL              |
| nick-name          | string | NOT NULL              |
| last-name          | string | NOT NULL              |
| first-name         | string | NOT NULL              |
| birth-date         | date   | NOT NULL              |

## items テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| item              | string     | NOT NULL          |
| fee-status        | text       | NOT NULL          |
| sales-status      | text       | NOT NULL          |
| schedule-delivery | text       | NOT NULL          |
| prise             | integer    | NOT NULL          |
| user              | references | NOT NULL 外部キー |

## orders テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postcode     | integer    | NOT NULL          |
| prefecture   | text 　    | NOT NULL          |
| city         | text       | NOT NULL          |
| address      | text       | NOT NULL          |
| building     | text       | NOT NULL          |
| phone number | integer    | NOT NULL          |
| items        | references | NOT NULL 外部キー |
