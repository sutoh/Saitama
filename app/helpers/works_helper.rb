module WorksHelper
  def full_name(f,g)
    _f = f || ""
    _g = g || ""
    _f + " " + _g
  end
end
