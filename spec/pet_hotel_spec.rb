require 'spec_helper'

describe 'PetHotel' do
  before(:each) do
    @hotel_params = {
      pets: [],
      register: 321.48
    }

    @owner_params = {
      name: 'Joe Shmo',
      money: 83.21,
      pets: []
    }

    
    @pet_params = {
      name: 'Rufus',
      allergic: false,
      owner: nil
    }
    
    @hotel = PetHotel.new(@hotel_params)
    @owner = Owner.new(@owner_params)
    @pet = Pet.new(@pet_params)

    @owner.pets = [@pet]
    @pet.owner = @owner
  end

  it 'is initiated as a PetHotel' do
    expect(@hotel).to be_an_instance_of(PetHotel)
  end

  it 'can have it\'s attributes read as functions' do
    expect(@hotel.pets).to eq(@hotel_params[:pets])
    expect(@hotel.register).to eq(@hotel_params[:register])
  end

  it 'can recieve money from owner' do
    pre_total = @hotel.register
    pre_total_owner = @owner.money
    @hotel.register_pet(@owner)
    expect(@hotel.register).to eq(pre_total + 52.50)
    expect(@owner.money).to eq(pre_total_owner - 52.50)
  end

  it 'can receive pet from owner' do
    @hotel.register_pet(@owner)

    expect(@hotel.pets.include?(@pet)).to eq(true)
    expect(@owner.pets.include?(@pet)).to eq(false)
  end

  it 'can seperate allergic pets from non-allergic pets' do
    @billy =  Pet.new({name: 'Billy', allergic: true, owner: @owner})
    @owner.pets.push(@billy)

    @hotel.register_pet(@owner)
    @hotel.register_pet(@owner)

    expect(@hotel.sorted_pets).to eq({allergic: [@billy], non_allergic: [@pet]})
  end

  it 'can deny service due to max-capacity' do
    @billy =  Pet.new({name: 'Billy', allergic: true, owner: @owner})

    10.times do
      @hotel.pets.push(@billy)
    end

    @hotel.register_pet(@owner)

    expect(@hotel.pets.include?(@pet)).to eq(false)
    expect(@owner.pets.include?(@pet)).to eq(true)
  end
end