require "./lib/special_item.rb"

describe SpecialItem do

  context "item isi Sulfuras, and does not need to be sold" do

    it "does not change sellIn " do
      item = SpecialItem.new("Sulfuras", 10, 10)
      GildedRose.new(item).update_quality
      expect(item.sell_in).to eq(10)
    end

    it "it does not change its quality" do
      item = SpecialItem.new("Sulfuras", 10, 10)
      GildedRose.new(item).update_quality
      expect(item.quality).to eq(10)
    end
  end

end
