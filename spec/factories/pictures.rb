FactoryGirl.define do
  factory :picture do
    page :page
    picture { Faker::File.file_name('','baz', 'png') }
    


  end
end