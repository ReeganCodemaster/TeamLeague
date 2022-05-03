class PointsService
  
  def initialize()
    @teams = Team.all
  end

  def call()
    total_points = Hash.new
    @teams.each do |team|
      team_1_points = Game.where(team_1_id: team.id).sum(:team_1_points)
      team_2_points = Game.where(team_2_id: team.id).sum(:team_2_points)
      total_points[team.id] = team_1_points + team_2_points
    end
    total_points = total_points.sort_by{|key, value| value}.reverse 
  end
  
end