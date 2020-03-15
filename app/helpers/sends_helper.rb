module SendsHelper
  def display_attempts(send)
    attempts = send.attempts
    if attempts == 1
      '⚡ Flashed'
    else
      "✅ #{attempts} attempts"
    end
  end
end