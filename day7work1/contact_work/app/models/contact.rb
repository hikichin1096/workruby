class Contact < ApplicationRecord
  #content 空白での登録禁止
  validates :content, presence: true
end
