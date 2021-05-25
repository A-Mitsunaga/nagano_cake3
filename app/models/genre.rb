class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  # enum status:{未設定: 0,ケーキ:1,焼き菓子:2,プリン:3}
 #enum genre_id: { 'ケーキ': 0,'焼き菓子': 1 }
end
