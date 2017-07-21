FactoryGirl.define do
  sequence :name, ["Billy Joe", "Dale", "Joe Montana"].cycle do |n|
    "#{n} name"
  end

  sequence :email, ["Homer@woohoo.com", "KennyChez@gmail.com", "PhilC@hotmail.com"].cycle do |n|
    "#{n}"
  end

  sequence :tag_number, [1,2,3,4,5,67,8,54,235,6334,341,6535,342].cycle do |n|
    n
  end

end
