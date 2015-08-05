class Message < ActiveRecord::Base
  def change
    t.created_at.strftime("%a, %B %d, at %I:%M%p") 
  end
end
