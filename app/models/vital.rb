class Vital < ApplicationRecord
  belongs_to :user

  scope :today, -> {where(created_at: Date.today.all_day)}
  scope :yesterday, -> {where(created_at: Date.yesterday.all_day)}
  scope :last_week, -> {
    where('created_at BETWEEN ? AND ?',
    1.week.ago.beginning_of_day,
    Date.today.beginning_of_day)
  }
end
