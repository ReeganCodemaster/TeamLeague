class PointsService
  
  def initialize()
    @games = Game.all
  end

  def call()
    total_points = Hash.new
    points = Hash.new
    @games.each do |game|


      points[game.team_1_id] = Game.where(team_1_id: game.team_1_id).find(game.id).team_1_points
      points[game.team_2_id] = Game.where(team_2_id: game.team_2_id).find(game.id).team_2_points

      if total_points[game.team_1_id].to_i > 0 and total_points[game.team_2_id].to_i > 0 
        total_points[game.team_1_id] += points[game.team_1_id]
        total_points[game.team_2_id] += points[game.team_2_id]
      elsif total_points[game.team_1_id].to_i > 0 and total_points[game.team_2_id].to_i == 0
        total_points[game.team_1_id] += points[game.team_1_id]
        total_points[game.team_2_id] = points[game.team_2_id]
      elsif total_points[game.team_1_id].to_i == 0 and total_points[game.team_2_id].to_i > 0
        total_points[game.team_2_id] += points[game.team_2_id]
        total_points[game.team_1_id] = points[game.team_1_id]
      else 
        total_points[game.team_2_id] = points[game.team_2_id]
        total_points[game.team_1_id] = points[game.team_1_id]
      end
      points.clear
    end 
    total_points = total_points.sort_by{|key, value| value}.reverse 
  end
  
end