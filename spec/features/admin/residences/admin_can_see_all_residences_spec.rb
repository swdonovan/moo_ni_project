require 'rails_helper'

describe "Admin can visit Residences Index" do ## need to incorporate occoupation display
  scenario "and sees all lots/pastures and whether they are occupied" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    residence = create(:residence)
    residence_two = create(:residence)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/residences'

    expect(page).to have_content residence.name
    expect(page).to have_content residence_two.name
  end

  describe "User can not view index of residences" do
    # scenario "instead they are redirected to a statistics page about residences" do
    scenario "instead they are redirected to the error page" do
      @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit 'admin/residences/new'

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
