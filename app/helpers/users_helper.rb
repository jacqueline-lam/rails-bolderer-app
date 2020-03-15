module UsersHelper
  def sends_this_month(user)
    user.sends.where('date_sent BETWEEN ? AND ?', Time.zone.today.beginning_of_month, Time.zone.today + 1.day)
  end
end