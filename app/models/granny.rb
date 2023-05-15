class Granny < ApplicationRecord
  has_many :cats, dependent: :destroy

  def self.ordered_grannies
    order(created_at: :desc)
  end

  def cat_count
    self.cats.count
  end

  def sort_aplha(sort)
    if sort == "clicked"
      return cats.order(:name)
    else
      self.cats
    end
  end

  def lives_threshold(cat_lives)
    cats.where("lives > #{cat_lives}")
  end
end