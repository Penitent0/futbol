module Globeable
  def find_team_name_by_id(id_number)
    team_name = nil
    @teams_data.each do |row|
      team_name = row[:teamname] if row[:team_id] == id_number.to_s
    end
    team_name
  end

  def seasons
    seasons_ary = @games_data.map do |row|
      row[:season]
    end
    seasons_ary.uniq.sort
  end

  def team_names
    @teams_data.map do |row|
      row[:teamname]
    end.sort
  end

  def team_ids
    @teams_data.map do |row|
      row[:team_id]
    end.sort
  end

  def games_by_season(season)
    games_array = []
    @games_data.each do |row|
    games_array <<row[:game_id] if row[:season] == season
    end
    games_array.uniq
  end
end