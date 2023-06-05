class Room < ApplicationRecord
    validates :roomname, presence: true
    validates :introduction, presence: true, length: { maximum: 500 }
    validates :price, presence: true
    validates :address, presence: true

    mount_uploader :image, ImageUploader

    belongs_to :user, foreign_key: "user_id"
    has_many :reservation, dependent: :destroy

end
