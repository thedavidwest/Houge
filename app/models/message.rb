class Message < ActiveRecord::Base
  before_save :timestamp

  def timestamp
    timestamp_field = Time.now.strftime("%a, %B %d, %I:%M %p")
  end
  def change
  end
end
