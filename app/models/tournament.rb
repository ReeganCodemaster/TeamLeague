class Tournament < ApplicationRecord
  has_many :games, dependent: :destroy

  validates :team_num, numericality: {greater_than_or_equal_to: 0, allow_nil:false, even:true}, presence:true
  validates :title, presence:true
end
