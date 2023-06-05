class Reservation < ApplicationRecord

    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :number, presence: true

    validate :date_cannot_be_in_the_past

    def date_cannot_be_in_the_past
        if self.checkin != nil && self.checkout != nil
        errors.add(:checkout, "の日付を正しく選択してください") unless
        self.checkin < self.checkout 
        end
    end

    belongs_to :user
    belongs_to :room
end
