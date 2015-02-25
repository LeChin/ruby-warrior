class Player
  def play_turn(warrior)
    if @health
      if warrior.feel.empty? && warrior.health < @health
        if warrior.health < 10
          warrior.walk!(:backward)
        else
          warrior.walk!
        end
      elsif warrior.feel(:backward).captive?
        warrior.rescue!(:backward)
      elsif warrior.feel.empty? && warrior.health < 20
        warrior.rest!
      elsif warrior.feel(:backward).empty? && warrior.feel.empty? && warrior.health == 20
        warrior.walk!
      else
        warrior.attack!
      end
    else
      warrior.walk!(:backward)
    end

    @health = warrior.health
  end
end
