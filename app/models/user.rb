class User < ApplicationRecord
  has_many :vitals, dependent: :destroy

  validates :username, presence: true,
                       uniqueness: true
end
