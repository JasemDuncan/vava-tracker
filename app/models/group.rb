class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  # before_create :insert_dafult_image
  # private
  # def insert_default_image
  # self.iamges=imageion html
  # end
  has_one_attached :image
end
