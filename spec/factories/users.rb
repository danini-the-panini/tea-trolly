# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => 'Users' do
  	name "John Doe"
  	email "johndoe@example.com"
  	password "testtest"
  	password_confirmation "testtest"
  end
end
