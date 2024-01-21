# frozen_string_literal: true

# Port
module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = 'pale'.to_sym.upcase

  def self.get_identifier(city)
    to_sym_upcase(city.chars[0..3].join)
  end

  def self.get_terminal(ship_identifier)
    case ship_identifier[0..2].to_sym.upcase
    when :OIL then to_sym_upcase('a')
    when :GAS then to_sym_upcase('a')
    else
      to_sym_upcase('b')
    end
  end

  def self.to_sym_upcase(string)
    string.to_sym.upcase
  end
end
