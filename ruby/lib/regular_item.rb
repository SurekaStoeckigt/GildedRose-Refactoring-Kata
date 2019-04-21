require_relative "item"

#using abstraction and class inheritence to make code easeir to read
class RegularItem < Item

  def alter_quality
    @sell_in -= 1

    if @name == "Aged Brie"
      alter_brie
    elsif @name == "Backstage passes to a TAFKAL80ETC concert"
      backstage_passes_to_concert
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

def backstage_passes_to_concert
  @sell_in > 10 ? @quality += 1 : @quality
  @sell_in > 5 && @sell_in <=10 ? @quality +=2 : @quality
  @sell_in > 0 && @sell_in < 5 ? @quality += 3 : @quality
end

end
