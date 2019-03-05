class Player
  attr_accessor :name, :player_num, :player_symbol
  @@player_count = 0
  @@symbol = ["X".colorize(:blue), "O".colorize(:red)] 

  def initialize
    @@player_count += 1
  end

  def create_player(player_name)
    @name = player_name
    @player_num = @@player_count 
    @player_symbol = @@symbol[@player_num-1]
  end
end
