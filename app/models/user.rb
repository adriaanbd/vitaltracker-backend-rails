class User < ApplicationRecord
  has_many :vitals, dependent: :destroy
end
