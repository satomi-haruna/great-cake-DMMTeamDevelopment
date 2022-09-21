class Genre < ApplicationRecord


  has_many :items
  validates :name, presence: :true
  #ジャンル名が必ず存在する必要がある

end
