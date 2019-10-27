class Blog < ApplicationRecord
  #バリデーションはモデル定義
  #presence: true 空の値登録禁止
  validates :title, presence: true
end
