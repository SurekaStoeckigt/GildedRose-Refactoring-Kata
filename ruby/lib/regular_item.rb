require_relative "item"

#using abstraction and class inheritence to make code easeir to read
class RegularItem < Item

  def alter_quality
    @sell_in -= 1
    
    if @name == "Aged Brie"
      alter_brie
    else
      alter_item
    end

    limits
end

private

def alter_brie
  @sell_in >=0 ? @quality += 1 : @quality += 2
end

def alter_item
  @sell_in < 0 ? @quality -= 2 : @quality -= 1
end

def limits
  @quality < 0 ? @quality = 0 : @quality
  @quality > 50? @quality = 50 : @quality
end
end
