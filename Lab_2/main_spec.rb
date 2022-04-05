require 'rspec'
require './main.rb'

RSpec.describe "Main metods" do

  it "#end_with_cs first" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("mummy")
    expect(end_with_cs).to eq('ymmum')
  end
  it "#end_with_cs second" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("ecs")
    expect(end_with_cs).to eq(8)
  end
  it "#pokemons" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(3, "First", "Red", "Second","Blue", "Third", "Yellow")
    expect(pokemons).to eq([{ "First" => "Red"}, {"Second" => "Blue"}, {"Third" => "Yellow"}])
  end


end