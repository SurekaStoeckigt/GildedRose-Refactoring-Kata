require_relative "item"

#using abstraction and class inheritence to make code easeir to read
class RegularItem < Item

  def alter_quality
    if @name == "Aged Brie"

      return @quality +=1
    end

    if @quality > 0 && @sell_in > 0
      @sell_in -=1
      @quality -=1
    elsif @quality > 0 && @sell_in == 0
      @quality -=2
    end
    @quality
  end

end
