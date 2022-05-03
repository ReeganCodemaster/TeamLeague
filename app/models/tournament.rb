class Tournament < ApplicationRecord
  has_many :games, dependent: :destroy
end
