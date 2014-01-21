# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => 'Users' do
  	sequence :name do |i|
      "user#{i}"
    end
  	email "#{user}@example.com"
  	password "testtest"
  	password_confirmation "testtest"
  end
end
