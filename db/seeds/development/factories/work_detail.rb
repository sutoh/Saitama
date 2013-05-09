# -*- encoding: UTF-8 -*-
FactoryGirl.define do
  
  factory :work_detail do
    #lee
    factory :lee_detail_human do
      work_id { Work.where("employee_id = ? and customer_id = ?",
                            Employee.where(user_id: 
                              User.where(login_id: "lee.jisun").first.id
                            ).first.id,
                            Customer.where(name: "Human-net").first.id).first.id}
      title "一般ユーザ向けECサイト開発"
      subject "①一般ユーザ向けECサイト開発作業\n②プロジェクトリーダとして要件定義および設計を担当\n③現行業務のヒアリング、要件の整理、基本設計の作成、\n　開発作業における課題の管理、ユーザとの折衝を担当。\n　ECサイトは社内パッケージを用いて、カスタマイズにより実装。\n　コーディングはSQL作成と、ビジネスロジック作成のみ経験。"
      work_class 1
      job_class 2
      period_form Date.strptime("2010/09/01", "%Y/%m/%d")
      period_to Date.strptime("2011/08/01", "%Y/%m/%d")
      personnel_num 200
    end
    
    factory :lee_detail_google do
      work_id { Work.where("employee_id = ? and customer_id = ?",
                            Employee.where(user_id: 
                              User.where(login_id: "lee.jisun").first.id
                            ).first.id,
                            Customer.where(name: "Google Japan").first.id).first.id}
      title "（某社向け）与信契約管理業務システム開発"
      subject "①某企業の与信契約管理業務システムの開発\n②サブリーダとして数名の管理と、技術サポート役として\n　二次開発に参加\n③一次開発の品質に問題があり、二次開発と併せて一次開発分の\n　品質改善を目的とした作業を担当"
      work_class 1
      job_class 2
      period_form Date.strptime("2010/02/01", "%Y/%m/%d")
      period_to Date.strptime("2010/08/01", "%Y/%m/%d")
      personnel_num 50
    end
    
    factory :lee_detail_apple do
      work_id { Work.where("employee_id = ? and customer_id = ?",
                            Employee.where(user_id: 
                              User.where(login_id: "lee.jisun").first.id
                            ).first.id,
                            Customer.where(name: "Google Japan").first.id).first.id}
      title "通信規約統制パッケージ開発発"
      subject "①某メーカの通信規約統制パッケージ開発\n②サブリーダとして2名の管理と、開発を担当\n③ハードの流用性の向上を目的とした、通信インタフェース\n　パッケージの開発作業"
      work_class 1
      job_class 2
      period_form Date.strptime("2009/03/01", "%Y/%m/%d")
      period_to Date.strptime("2009/08/01", "%Y/%m/%d")
      personnel_num 5000
    end
    
    factory :lee_detail_apple2 do
      work_id { Work.where("employee_id = ? and customer_id = ?",
                            Employee.where(user_id: 
                              User.where(login_id: "lee.jisun").first.id
                            ).first.id,
                            Customer.where(name: "Apple Japan").first.id).first.id}
      title "某社一般ユーザ向けマンション管理者・居住者用システム開発"
      subject "①某マンションの管理者・居住者用システム開発\n②プレイングマネージャとしてメンバー6名の管理と開発を担当\n③設計と併せコアアーキテクチャの策定、実装を行い開発を支援\n　メンバの経験が浅いため、リファクタリングでの開発を行える\n　環境の作成とOJTによる技術教育を併せて実施"
      work_class 1
      job_class 2
      period_form Date.strptime("2007/12/1", "%Y/%m/%d")
      period_to Date.strptime("2008/8/1", "%Y/%m/%d")
      personnel_num 3
    end
    
    factory :lee_detail_line do
      work_id { Work.where("employee_id = ? and customer_id = ?",
                            Employee.where(user_id: 
                              User.where(login_id: "lee.jisun").first.id
                            ).first.id,
                            Customer.where(name: "LINE株式会社").first.id).first.id}
      title "一般企業向けビル管理システム開発"
      subject "①某メーカのビル管理システムパッケージの拡張開発\n②プレイングマネージャとしてメンバー管理と開発を担当\n③ビル管理システム本体の拡張、GUIによるWeb機能の追加、\n　異なる通信プロトコルの橋渡し等\n　設計開発全般、保守、納品先からの問い合わせ等\n　常駐先での技術講習も実施\n"
      work_class 1
      job_class 2
      period_form Date.strptime("2006/9/1", "%Y/%m/%d")
      period_to Date.strptime("2009/2/1", "%Y/%m/%d")
      personnel_num 50
    end
    
    factory :lee_detail_amazon do
      work_id { Work.where("employee_id = ? and customer_id = ?",
                            Employee.where(user_id: 
                              User.where(login_id: "lee.jisun").first.id
                            ).first.id,
                            Customer.where(name: "Amazon Japan").first.id).first.id}
      title "（某企業向け）MR向け管理システム"
      subject "①某企業向けの医療従事者情報の管理システム\n②メンバとして開発に参加\n③MR（医療従事者）を顧客とした営業支援システムの開発"
      work_class 1
      job_class 2
      period_form Date.strptime("2005/11/1", "%Y/%m/%d")
      period_to Date.strptime("2006/7/1", "%Y/%m/%d")
      personnel_num 999
    end
    
    factory :lee_detail_amazon2 do
      work_id { Work.where("employee_id = ? and customer_id = ?",
                            Employee.where(user_id: 
                              User.where(login_id: "lee.jisun").first.id
                            ).first.id,
                            Customer.where(name: "Amazon Japan").first.id).first.id}
      title "（某地銀向け）ネットバンキングシステム開発"
      subject "①某地銀向けのネットバンキングシステム開発\n②メンバとして開発に参加\n③振替、振込、外為等のプレゼンテーションロジック開発を担当"
      work_class 1
      job_class 2
      period_form Date.strptime("2005/4/1", "%Y/%m/%d")
      period_to Date.strptime("2005/10/1", "%Y/%m/%d")
      personnel_num 100
    end
  end
end
