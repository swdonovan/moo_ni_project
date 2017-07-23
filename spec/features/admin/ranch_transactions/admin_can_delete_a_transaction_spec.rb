require 'rails_helper'

describe "Admin can delete a ranch transaction" do
  scenario "if needed" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)
    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")

    ranch_transaction = create(:ranch_transaction)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/ranch_transactions'
    expect(page).to have_content(1.00)
    expect(RanchTransaction.count).to eq(1)

    click_link('Delete', match: :first)

    expect(RanchTransaction.count).to eq(0)
  end
end

describe "User can't delete a  ranch transactions" do
  scenario "for either sale/purchase" do
    @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")
    ranch_transaction = create(:ranch_transaction)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    expect(RanchTransaction.count).to eq(1)

    visit 'admin/ranch_transactions'

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
