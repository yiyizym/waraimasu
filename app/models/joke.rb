class Joke < ApplicationRecord
  def self.first_10
    first(10)
  end
end
