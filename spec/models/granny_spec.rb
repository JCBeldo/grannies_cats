require 'rails_helper'

RSpec.describe Granny, type: :model do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }
  let!(:cat_1) { granny_1.cats.create!(name: "Snuffles", spayed_neutered: true, lives: 9) }
  let!(:cat_2) { granny_1.cats.create!(name: "Poopykins", spayed_neutered: true, lives: 9) }
  let!(:cat_3) { granny_1.cats.create!(name: "Sillyfluff", spayed_neutered: true, lives: 7) }
  let!(:cat_4) { granny_2.cats.create!(name: "Mr. Wiskers", spayed_neutered: false, lives: 6) }
  let!(:cat_5) { granny_3.cats.create!(name: "DingPu", spayed_neutered: true, lives: 9) }
  
  describe 'relationships' do
    it { should have_many(:cats) }
  end
  
  describe 'class_methods' do
    it '::ordered_grannies' do

      expect(Granny.ordered_grannies).to eq([granny_3, granny_2, granny_1])
    end
  end

  describe 'instance_methods' do
    it '#cat_count' do

      expect(granny_1.cat_count).to eq(3)
      expect(granny_2.cat_count).to eq(1)
    end

    it '#sort_aplha' do
      granny = Granny.find_by(id: "#{granny_1.id}")
      expect(granny.sort_aplha("clicked")).to eq([cat_2, cat_3, cat_1])
      expect(granny.sort_aplha("not")).to eq([cat_1, cat_2, cat_3])
    end

    it '#lives_threshold' do
      granny = Granny.find_by(id: "#{granny_1.id}")
      expect(granny.lives_threshold(6)).to eq([cat_1, cat_2, cat_3])
      expect(granny.lives_threshold(7)).to eq([cat_1, cat_2])
    end
  end
end