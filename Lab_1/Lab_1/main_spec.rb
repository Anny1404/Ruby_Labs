require 'rspec'
require './main.rb'

RSpec.describe "Main metods" do
  @first_name = 'Ann'
  @second_name = 'Lyba'
   it '#greeting first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(@first_name, @second_name, 30)
    expect(greeting).to eq("Hi, #{@first_name} #{@second_name}, самое время заняться делом!")
  end
   it '#greeting second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(@first_name, @second_name, 11)
    expect(greeting).to eq("Привет, #{@first_name} #{@second_name}, тебе меньше 18 лет, но начать учиться программировать никогда не рано!")
  end


  it "#foobar with 20, 8" do
    expect(foobar(20, 8)).to eq(8)
  end
  it "#foobar with 10, 20" do
    expect(foobar(10, 20)).to eq(20)
  end
  it "#foobar with 7, 11" do
    expect(foobar(7, 11)).to eq(18)
  end
end
