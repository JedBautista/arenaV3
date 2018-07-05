require "pry"

class Arena  
  
  def self.duel(h1,h2, mode)
    if mode === "turnBased"
      Mode.turnBased(h1,h2)
    elsif mode === "deathMatch"
      Mode.deathMatch(h1,h2)
    end
  end

end

class Mode 

  def self.turnBased(hero1, hero2)
    n = 0
    while n < 5 do
      if(hero1.hp != 0 || hero2.hp != 0)
        defend = [hero1, hero2].sample
        if defend === hero1
          n+=1
          attack(hero2, hero1)
        else
          n+=1
          attack(hero1, hero2)
        end
      end
    end

    if (n > 4)
      if(hero1.hp < 0 || hero2.hp > hero1.hp)
        puts "#{hero2.name} has won with #{hero2.hp} left"
      elsif (hero2.hp < 0 || hero1.hp > hero2.hp)
        puts "#{hero1.name} has won with #{hero1.hp} left"
      end
    end
  end

  def self.deathMatch(hero1, hero2) 
      while (hero1.hp > 0 && hero2.hp >  0) do
        defend = [hero1, hero2].sample
        if defend === hero1
          attack(hero2, hero1)
        elsif defend === hero2
          attack(hero1, hero2)
        end
        if(hero1.hp < 0 || hero2.hp < 0)
          puts "Game over"
          if (hero1.hp > hero2.hp)
            puts  "#{hero1.name} has won with #{hero1.hp} hp left"
          else 
            puts "#{hero2.name} has won with #{hero2.hp} hp left"
          end
        end
    end   
  end

  def self.attack(attacker, defender)
    critdamge = attacker.critd.sample
    damage = attacker.dmg + critdamge
	  if defender.hp < 0
		  puts "#{defender.name} is already dead"
	  elsif defender.armor > damage	
		  puts "#{defender.name} has #{defender.armor = defender.armor - damage} armor left"
    elsif defender.armor < damage
      if defender.hp < 0
        puts "#{defender.name} has 0 hp left"
      elsif defender.hp > 0
        puts "#{defender.name} has #{defender.hp = (defender.armor + defender.hp) - damage} hp left"
      end
	  end
	end
end

class Hero
  attr_accessor :hp, :armor
  attr_reader :critd, :name, :dmg
	
  def initialize
    @hp = hp
    @armor = armor
    @dmg = dmg
    @name = name
    @critd = critd
  end
 end


class Warrior < Hero
  def initialize
    @hp = 100
    @armor = 25
    @dmg = 25
    @name = 'Reaper'
    @critd = [125, 0, 0, 0]
  end	
end

class Healer < Hero
  def initialize
    @hp = 60
    @armor = 0
    @dmg = 5
    @name = 'Mercy'
    @critd = [20, 0, 0, 0]
  end
end

class Mage < Hero
  def initialize
    @hp = 40
    @armor = 0
    @dmg = 100
    @name = 'Moira'
    @critd = [100, 0]
 end
end

class Tank < Hero
  def initialize
    @hp = 100
    @armor = 100
    @dmg = 0.5
    @name = 'Rein'
    @critd = [50, 0]
 end
end

