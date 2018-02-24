class Joke < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  
  def self.pick_5
    key = Time.now.strftime("%y:%m%d")
    Rails.cache.fetch("#{key}/picked_jokes", expires_in: 1.day) do
      where(id: Joke.pluck(:id).sample(5))
    end
  end
end
