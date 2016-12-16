require("spec_helper")

describe("RESTful routes", {:type => :feature}) do

  describe("store functionality through application") do
    it("allows a user to add a new store") do
      visit('/')
      fill_in('store-name', :with => "Foot Cubby")
      click_button('Add store')
      expect(page).to have_content("Foot Cubby")
    end
  end

  describe("brand functionality through application") do
    it("allows a user to add a new brand") do
      visit('/')
      fill_in('brand-name', :with => "Subdidas")
      click_button('Add brand')
      expect(page).to have_content("Subdidas")
    end
  end

  describe("GET an individual store") do
    it('allows a user to visit a single page for a store') do
      @store = Store.create({:name => "Foot Cubby"})
      visit("/stores/#{@store.id}")
      expect(page).to have_content("Foot Cubby")
    end
  end

  describe("GET an individual brand") do
    it('allows a user to visit a single page for a brand') do
      @brand = Brand.create({:name => "Subdidas"})
      visit("/brands/#{@brand.id}")
      expect(page).to have_content("Subdidas")
    end
  end

  describe("PATCH store") do
      it('allows a user to update a store') do
        @store = Store.create({:name => "Foot Cubby"})
        visit("/stores/#{@store.id}")
        fill_in('new-store-name', :with => "Foot Cubby")
        click_button('Update Store')
        expect(page).to have_content("Foot Cubby")
      end
    end
  describe("DELETE store") do
    it('allows a user to delete a store') do
      @store = Store.create({:name => "Foot Cubby"})
      visit("/stores/#{@store.id}")
      click_button('Delete Store')
      expect(page).not_to have_content(@store.name)
      expect(Store.all).to eq([])
    end
  end

  describe("PATCH brand") do
      it('allows a user to update a brand') do
        @brand = Brand.create({:name => "Foot Cubby"})
        visit("/brands/#{@brand.id}")
        fill_in('new-brand-name', :with => "Foot Cubby")
        click_button('Update Brand')
        expect(page).to have_content("Foot Cubby")
      end
    end
  describe("DELETE brand") do
    it('allows a user to delete a brand') do
      @brand = Brand.create({:name => "Multdidas"})
      visit("/brands/#{@brand.id}")
      click_button('Delete Brand')
      expect(page).not_to have_content(@brand.name)
      expect(Brand.all).to eq([])
    end
  end

  describe("associating") do
    it("allows a user to associate a store with a brand") do
      @store = Store.create({:name => "Foot Cubby"})
      @brand = Brand.create({:name => "Subdidas"})
      visit("/stores/#{@store.id}")
      select("Subdidas", :from => "brand_id")
      click_button("Submit")
      expect(page).to have_content("Subdidas")
    end
  end

  describe("associating") do
    it("allows a user to associate a brand with a store") do
      @store = Store.create({:name => "Foot Cubby"})
      @brand = Brand.create({:name => "Subdidas"})
      visit("/brands/#{@brand.id}")
      select("Foot Cubby", :from => "store_id")
      click_button("Submit")
      expect(page).to have_content("Foot Cubby")
    end
  end

end
