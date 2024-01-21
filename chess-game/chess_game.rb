module Chess
  # TODO: define the 'RANKS' constant
  # TODO: define the 'FILES' constant

  RANKS = 1..8
  FILES = 'A'..'H'
  public_constant :RANKS
  public_constant :FILES

  def self.valid_square?(rank, file)
    RANKS.include?(rank) && FILES.include?(file)
  end

  def self.nick_name(first_name, last_name)
    first_name.chars[0..1].join.upcase + last_name.chars[-2..].join.upcase
  end

  def self.move_message(first_name, last_name, square)
    if valid_square?(square.chars[1].to_i, square.chars[0])
      "#{nick_name(first_name, last_name)} moved to #{square}"
    else
      "#{nick_name(first_name, last_name)} attempted to move to #{square}, but that is not a valid square"
    end
  end

  def self.chess_square(position)
    ('A1'..'H8').to_a.include?(position)
  end
end
