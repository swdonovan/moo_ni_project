require 'rails_helper'

describe "Admin can view all ranch transactions" do
  scenario "for sales/purchases" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)
    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")
    @ranch_transaction = RanchTransaction.create(company_id: @company.id, amount: 7500, transaction_type: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/ranch_transactions'

    expect(current_path).to eq(admin_ranch_transactions_path)
    expect(page).to have_content("Beau's Bovines")
    expect(page).to have_content(7500)
  end
end

describe "User can't view ranch transactions" do
  scenario "for either sale/purchase" do
    @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
    @company = Company.create(name: "Beau's Bovines", city: "Stillwater", state: "Montana")
    ranch_transaction = create(:ranch_transaction)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit 'admin/ranch_transactions/new'

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
