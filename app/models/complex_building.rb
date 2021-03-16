class ComplexBuilding < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :image, :owner, :address, :units, :sqmt, :price, presence: true
end
