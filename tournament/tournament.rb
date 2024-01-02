# frozen_string_literal: true

# Tournament
class Tournament
  attr_accessor :teams

  def initialize
    @teams = Hash.new { |team_hash, team_key| team_hash[team_key] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }
  end

  def self.tally(input)
    return "Team                           | MP |  W |  D |  L |  P\n" if input.nil? || input.strip.empty?

    tournament = Tournament.new
    input.each_line { |line| tournament.parsed_result(line.chomp) }
    tournament.generate_table
  end

  def parsed_result(result)
    team1, team2, outcome = result.split(';')

    case outcome
    when 'win' then update_stats(team1, team2, :w, :l)
    when 'loss' then update_stats(team1, team2, :l, :w)
    when 'draw' then update_stats(team1, team2, :d, :d)
    end
  end

  def update_stats(team1, team2, result1, result2)
    teams[team1][:mp] += 1
    teams[team2][:mp] += 1
    teams[team1][result1] += 1
    teams[team2][result2] += 1

    update_points(team1)
    update_points(team2)
  end

  def update_points(team)
    teams[team][:p] = teams[team][:w] * 3 + teams[team][:d]
  end

  def sort_teams
    teams.sort_by { |team, stats| [-stats[:p], team] }
  end

  def generate_table
    header = header_line
    rows = generate_rows

    "#{header}#{rows.join("\n")}\n"
  end

  def header_line
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def generate_rows
    sort_teams.map { |team, stats| generate_row(team, stats) }
  end

  def generate_row(team, stats)
    "#{team.ljust(30)} | #{stats.values_at(:mp, :w, :d, :l, :p).map { |stat| stat.to_s.rjust(2) }.join(' | ')}"
  end
end
