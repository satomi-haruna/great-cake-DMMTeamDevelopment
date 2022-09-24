class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
# enumに直接日本語は✖️　着手不可０,製作待ち１,製作中２,製作完了３
  enum making_status: { cannot_start: 0, waiting_for_making: 1, in_making: 2, complete_making: 3 }
  
  # 小計メソッド
  def sub_total
    item.add_tax_price * amount
  end
end
