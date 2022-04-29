class PointsService
  
  def initialize(games)
    @games = games
  end

  def call()
    total_points = Hash.new

    @games.each do |game|
      total_points[game.team_1_id] = Game.where(team_1_id: game.team_1_id).sum(:team_1_points)
      total_points[game.team_2_id] = Game.where(team_2_id: game.team_2_id).sum(:team_2_points)

      if total_points[game.team_1_id] > 0 and total_points[game.team_2_id] > 0
        total_points.merge!(total_points) 
      elsif total_points[game.team_1_id] > 0 and total_points[game.team_2_id] = 0
        total_points[game.team_1_id] = total_points[game.team_1_id]
        total_points[game.team_2_id] = total_points[game.team_2_id].to_i + total_points[game.team_2_id]
      elsif total_points[game.team_1_id] = 0 and total_points[game.team_2_id] > 0
        total_points[game.team_2_id] = total_points[game.team_2_id]
        total_points[game.team_1_id] = total_points[game.team_1_id].to_i + total_points[game.team_1_id]
      end
    end 
    total_points = total_points.sort_by{|key, value| value}.reverse 
  end
  
end