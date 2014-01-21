# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    sequence :name do |i|
      "Item#{i}"
    end
    description "generic product description"
    price 199.95
  end
end
