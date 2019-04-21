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

    context "before sell in" do
    it "raises its quality by 1 after 1 day" do
      item = RegularItem.new("Aged Brie", 1, 0)
      GildedRose.new(item).update_quality
      expect(item.quality).to eq(1)
    end

    it "will not not raise the quality beyond 50" do
      item =  RegularItem.new("Aged Brie", 1, 50)
      GildedRose.new(item).update_quality
      expect(item.quality).to eq(50)
      end

    end

    context "after sellIn" do

      it "raises its quality by 2 after sell in" do
        item = RegularItem.new("Aged Brie", 0, 0)
        GildedRose.new(item).update_quality
        expect(item.quality).to eq(2)
      end

      it "will not raise its quality above 50 after sellIn" do
        item = RegularItem.new("Aged Brie", 0, 49)
        GildedRose.new(item).update_quality
        expect(item.quality).to eq(50)
      end
    end

    context "when item is Backstage passed to a TAFKAL80ET concert" do

      context "when sellIn is greater than 10" do

        it "increases its quality by 1 after each day" do
          item = RegularItem.new("Backstage passes to a TAFKAL80ETC concert", 15, 0)
          GildedRose.new(item).update_quality
          expect(item.quality).to eq(1)
        end

        it "increases its quality by 1 if its already at 50" do
          item = RegularItem.new("Backstage passes to a TAFKAL80ETC concert", 15, 50)
          GildedRose.new(item).update_quality
          expect(item.quality).to eq(50)
        end
      end

    context "when sellIn is less than or equal to 10 but greater than 5" do

      it "increases its quality by 2 after each day" do
        item = RegularItem.new("Backstage passes to a TAFKAL80ETC concert", 10,0)
        GildedRose.new(item).update_quality
        expect(item.quality).to eq(2)
      end
    end

    end
    end
end
