class Genre < ApplicationRecord

  validates :name, presence: :true
  #ジャンル名が必ず存在する必要がある

end
