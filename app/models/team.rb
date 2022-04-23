class Team < ApplicationRecord
    has_many :players, dependent: :destroy
    has_many :games, class_name: 'Game', foreign_key: 'id'
end
