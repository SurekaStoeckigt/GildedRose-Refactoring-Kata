# require File.join(File.dirname(__FILE__), 'gilded_rose')
require "./lib/gilded_rose.rb"

describe GildedRose do

  describe "#update_quality" do

    it "does not change the name" do
      gilded_rose = GildedRose.new(Item.new("foo", 0, 0))
      gilded_rose.update_quality()
      expect(gilded_rose.name).to eq "foo"
    end

    it "does not decrease the quality of an item if it already at 0" do
      gilded_rose = GildedRose.new(Item.new("foo", 0, 0))
      gilded_rose.update_quality()
      expect(gilded_rose.name).to eq "foo"
      expect(gilded_rose.quality).to eq(0)
    end

    it "will decrease the quality of an item that is greater than 0 and not Aged Brie" do
      gilded_rose = GildedRose.new(Item.new("foo", 1, 2))
      gilded_rose.update_quality()
      expect(gilded_rose.name).to eq "foo"
      expect(gilded_rose.quality).to eq(1)
    end

    it "the aged brie increases in quality as it gets older" do
      gilded_rose = GildedRose.new(Item.new("Aged Brie", 0, 0))
      gilded_rose.update_quality()
      expect(gilded_rose.name).to eq "Aged Brie"
      expect(gilded_rose.quality).to eq(1)
    end

    it "will not increase the quality of Aged Brie if the quality is already 50" do
      gilded_rose = GildedRose.new(Item.new("Aged Brie", 1, 50))
      gilded_rose.update_quality()
      expect(gilded_rose.name).to eq "Aged Brie"
      expect(gilded_rose.quality).to eq(50)
    end

    it "the Sulfuras item never has to be sold and never decreases in quality" do
      gilded_rose = GildedRose.new(Item.new("Sulfuras", 1000, 100))
      gilded_rose.update_quality()
      expect(gilded_rose.quality).to eq(100)
    end

  end
end
