require 'spec_helper'

describe 'Owner' do
  before(:each) do
    @owner_params = {
      name: 'Joe Shmo',
      money: 83.21,
      pets: []
    }

    @owner = Owner.new(@owner_params)
  end

  it 'is initiated as an Owner' do
    expect(@owner).to be_an_instance_of(Owner)
  end

  it 'can have it\'s attributes read as functions' do
    expect(@owner.name).to eq(@owner_params[:name])
    expect(@owner.money).to eq(@owner_params[:money])
    expect(@owner.pets).to eq(@owner_params[:pets])
  end
end
