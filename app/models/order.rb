class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_detail, dependent: :destroy
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { 入金待ち: 0, 支払確認: 1, making: 2, ready_for_send: 3, sent: 4 }
end
