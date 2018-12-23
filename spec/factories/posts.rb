FactoryBot.define do
  factory :post do
    description "MyText"
    user
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }

  	factory :post_with_picture do
  	    after :create do |b|
  	    	b.update_column(:picture, "spec/fixtures/files/image.png")
  	    end
  	end
  end
end
