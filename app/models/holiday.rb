class Holiday < ApplicationRecord
  validates :date, length: { is: 8 }, presence: true
  validates :holiday, presence: true
end
