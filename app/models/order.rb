class Order < ApplicationRecord
    belongs_to :customer
    # has_manyは複数形
    has_many :order_details, dependent: :destroy

    enum payment_method: { credit_card: 0, transfer: 1 }
    # enumに直接日本語は✖ 入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済:4
    enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_making: 2, yet_sent: 3, sent: 4 }
    # enumの日本語化はconfig/locales/ja.ymalへ
end