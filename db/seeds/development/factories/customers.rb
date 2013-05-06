# -*- encoding: UTF-8 -*-

FactoryGirl.define do
  
  factory :customer do 
    factory :customer_humannet do
      name "Human-net"
      postalcode 3
      address "Saitama"
      website "http://www.human-net.co.jp"
      phone_num "090-1111-2222"
    end
    
    factory :customer_google do
      name "Google Japan"
      postalcode 1066126
      address "東京都港区六本木6丁目10−1 六本木ヒルズ森タワー"
      website "http://www.google.com"
      phone_num "03-6384-9000"
    end
    
    factory :customer_apple do
      name "Apple Japan"
      postalcode 1631480
      address "東京都新宿区西新宿3-20-2 東京オペラシティタワー"
      website "http://www.google.com"
      phone_num "0120-27753-5"
    end
    
    factory :customer_line do
      name "LINE株式会社"
      postalcode 1508510
      address "東京都渋谷区渋谷2-21-1 渋谷ヒカリエ 27階"
      website "http://www.google.com"
      phone_num "999-999-999"
    end
    
    factory :customer_amazon do
      name "Amazon Japan"
      postalcode 1530064
      address "東京都目黒区下目黒1丁目8−１ アルコタワーアネックス"
      website "http://www.google.com"
      phone_num "0120-999-373"
    end
      
  end
end
