require 'rails_helper'

RSpec.describe Residence, type: :model do
  it "can be created with name and capacity specified" do
    residence = Residence.create(name: "Waldorf Lot", max_capacity: 450)

    expect(residence).to be_valid
    expect(Residence.last.name).to eq("Waldorf Lot")
    expect(Residence.count).to eq(1)
  end

  it "can't be created without a name" do
    residence = Residence.create(max_capacity: 23)

    expect(residence).to be_invalid
    expect(Residence.count).to eq(0)
  end

  it "can't be created without capacity specified" do
    residence = Residence.create(name: "Four Seasons")

    expect(residence).to be_invalid
    expect(Residence.count).to eq(0)
  end
end
