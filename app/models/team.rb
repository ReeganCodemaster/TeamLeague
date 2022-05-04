class Team < ApplicationRecord
    has_many :players, dependent: :destroy
    has_many :games
end
