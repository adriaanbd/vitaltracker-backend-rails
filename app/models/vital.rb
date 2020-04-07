class Vital < ApplicationRecord
  belongs_to :user

  scope :today, -> {where('created_at >= ?', Date.today.advance(:days => 0).beginning_of_day)}
  scope :yesterday, -> {where(created_at: Date.today.advance(:days => -1).all_day)}
  scope :more_than_1_day_ago, -> {
    where('created_at <= ?',
    Date.today.advance(:days => -2).end_of_day)
  }

  validates :category, inclusion: { in: %w(weight glucose temperature systolic diastolic mood) },
                       message: "%{value} is not a valid vital category"
  validates :category, presence: true
  validates :user_id, presence: true
  validates :measure, presence: true
end
