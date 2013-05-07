# encoding:utf-8
class Util
  def self.fullname(family,given)
    _f = family.nil? ? "" : family
    _g = given.nil? ? "" : given
    _f + " " + given
  end
  
  def self.nenrei(birthday)
    day = Date.today
    # 取り敢えず版うるう年考慮無し
    # TODO
    (day-birthday).to_i/365
  end
end