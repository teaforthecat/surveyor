require "rails_helper"

RSpec.feature "First Assignment", type: :feature do

  let(:admin) { create(:admin_user) }
  before :each do
    login_as admin, scope: :admin
  end
  scenario "User creates a new Survey" do
    visit "/admin"
    save_and_open_page
    click_link "Surveys"
    click_link "Create New Survey"

    expect(page).to have_text("New Survey")
  end
end
