require("spec_helper")

describe("RESTful routes", {:type => :feature}) do

  describe("brand functionality through application") do
    it("allows a user to add a new brand") do
      visit('/')
      fill_in('brand-name', :with => "subdidas")
      click_button('Add brand')
      expect(page).to have_content("subdidas")
    end
  end

  describe("store functionality through application") do
    it("allows a user to add a new store") do
      visit('/')
      fill_in('store-name', :with => "footcubby")
      click_button('Add store')
      expect(page).to have_content("footcubby")
    end
  end

  describe("GET a individual store") do
    it('allows a user to visit a single page for a store') do
      @store = Store.create({:name => "footcubby"})
      visit("/stores/#{@store.id}")
      expect(page).to have_content("footcubby")
    end
  end

  describe("GET a individual brand") do
    it('allows a user to visit a single page for a brand') do
      @brand = Brand.create({:name => "subdidas"})
      visit("/brands/#{@brand.id}")
      expect(page).to have_content("subdidas")
    end
  end

end
