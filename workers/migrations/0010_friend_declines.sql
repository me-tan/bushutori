-- フレンド申請を断られたことを、申請した側に知らせるための簡易メールボックス
--（removals と同じ考え方）。
--
-- これが無いと、申請した側の画面に「承認を待っています」が出たまま残り続け、
-- 断られたのか、まだ見られていないだけなのかが分からない。
--
-- 断った側が申請を消した瞬間に、申請した側あてに1件書き込む。
-- 申請した側がフレンド画面を開いたときにポーリングで確認し、確認後は削除する。

CREATE TABLE friend_declines (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  to_code TEXT NOT NULL,        -- 申請した側（知らせを受け取る人）
  from_code TEXT NOT NULL,      -- 断った側。どの申請が断られたかを画面側で特定するのに使う
  from_nickname TEXT NOT NULL,
  created_at INTEGER NOT NULL
);
CREATE INDEX idx_friend_declines_to ON friend_declines (to_code, created_at);
