class Blog < ApplicationRecord
    # 空白ではないこと
    validates :title, presence: true
    # 1文字以上、140文字以下であること
    validates :content,    length: { in: 1..140 }
end
