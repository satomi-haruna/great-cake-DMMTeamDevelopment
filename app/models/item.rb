class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validates :name, presence: :true
  validates :introduction, presence: :true
  validates :price, presence: :true
  #booleanのデフォルトはfalseを設定済み
  #schema.rbを参照してください

  def get_item_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpeg', content_type: 'image/jpeg')
    end
    image
  end

  def add_tax_price
    (self.price * 1.1).round
    #itemモデルのpriceに税率をかける
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Item.where(name: content)
    elsif method == 'forward'
      Item.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Item.where('name lIKE ?', '%' + content)
    else 
      Item.where('name LIKE ?', '%' + content + '%')
    end
  end
end




