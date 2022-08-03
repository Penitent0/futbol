require './lib/stat_tracker'

game_path = './data/games.csv'
team_path = './data/teams.csv'
game_teams_path = './data/game_teams.csv'
season_coaches_path = './data/season_coaches.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path,
  season_coaches: season_coaches_path
            }

stat_tracker = StatTracker.from_csv(locations)

require 'pry'; binding.pry

