FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
    school "Example University"
    address "123 Example Street, Example, Example 10001"
    phone_number "2134823699"

    factory :admin do
      admin true
    end
  end

   factory :micropost do
    content "Lorem ipsum"
    user
  end
end