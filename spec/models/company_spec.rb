require 'rails_helper'

RSpec.describe Company, type: :model do
  it "can exist with required attributes" do
    company = Company.create(name: "Los Pollos Hermanos", city: "Albuquerque", state: "New Mexico")

    expect(Company.last.name).to eq("Los Pollos Hermanos")
    expect(company).to be_valid
    expect(Company.count).to eq(1)
  end

  it "can't be created without name" do
    company = Company.create(city: "Woodhill", state: "Pennsyltucky")

    expect(company).to be_invalid
    expect(Company.count).to eq(0)
  end

  it "can't be created without specified city" do
    company = Company.create(name: "Sterling Cooper", state: "New York")

    expect(company).to be_invalid
    expect(Company.count).to eq(0)
  end

  it "can't be created without specified state" do
    company = Company.create(name: "Turing", city: "Denver")

    expect(company).to be_invalid
    expect(Company.count).to eq(0)
  end

end
