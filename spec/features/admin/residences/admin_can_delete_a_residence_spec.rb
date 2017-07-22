require 'rails_helper'

describe "Admin can uncommission a residence" do
  scenario "if they are an admin user" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    residence_one = Residence.create(name: "Billy Sue", max_capacity: 12500)
    residence_two = Residence.create(name: "Bob", max_capacity: 1500)

    expect(Residence.count).to eq(2)
    expect(residence_one.name).to eq("Billy Sue")
    expect(residence_two.name).to eq("Bob")

    visit admin_residence_path(residence_two)
    click_link("Delete")

    expect(Residence.count).to eq(1)
    expect(page).to have_content("Billy Sue")
    expect(page).to have_content("Bob was successfully deleted")
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
