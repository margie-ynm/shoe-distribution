require("spec_helper")



describe("brand functionality through application", {:type => :feature}) do
  it("allows a user to add a new brand") do
    visit('/')
    fill_in('brand-name', :with => "subdidas")
    click_button('Add brand')
    expect(page).to have_content("subdidas")
  end
end

# describe("store functionality through application", {:type => :feature}) do
#   it("allows a user to add a new store") do
#     visit('/')
#     fill_in('store-name', :with => "footcuby")
#     click_button('Add store')
#     expect(page).to have_content("footcubby")
#   end
# end
