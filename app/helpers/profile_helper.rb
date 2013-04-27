module ProfileHelper
  def nenrei(birthday)
    day = Date.today
    # 取り敢えず版うるう年考慮無し
    # TODO
    (day-birthday).to_i/365
  end
end
