require 'rails_helper'

RSpec.describe Granny, type: :model do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }

  describe 'relationships' do
    it { should have_many(:cats) }
  end
  
  describe 'class_methods' do
    it '::ordered_grannies' do

    expect(Granny.ordered_grannies).to eq([granny_3, granny_2, granny_1])
    end
  end

  describe 'instance_methods' do
    it '#' do

    end
  end
end