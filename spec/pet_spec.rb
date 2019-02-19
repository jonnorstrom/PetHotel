require 'spec_helper'

describe 'Pet' do
  before(:each) do
    @pet_params = {
      name: 'Rufus',
      allergic: false,
      owner: nil
    }

    @pet = Pet.new(@pet_params)
  end

  it 'is initiated as a Pet' do
    expect(@pet).to be_an_instance_of(Pet)
  end

  it 'can have it\'s attributes read as functions' do
    expect(@pet.name).to eq(@pet_params[:name])
    expect(@pet.allergic).to eq(@pet_params[:allergic])
    expect(@pet.owner).to eq(@pet_params[:owner])
  end
end