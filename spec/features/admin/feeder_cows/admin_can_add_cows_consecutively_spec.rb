require 'rails_helper'

describe "Admin can visit Feeder Cows Index and See All" do
  scenario "for admin there are additional links available" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit '/feeder_cows'

    click_on "Add New Cow/s"

    expect(current_path).to eq new_admin_feeder_cow

    expect(page).to have_field "Tag Number"
    fill_in "feeder_cow[:tag_number]", with: 3

    expect(page).to have_drop_down "Residence"
    fill_in "feeder_cow[:residence]", with: "Bull Pasture"


    expect(page).to have_content feeder_cow_two.tag_number
    expect(page).to have_link "#{feeder_cow_two.residence.name}"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Edit"

    click_link('Delete', match: :first)

    expect(current_path).to eq admin_feeder_cows
    expect(page).to have_content feeder_cow_two.name
    expect(page).to have_link "Add Cows"
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"

    click_link('Edit')

    expect(current_path).to eq edit_admin_feeder_cow_path(feeder_cow_two)
  end

  describe "User can view index of feeder_cows" do
    # scenario "instead they are redirected to a statistics page about companies" do
    scenario "instead of seeing edit and delete they see lot and cows" do
      @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
      feeder_cow = create(:feeder_cow)
      feeder_cow_two = creat(:feeder_cow)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/feeder_cows'

      expect(page).to have_link("#{feeder_cow.residence.name}")
      expect(page).to have_content("#{feeder_cow.tag_number}")
      expect(page).to not_have "Edit"
      expect(page).to not_have "Delete"
      expect(page).to not_have "Add Cows"
    end
  end
end
