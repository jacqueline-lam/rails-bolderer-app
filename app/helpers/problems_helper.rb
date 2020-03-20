# Model code isn't concerned with presentation logic
# Extract presentation logic from multiple views with helpers

module ProblemsHelper
  # Create a datetime, this method should convert it from datetime
  # 'Sun, 08 Mar 2020 21:51:37 UTC +00:00' to 'Month, year'
  # Use method in problems/index and show pages
  def format_timestamp_to_set_month(problem)
    problem.created_at.strftime("%B, %Y")
  end
  
  # Display str of styles for each problem on problems/show view
  def display_styles(problem)  
    problem.styles.map(&:name).join(', ')
  end

  def display_sends_count(problem)
   "Send".pluralize(problem.sends.count) + ": " + problem.sends.count.to_s
  end
end