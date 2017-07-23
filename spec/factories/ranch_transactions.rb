FactoryGirl.define do
  factory :ranch_transaction do
  company
  date Date.today
  amount 1.00
  end
end
