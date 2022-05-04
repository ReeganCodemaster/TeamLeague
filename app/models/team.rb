class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :games

  validates :title, presence:true
  validates :coordinator, presence:true
  validates :password, presence:true
end
