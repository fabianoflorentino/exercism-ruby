# frozen_string_literal: true

# Tournament
class Tournament
  attr_accessor :teams

  def initialize
    @teams = Hash.new { |h, k| h[k] = { MP: 0, W: 0, D: 0, L: 0, P: 0 } }
  end

  # Parses the result of a match and updates the statistics accordingly
  def parse_result(result)
    team1, team2, outcome = result.split(';')

    case outcome
    when 'win'
      update_stats(team1, team2, :W, :L)
    when 'loss'
      update_stats(team1, team2, :L, :W)
    when 'draw'
      update_stats(team1, team2, :D, :D)
    end
  end

  # Updates team statistics based on match outcome
  def update_stats(team1, team2, result1, result2)
    teams[team1][:MP] += 1
    teams[team2][:MP] += 1
    teams[team1][result1] += 1
    teams[team2][result2] += 1

    update_points(team1)
    update_points(team2)
  end

  # Updates the points for a given team
  def update_points(team)
    teams[team][:P] = teams[team][:W] * 3 + teams[team][:D]
  end

  # Sorts teams based on points and names
  def sort_teams
    teams.sort_by { |team, stats| [-stats[:P], team] }
  end

  # Generates the table with header and team stats
  def generate_table
    header = generate_header
    rows = generate_rows
    "#{header}#{rows.join("\n")}\n"
  end

  # Generates the header for the table
  def generate_header
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  # Generates rows for each team in the table
  def generate_rows
    sort_teams.map { |team, stats| generate_row(team, stats) }
  end

  # Generates a single row for a team in the table
  def generate_row(team, stats)
    "#{team.ljust(30)} | #{stats[:MP].to_s.rjust(2)} | #{stats[:W].to_s.rjust(2)} | " \
    "#{stats[:D].to_s.rjust(2)} | #{stats[:L].to_s.rjust(2)} | #{stats[:P].to_s.rjust(2)}"
  end

  # Main entry point to generate the tournament table based on input match results
  def self.tally(input)
    return "Team                           | MP |  W |  D |  L |  P\n" if input.nil? || input.strip.empty?

    tournament = Tournament.new
    input.each_line { |line| tournament.parse_result(line.chomp) }
    tournament.generate_table
  end
end
