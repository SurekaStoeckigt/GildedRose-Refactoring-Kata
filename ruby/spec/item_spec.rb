require "./lib/item.rb"

describe Item do
  it "each item is created with a name, sell in date, and quality" do
  item = Item.new("Test Item", 1, 10)
  expect(item.name).to eq("Test Item")
  expect(item.sell_in).to eq(1)
  expect(item.quality).to eq(10)
end
end
