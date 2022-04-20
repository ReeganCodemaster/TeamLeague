class PointsService
  def initialize(team_1_id, team_2_id)
    @team_1_id = team_1_id
    @team_2_id = team_2_id
  end

  def call
    total_points = {}
    total_points[@team_1_id] = Game.where(team_1_id: @team_1_id).sum(:team_1_points)
    total_points[@team_2_id] = Game.where(team_2_id: @team_2_id).sum(:team_2_points)
    total_points
  end
end