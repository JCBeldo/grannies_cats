class Cat < ApplicationRecord
  belongs_to :granny

  def self.already_spayed
    Cat.where("spayed_neutered == true")
  end
end