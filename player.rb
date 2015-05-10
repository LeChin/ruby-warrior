class Player
  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif warrior.health < 20
      if warrior.look.any? {|space| space.enemy? }
        warrior.shoot!
      elsif (warrior.health < @health || warrior.health < 10)
        warrior.rest!
      else
        warrior.walk!
      end
    elsif warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
      print 'attacking'
    end

    @health = warrior.health
  end
end
