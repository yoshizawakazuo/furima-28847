FactoryBot.define do
    factory :item_order do
      postal_code    { '123-1234' }
      area_id        { 1 }
      house_number   { '青山1-1-1' }
      city           { '港区' }
      building_name  { 'デザインズマンション１１０１' }
      phone_number   {'09012345678'}
    end
  end