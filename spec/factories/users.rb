FactoryBot.define do
  #pass = Faker::Internet.password(8)
  factory :user do
    username{"meshistagram"}
    email{"meshistagram@gmail.com"}
    password{"foobar"}
    password_confirmation{"foobar"}
    confirmed_at=Time.now
  end
end
