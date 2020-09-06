FactoryBot.define do
  factory :user do
    nickname              {"あべ"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {password}
    first_name            {"山田"}
    first_name_kana       {"ヤマダ"}
    last_name             {"隆太郎"}
    last_name_kana        {"リクタロウ"}
    birth_day             {"1999-12-12"}
  end
end