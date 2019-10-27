class Contact < ApplicationRecord
  validates :content,    length: { in: 1..140 }        # 「1文字以上140文字以下」
end
