class Game < ApplicationRecord
  belongs_to :team_1,class_name: 'Team', foreign_key: 'team_1_id'
  belongs_to :team_2,class_name: 'Team', foreign_key: 'team_2_id'

  before_save :generate_points

  validates :team_1_score, numericality: {greater_than_or_equal_to: 0, allow_nil:true}
  validates :team_2_score, numericality: {greater_than_or_equal_to: 0, allow_nil:true}

  private
  def generate_points
    if team_1_score > team_2_score
      self.team_1_points = 3
      self.team_2_points = 0
    elsif team_1_score = team_2_score
      self.team_1_points = 1
      self.team_2_points = 1
    else
      self.team_2_points = 3
      self.team_1_points = 0
    end 
  end
end
