class Granny < ApplicationRecord
  has_many :cats

  def self.ordered_grannies
    order(created_at: :desc)
  end

  def cat_count
    self.cats.count
  end
end