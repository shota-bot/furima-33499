# README
# テーブル設計


## users テーブル
| Column          | Type    | Option      |
| ----------------| ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

## Association
- has_many :addresses
- has_many :cards
- has_many :items
- has_many :accounts
- has_many :comments
- has_many :likes
- has_many :reports


## addresses テーブル
| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| building    | string     |                                |
| phone_num   | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_many :accounts


 ## cards テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| num    | integer    | null: false                    |
| limit  | integer    | null: false                    |
| code   | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_many : accounts


## items テーブル
| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| text      | text       | null: false                    |
| postage   | string     | null: false                    |
| source    | string     | null: false                    |
| days      | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| category  | references | null: false, foreign_key: true |
| status    | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :category
- belongs_to :status
- has_many :comments
- has_many :likes
- has_many :reports
- has_one :account


## categories テーブル
| Column   | Type   | Option      |
| ------   | ------ | ----------- |
| category | string | null: false |

## Association
- has_many :items


## statuses テーブル
| Column | Type   | Option      |
| ------ | ------ | ----------- |
| status | string | null: false |

## Association
- has_many :items


## accounts テーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| card    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- belongs_to :card
- belongs_to :address


## comments テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item


## likes テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item


## reports テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
