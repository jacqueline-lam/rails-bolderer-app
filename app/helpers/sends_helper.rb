module SendsHelper
  def display_attempts(send)
    attempts = send.attempts
    if attempts == 1
      '⚡ Flashed'
    else
      "✅ #{attempts} attempts"
    end
  end

  def display_date_sent(send)
    send.date_sent.strftime("%A, %e %B %Y")
  end
end