require "./lib/regular_item.rb"
require "./lib/gilded_rose.rb"

describe RegularItem do

  it "does not change the name of a regular item" do
    item = RegularItem.new("Test Item", 0, 0)
    GildedRose.new(item).update_quality
    expect(item.name).to eq("Test Item")
  end

end
