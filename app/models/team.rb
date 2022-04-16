class Team < ApplicationRecord
    has_many :players, dependent: :destroy
    has_many :games, foreign_key: 'team_1_id', foreign_key: 'team_2_id', dependent: :destroy
end
