# # require File.join(File.dirname(__FILE__), 'gilded_rose')
require "./lib/gilded_rose.rb"
#
describe GildedRose do

  describe "#update_quality" do
#
    it "updates quality of each item" do
      item1 = double("Item")
      item2 = double("Item")
      item3 = double("Item")
      expect(item1).to receive_messages(alter_quality: nil )
      expect(item2).to receive_messages(alter_quality: nil)
      expect(item3).to receive_messages(alter_quality: nil)
      GildedRose.new(item1).update_quality()
      GildedRose.new(item2).update_quality()
      GildedRose.new(item3).update_quality()
    end
#
#     it "does not decrease the quality of an item if it already at 0" do
#       items = Item.new("foo", 0, 0)
#       GildedRose.new(items)
#       GildedRose.new(items).update_quality()
#       expect(items[0].name).to eq "foo"
#       expect(items[0].quality).to eq(0)
#     end
#
#     it "will decrease the quality of an item that is greater than 0 and not Aged Brie" do
#       items = Item.new("foo", 1, 2)
#       GildedRose.new(items)
#       GildedRose.new(items).update_quality()
#       expect(items[0].name).to eq "foo"
#       expect(items[0].quality).to eq(1)
#     end
#
#     it "the aged brie increases in quality as it gets older" do
#       items = Item.new("Aged Brie", 0, 0)
#       GildedRose.new(items)
#       GildedRose.new(items).update_quality()
#       expect(items[0].name).to eq "Aged Brie"
#       expect(items[0].quality).to eq(1)
#     end
#
#     it "will not increase the quality of Aged Brie if the quality is already 50" do
#       items = Item.new("Aged Brie", 1, 50)
#       GildedRose.new(items)
#       GildedRose.new(items).update_quality()
#       expect(items[0].name).to eq "Aged Brie"
#       expect(items[0].quality).to eq(50)
#     end
#
#     it "the Sulfuras item never has to be sold and never decreases in quality" do
#       gilded_rose = GildedRose.new(Item.new("Sulfuras", 1000, 100))
#       GildedRose.new(items).update_quality()
#       expect(items[0].quality).to eq(100)
#     end
#
  end
end
