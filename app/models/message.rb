class Message < ActiveRecord::Base
  before_save :created_at

  def timestamp
    created_at_field = strftime("%a, %B %d, %I:%M %p")
  end
  def change
  end
end
