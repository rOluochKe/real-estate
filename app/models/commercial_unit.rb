class CommercialUnit < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :image, :owner, :address, :shops, :sqmt, :parking, :price, presence: true
end
