require("spec_helper")

describe(Brand) do
  it("validates presence of name") do
    brand = Brand.new({:name => ""})
    expect(brand.save()).to eq(false)
  end

  it("capitalizes name of brand") do
    brand = Brand.create({:name => "subdidas"})
    expect(brand.name).to eq("Subdidas")

  end
end
