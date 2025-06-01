-- 家計簿と費目テーブルが存在する場合、削除する
DROP TABLE IF EXISTS 家計簿;
DROP TABLE IF EXISTS 家計簿アーカイブ;
DROP TABLE IF EXISTS 費目;

-- 費目テーブルの作成
CREATE TABLE 費目(
	ID INTEGER PRIMARY KEY,
	名前 NVARCHAR(40) UNIQUE,
);

-- 費目テーブルにデータを登録
INSERT INTO 費目
VALUES
(1, N'給与'),
(2, N'家賃'),
(3, N'食費');

-- 家計簿テーブルを作成
CREATE TABLE 家計簿 (
	日付 DATE NOT NULL,
	費目ID INTEGER REFERENCES 費目(ID), -- 参照先を費目テーブルのIDを設定 外部キー制約
	メモ NVARCHAR(100) DEFAULT '不明' NOT NULL,
	入金額 INTEGER DEFAULT 0 CHECK(入金額 >= 0),
	出金額 INTEGER DEFAULT 0 CHECK(出金額 >= 0),
);

-- 家計簿テーブルにデータを登録
INSERT INTO 家計簿(日付, 費目ID, メモ, 入金額, 出金額)
VALUES
('2024-04-12', 2, N'家賃',　0, 600000),
('2025-05-31', 1, N'テスト', 0, 50000);

-- 家計簿アーカイブテーブルを作成
CREATE TABLE 家計簿アーカイブ (
	日付 DATE NOT NULL,
	費目ID INTEGER REFERENCES 費目(ID), -- 参照先を費目テーブルのIDを設定 外部キー制約
	メモ NVARCHAR(100) DEFAULT '不明' NOT NULL,
	入金額 INTEGER DEFAULT 0 CHECK(入金額 >= 0),
	出金額 INTEGER DEFAULT 0 CHECK(出金額 >= 0),
);