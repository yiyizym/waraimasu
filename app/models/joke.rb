class Joke < ApplicationRecord
  def self.pick_5
    key = Time.now.strftime("%d:%H:%M")
    Rails.cache.fetch("#{key}/picked_jokes", expires_in: 60) do
      where(id: Joke.pluck(:id).sample(5))
    end
  end
end
