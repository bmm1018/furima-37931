FactoryBot.define do
  factory :buy_profile do
    token                       { "tok_abcdefghijk00000000000000000" }
    postal_code                 { "123-4567" }
    prefectures_id              { 2 }
    city                        { "東京都" }
    address                     { "青山1-1-1" }
    building                    { "東京ハイツ" }
    phone_number                { "09012345678" }
    item_id                     { 2 }
  end
end
