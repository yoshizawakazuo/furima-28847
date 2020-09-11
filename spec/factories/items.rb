FactoryBot.define do
  factory :item do
    image                {"aaa"}
    name                 {"キングダム全巻"}
    info                 {"単行本キングダム１巻から最新５８巻まで"}
    items_status_id         {1}
    preparation_day_id      {1}
    postage_payer_id        {1}
    area_id                 {1}
    category_id             {1}
    price                   {30000}
    # association :user

  end
end