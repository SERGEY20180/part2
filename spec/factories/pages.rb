FactoryGirl.define do
  factory :page do
    title { Faker::Name.first_name  }
    string { Faker::Name.last_name }
    description { Faker::Name.name }
    text { Faker::Name.name }
    picture 'baz.png'

    factory :invalid_page do
      title nil
    end
   
  end
end