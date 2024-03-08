### User テーブル
| フィールド名 | データ型 | キー | 説明         | null許容 |
|----------|-------|----|------------|-------|
| id       | bigint | PK | ユーザーID     | ×     |
| name     | string |    | ユーザー名     | ×     |
| email    | string |    | メールアドレス  | ×     |
| hashed_password    | string |    | パスワード  | ×     |

### Catalog テーブル
| フィールド名 | データ型 | キー | 説明       | null許容 |
|----------|-------|----|----------|-------|
| id       | bigint | PK | カタログID   | ×     |
| name     | string |    | カタログ名   | ×     |

### Product テーブル
| フィールド名 | データ型 | キー | 説明     | null許容 |
|----------|-------|----|--------|-------|
| id       | bigint | PK | 製品ID   | ×     |
| name     | string |    | 製品名   | ○     |
| size     | string |    | サイズ   | ○     |
| price    | bigint |    | 価格     | ○     |
| image    | string |    | 画像   | ×     |
| remark   | string |    | 備考       | ○     |

### Template テーブル
| フィールド名 | データ型 | キー | 説明       | null許容 |
|----------|-------|----|----------|-------|
| id       | bigint | PK | テンプレートID | ×     |
| content  | string |    | 内容       | ×     |

### Catalog_section テーブル
| フィールド名   | データ型 | キー | 説明       | null許容 |
|------------|-------|----|----------|-------|
| id         | bigint | PK | ID       | ×     |
| templateId | bigint | FK | テンプレートID | ×     |
| catalogId  | bigint | FK | カタログID   | ×     |
| productId  | bigint | FK | 製品ID   | ×     |
| page_number  | bigint |  | ページNo   | ×     |
| page_place_number  | bigint |  | ページプレイスNo   | ×     |