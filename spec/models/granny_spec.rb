require 'rails_helper'

RSpec.describe Granny, type: :model do
  describe 'relationships' do
    it { should have_many(:cats) }
  end
  
  describe 'instance_methods' do
    it '#' do

    end
  end
end