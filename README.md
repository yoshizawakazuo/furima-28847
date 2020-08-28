# テーブル設計

## users テーブル

| Column         | Type      | Options     |
| --------       | ------    | ----------- |
| name           | string    | null: false |
| email          | string    | null: false |
| password       | string    | null: false |
| first_name     | string    | null: false |
| last_name      | string    | null: false |
| first_name_kana| string    | null: false |
| last_name_kana | string    | null: false |
| birth_day      | date      | null: false |
### Association


- has_many :comments
- has_many :items
- has_many  :buying

## items テーブル

| Column         | Type      | Options                       |
| ------         | ------    | -----------                   |
| name           | string    | null: false                   |
| image          | string    | null: false                   |
| items_status   | integer   | null: false                   |
| user_id        | integer   | null: false foreign_key: true |
| preparation_day| integer   | null: false                   |
| postage_payer  | integer   | null: false                   |
| area           | integer   | null: false                   |
| category       | integer   | null: false                   |
| price          | integer   | null: false                   |

### Association

- has_many :comments
- belongs_to :user
- has_one :buying


## buying テーブル

| Column         | Type      | Options                       |
| ------         | ------    | -----------                   |
| user_id        | integer   | null: false foreign_key: true |
| item_id        | integer   | null: false foreign_key: true |



### Association

- belongs_to :user
- has_one :send_item
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user



## send_items テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| stats         | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
|building_number| string     | null: false                    |
|phone_number   | string     | null: false                    |
|buying_id      | integer    | null: false foreign_key: true  |

### Association


- belongs_to :buying

