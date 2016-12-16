require("spec_helper")

describe("RESTful routes", {:type => :feature}) do

  describe("store functionality through application") do
    it("allows a user to add a new store") do
      visit('/')
      fill_in('store-name', :with => "footcubby")
      click_button('Add store')
      expect(page).to have_content("footcubby")
    end
  end

  describe("brand functionality through application") do
    it("allows a user to add a new brand") do
      visit('/')
      fill_in('brand-name', :with => "subdidas")
      click_button('Add brand')
      expect(page).to have_content("subdidas")
    end
  end

  describe("GET an individual store") do
    it('allows a user to visit a single page for a store') do
      @store = Store.create({:name => "footcubby"})
      visit("/stores/#{@store.id}")
      expect(page).to have_content("footcubby")
    end
  end

  describe("GET an individual brand") do
    it('allows a user to visit a single page for a brand') do
      @brand = Brand.create({:name => "subdidas"})
      visit("/brands/#{@brand.id}")
      expect(page).to have_content("subdidas")
    end
  end

  describe("PATCH store") do
      it('allows a user to update a store') do
        @store = Store.create({:name => "footcubby"})
        visit("/stores/#{@store.id}")
        fill_in('new-store-name', :with => "foot cubby")
        click_button('Update Store')
        expect(page).to have_content("foot cubby")
      end
    end
  describe("DELETE store") do
    it('allows a user to delete a store') do
      @store = Store.create({:name => "footcubby"})
      visit("/stores/#{@store.id}")
      click_button('Delete Store')
      expect(page).not_to have_content(@store.name)
      # expect(Store.find(@store.id)).to eq(nil)
    end
  end

  describe("PATCH brand") do
      it('allows a user to update a brand') do
        @brand = Brand.create({:name => "footcubby"})
        visit("/brands/#{@brand.id}")
        fill_in('new-brand-name', :with => "foot cubby")
        click_button('Update Brand')
        expect(page).to have_content("foot cubby")
      end
    end
  describe("DELETE brand") do
    it('allows a user to delete a brand') do
      @brand = Brand.create({:name => "footcubby"})
      visit("/brands/#{@brand.id}")
      click_button('Delete Brand')
      expect(page).not_to have_content(@brand.name)
      # expect(Brand.find(@brand.id)).to eq(nil)
    end
  end

end
