class Player < ApplicationRecord
  belongs_to :team

  validates :player_name , presence:true
end
