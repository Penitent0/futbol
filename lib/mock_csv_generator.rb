require 'csv'
require 'map_csv'
require './lib/stat_tracker'
require_relative 'global_module'

class MockGenerator < StatTracker
  include Globeable

  def initialize(locations)
    @locations = locations
    @games_data = CSV.read(@locations[:games], headers: true, header_converters: :symbol)
    @game_teams_data = CSV.read(@locations[:game_teams], headers: true, header_converters: :symbol)
  end

  def self.from_csv(locations)
    MockGenerator.new(locations)
  end
  
  def rows_by_season
    season_array = @games_data.group_by do |row|
      row[:season]
    end
  end

  def generate_mock_games
    CSV.open('./data/generated_mock_games.csv', 'w') do |csv|
      rows_by_season.each do |season, rows|
        csv << rows[0..39]
      end
    end
  end

  def generate_mock_game_teams
    CSV.open('./data/generated_mock_game_teams.csv', 'w') do |csv|
      generate_mock_games.each do |season, games|
        games.each do |game|
          @game_teams_data.each do |row|
            csv << row if game[:game_id] == row[:game_id]
          end
        end
      end
    end
  end

  def generate_coaches_by_season
    CSV.open('./data/game_teams_seasons.csv', 'w') do |csv|
      require 'pry'; binding.pry
      
      end
    end
  end

  results = import



end