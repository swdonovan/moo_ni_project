require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created as admin" do
    admin = User.create(name: "Clayton", email: "cc@factory.com",
                        password: "password", role: 1)

    expect(admin).to be_valid
    expect(admin.role).to eq("admin")
    expect(admin.admin?).to be_truthy
  end

  it "can be created as a default user" do
    default = User.create(name: "Jasper", email: "hotdog@cake.com",
                          password: "123")

    expect(default).to be_valid
    expect(default.role).to eq("default")
    expect(default.default?).to be_truthy
    expect(default.admin?).to be_falsey
  end

  it "must have a unique email to sign in" do
    default = User.create(name: "Ray", email: "coolcatt99@aol.com",
                          password: "password")
    admin   = User.create(name: "Klaus", email: "coolcatt99@aol.com",
                          password: "9989")

    expect(admin).to be_invalid
    expect(User.count).to eq(1)
  end

  it "must enter a name when creating account" do
    default = User.create(email: "hocuspocus@askjeeves.com", password: "lamp")

    expect(default).to be_invalid
    expect(User.count).to eq(0)
  end

  it "must enter an email when creating account" do
    admin = User.create(name: "Horatio", password: "tacofever")

    expect(admin).to be_invalid
    expect(User.count).to eq(0)
  end

  it "must enter a password when creating and accessing account" do
    default = User.create(name: "Wilhelm", email: "gogos@myspace.com")

    expect(default).to be_invalid
    expect(User.count).to eq(0)
  end

end
