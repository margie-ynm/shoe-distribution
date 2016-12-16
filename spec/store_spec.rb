require("spec_helper")

describe(Store) do
  it("validates presence of name") do
    store = Store.new({:name => ""})
    expect(store.save()).to eq(false)
  end

  it("capitalizes name of brand") do
    store = Store.create({:name => "footcubby"})
    expect(store.name).to eq("Footcubby")
  end
end
