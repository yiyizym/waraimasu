class Joke < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  has_many :joke_tags, :dependent => :destroy
  has_many :tags, :through => :joke_tags
  
  def self.pick_5
    key = Time.now.strftime("%y:%m:%d")
    jokes_ids = special_day_jokes.present? ?
                special_day_jokes :
                Joke.pluck(:id).sample(5)
    Rails.cache.fetch("#{key}/picked_jokes", expires_in: 1.day) do
      where(id: jokes_ids)
    end
  end

  private

  def self.special_day_jokes
    {
      # TODO
    }[Time.now.strftime("%m:%d").to_sym]
  end
end
