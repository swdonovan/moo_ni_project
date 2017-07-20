FactoryGirl.define do
  sequence :name, ["Billy Joe", "Dale", "Joe Montana"].cycle do |n|
    "#{n}"
  end

  sequence :email, ["Homer@woohoo.com", "KennyChez@gmail.com", "PhilC@hotmail.com"].cycle do |n|
    "#{n}"
  end

end
