require 'rails_helper'

describe "Admin can edit a ranch transaction" do
  scenario "for correcting an entry" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)
    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")

    ranch_transaction = create(:ranch_transaction)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/ranch_transactions'
    expect(page).to have_content(1.00)

    click_link('Edit', match: :first)

    select "Beau's Bovines", from: "ranch_transaction[company_id]" #drop
    fill_in "ranch_transaction[amount]", with: 550.00

    click_button "Update"

    expect(current_path).to eq(admin_ranch_transactions_path)
    expect(page).to have_content("Beau's Bovines")
    expect(page).to have_content(550.00)
    expect(page).to_not have_content(1.00)
  end

end

describe "User can't edit ranch transactions" do
  scenario "for either sale/purchase" do
    @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")
    ranch_transaction = create(:ranch_transaction)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit 'admin/ranch_transactions/'

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
