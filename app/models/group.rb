class Group < ApplicationRecord
  belongs_to :user
  validates :name, :image, presence: true
  # before_create :insert_dafult_image
  # private
  # def insert_default_image
  # self.iamges=imageion html
  # end
  after_create :send_mail
  has_one_attached :image

  private

  def send_mail
    # GroupMailer.new_group(self).deliver_now
  end
end
