# coding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work_detail do
  	job_class 1
  	period_form "2013/04/01"
  	period_to  "2013/05/01"
  	personnel_num 2
  	role "PG"
  	subject "一般ユーザ向けECサイト開発"
  	work_class 1
  	work_id 1
  	work_role 1

  	trait :detail1 do
  		title "①一般ユーザ向けECサイト開発作業\n②プロジェクトリーダとして要件定義および設計を担当\n③現行業務のヒアリング、要件の整理、基本設計の作成、\n　開発作業における課題の管理、ユーザとの折衝を担当。\n　ECサイトは社内パッケージを用いて、カスタマイズにより実装。\n　コーディングはSQL作成と、ビジネスロジック作成のみ経験。"
  	end
  	trait :detail2 do
  		title "①某企業の与信契約管理業務システムの開発\n②サブリーダとして数名の管理と、技術サポート役として\n　二次開発に参加\n③一次開発の品質に問題があり、二次開発と併せて一次開発分の\n　品質改善を目的とした作業を担当"
  	end
  	trait :detail3 do
  		title "①某メーカの通信規約統制パッケージ開発\n②サブリーダとして2名の管理と、開発を担当\n③ハードの流用性の向上を目的とした、通信インタフェース\n　パッケージの開発作業"
  	end

  	factory :work_detail1, traits: [:detail1]
  	factory :work_detail2, traits: [:detail2]
  	factory :work_detail3, traits: [:detail3]
  end
end
