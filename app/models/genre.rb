class Genre < ApplicationRecord
 

  has_many :items
  validates :name, presence: :true
  #ジャンル名が必ず存在する必要がある
  
  def self.search_for(content, method)
   if method == 'perfect'
     Genre.where(name: content)
   elsif method == 'forward'
     Genre.where('name LIKE ?', content + '%')
   elsif method == 'backward'
     Genre.where('name LIKE ?', '%' + content)
   else
     Genre.where('name LIKE ?', '%' + content + '%')
   end
  end

end
