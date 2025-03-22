class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :number_people, presence: true, numericality: {only_integer: true, greater_than: 0}
    validate :checkin_checkout_check
    validate :date_before_checkin

  def checkin_checkout_check
    return if checkin.blank? || checkout.blank?
    errors.add(:checkout, "はチェックインより前の日付は登録できません") unless
    self.checkin <= self.checkout
  end

  def date_before_checkin
    return if checkin.blank?
    errors.add(:checkin, "は今日以降のものを選択してください") if checkin < Date.today
  end

end
