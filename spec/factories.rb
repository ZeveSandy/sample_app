FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
    school "Example University"
    address "123 Example Street, Example, Example 10001"
    phone_number "2134823699"
  end
end