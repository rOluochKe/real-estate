class House < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :image, :owner, :address, :rooms, :sqmt, :floors, :price, presence: true
end
