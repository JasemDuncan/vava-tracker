class Group < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :name, :image, presence: true
  after_create :send_mail
  has_one_attached :image

  scope :order_scope, -> {order(name: :asc)}
  

  private
  def send_mail
    GroupMailer.new_group(self).deliver_now
  end
end
