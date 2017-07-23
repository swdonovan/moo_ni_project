require 'rails_helper'


describe "Admin can create/input a ranch transaction" do
  scenario "for sale" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/ranch_transactions/new'
    select "Beau's Bovines", from: "ranch_transaction[company_id]" #drop
    fill_in "ranch_transaction[amount]", with: 8800.00
    select "Sell", from: "ranch_transaction[transaction_type]" #drop
    click_button "Create"

    expect(current_path).to eq(admin_ranch_transactions_path)
    expect(page).to have_content("Beau's Bovines")
    expect(page).to have_content(8800.00)
  end

  scenario "for purchase" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/ranch_transactions/new'
    select "Beau's Bovines", from: "ranch_transaction[company_id]" #drop
    fill_in "ranch_transaction[amount]", with: 8800.00
    select "Purchase", from: "ranch_transaction[transaction_type]" #drop
    click_button "Create"

    expect(current_path).to eq(admin_ranch_transactions_path)
    expect(page).to have_content("Beau's Bovines")
    expect(page).to have_content(8800.00)
  end
end


describe "User can't create/input a ranch transaction" do
  scenario "for either sale/purchase" do
    @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit 'admin/ranch_transactions/new'

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
