require "./lib/regular_item.rb"
require "./lib/gilded_rose.rb"

describe RegularItem do

  it "does not change the name of a regular item" do
    item = RegularItem.new("Test Item", 0, 0)
    GildedRose.new(item).update_quality
    expect(item.name).to eq("Test Item")
  end

  it "after one day, the SellIn value gets lowered" do
    item = RegularItem.new("Test Item", 1, 1)
    GildedRose.new(item).update_quality
    expect(item.sell_in).to eq(0)
  end

  it "will not decrease the quality of an item if it is already 0" do
    item = RegularItem.new("Test Item", 1, 0)
    GildedRose.new(item).update_quality
    expect(item.quality).to eq(0)
  end

  it "will decrease the quality of an item if its quality is greater than 0" do
    item = RegularItem.new("Test Item", 1, 5)
    GildedRose.new(item).update_quality
    expect(item.quality).to eq(4)
  end

  context "after sell_in" do
    it "lowers the quality by 2 after sell in date" do
      item = RegularItem.new("Test Item", 0, 2)
      GildedRose.new(item).update_quality
      expect(item.quality).to eq(0)
    end
  end

  context "when the item is Aged Brie" do

    it "raises its quality by 1 after 1 day" do
      item = RegularItem.new("Aged Brie", 1, 0)
      GildedRose.new(item).update_quality
      expect(item.quality).to eq(1)
    end

    it "qill not not raise the quality beyond 50" do
      item =  RegularItem.new("Aged Brie", 1, 50)
      GildedRose.new(item).update_quality
      expect(item.quality).to eq(50)
      end
    end

  end
