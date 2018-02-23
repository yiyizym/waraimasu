class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :joke

  def self.add(joke_id, user_id)
    return {"return_code": 1, "return_info": "joke not exsits"} unless Joke.find(joke_id).present?
    return {"return_code": 1, "return_info": "user not exsits"} unless User.find(user_id).present?
    return {"return_code": 0, "return_info": "already exsits"} if favorite_exsits(joke_id, user_id)

    favorite = Favorite.create({
      user_id: user_id,
      joke_id: joke_id
    })

    return {"return_code":1, "return_info": "error"} unless favorite.valid?

    {"return_code": 0, "return_info": "success", "favorite": favorite}

  rescue Exception => e
    logger.error e
    {"return_code":1, "return_info": "error"}
  end

  def self.last_5(user_id)
    return {"return_code":1, "return_info": "error"} unless user_id.present?
    last_5_favorites = where(["user_id = ?", user_id]).last(5)
    {"return_code": 0, "return_info": "success", "favorites": last_5_favorites}
  end

  private

  def self.favorite_exsits(joke_id, user_id)
    where("user_id = ? and joke_id = ?", joke_id, user_id).present?
  end
end
