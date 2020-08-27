# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :credit_card
- has_many :comments
- has_many :items
- has_one :profile

## items テーブル

| Column         | Type      | Options     |
| ------         | ------    | ----------- |
| name           | string    | null: false |
| image          | string    | null: false |
| items_status   | integer   | null: false |
| seller         | reference | null: false |
| preparation_day| integer   | null: false |
| postage_payer  | integer   | null: false |
| image          | text      | null: false |
| area           | integer   | null: false |
| category       | integer   | null: false |
### Association

- has_many :comments
- belongs_to :user
- has_one :send_item

## profiles テーブル

| Column         | Type      | Options     |
| ------         | ------    | ----------- |
| first_name     | string    | null: false |
| last_name      | string    | null: false |
| first_name_kana| string    | null: false |
| last_nama_kana | string    | null: false |
| birth_day      | date      | null: false |


### Association

- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## credit_card テーブル

| Column       | Type        | Options                        |
| -------      | ----------  | ------------------------------ |
| card_number  | integer     | null: false                    |
| year         | integer     | null: false                    |
| security_code| integer     | null: false                    |


### Association

- belongs_to :send_item
- belongs_to :user


## send_items テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| post_code   | integer    | null: false                    |
| stats       | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
|phone_number | integer    | null: false                    |


### Association

- belongs_to :send_item
- has_one :credit_card


