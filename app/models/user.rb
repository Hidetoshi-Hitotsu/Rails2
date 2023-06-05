class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates :username, presence: true
  #validates :email, presence: true
  #validates :password, presence: true
  #validates :password_confirmation, presence: true
  validates :introduction, length: { maximum: 250 }
  mount_uploader :image, ImageUploader

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
