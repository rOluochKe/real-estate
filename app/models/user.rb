class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :houses, dependent: :destroy
  has_many :complex_buildings, dependent: :destroy
  has_many :commercial_units, dependent: :destroy
end
