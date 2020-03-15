module ProblemsHelper
  # create a datetime, this method should convert it from datetime
  # 'Sun, 08 Mar 2020 21:51:37 UTC +00:00' to 'Month, year'
  def format_timestamp_to_set_date(problem)
    problem.created_at.strftime("%B, %Y")
  end

  def display_styles(problem)
    problem.styles.map(&:name).join(', ')
  end

end