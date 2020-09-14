module ApplicationHelper
  def short_date_format(date)
    date.strftime("%b %d, %H:%M")
  end
end
