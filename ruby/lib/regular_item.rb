require_relative "item"

#using abstraction and class inheritence to make code easeir to read
class RegularItem < Item

  def alter_quality
    if @quality > 0
      @sell_in -=1
      @quality -=1
    end
    @quality
  end

end
