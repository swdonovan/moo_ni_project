require 'rails_helper'

describe "Admin can uncommission a residence" do
  scenario "if they are an admin user" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    residence_one = create(:residence)
    residence_two = create(:residence)

    expect(Residence.count).to eq(2)
    expect(residence_one.name).to eq("Billy Joe")
    expect(residence_two.name).to eq("Dale")

    visit admin_residence_path(residence_two)
    click_link("Delete")

    expect(Residence.count).to eq(1)
    expect(page).to have_content("Billy Joe")
    expect(page).to have_content("Dale was successfully deleted")
  end
end

describe "User can't uncommission a residence" do
  scenario "for destroying a residence " do
    @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
    residence_one = create(:residence)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    expect(Residence.count).to eq(1)

    visit admin_residence_path(residence_one)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
