class Granny < ApplicationRecord
  has_many :cats

  # validates :name, presence: true
  # validates :age, length: { is: 2 }
  # validates :has_treats, presence: true

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
      cats
    end
  end
end