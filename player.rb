class Player
  def play_turn(warrior)
    if @health
      if warrior.feel.empty? && warrior.health < @health
        warrior.walk!
      elsif warrior.feel.empty? && warrior.health < 20
        warrior.rest!
      elsif warrior.feel.empty? && warrior.health == 20
        warrior.walk!
      else
        warrior.attack!
      end
    else
      warrior.walk!
    end

    @health = warrior.health
  end
end
