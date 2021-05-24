class Genre < ApplicationRecord
  has_many :blogs, dependent: :destroy
  # enum status:{未設定: 0,ケーキ:1,焼き菓子:2,プリン:3}
end
