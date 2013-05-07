# encoding:utf-8
class Valiable
  Genders_list = [['男性', 0],['女性', 1]]
  Tech_list = [['技術者', 1], ['営業', 2]]
  Staff_list = [['正社員', 1], ['契約社員', 2], ['個人事業主', 3], ['関連会社', 4]]
  Role_list = {0 => "一般ユーザ" , 1 => "管理者"}

  def self.gender_judge(gender)
    _gender_name = Genders_list.select{|s| s[1] == gender}
    _gender_name.empty? ? "Unknown" : _gender_name[0][0]
  end
  
  def self.role_judge(role)
    roles = Role_list
    role_name = roles[role]
  end
  
end