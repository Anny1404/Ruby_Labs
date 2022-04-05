require 'rspec'
require './main.rb'

RSpec.describe 'Task_1' do
  file_path = 'test.txt'

  it 'index test' do
    expect(index(file_path)).to eq(['ketrin pirs', 'elena gilbert'])
  end

  it 'find test' do
    expect(find(0)).to eq("ann lyba 20\n")
  end

  it 'where test' do
    expect(where('ann')).to eq("ann lyba 20\n")
  end

  it 'update test' do
    expect(update(7, 'testing')).to eq(nil)
  end

  it 'delete test' do
    expect(delete(2)).to eq(nil)
  end
end

RSpec.describe 'Task_2' do
  it '#second task first solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(13, -1)
    expect(second_task).to eq(nil) # "miyuki shiba 13")
  end

  it '#second task second solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(99, -1)
    expect(second_task).to eq(nil)
  end
end

RSpec.describe 'Task_3' do
  before do
    File.write('balance.txt', 100.0)
    read_balance
  end

  it 'Withdraw() should substract from the balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(40)
    expect(withdraw).to eq(60.0)
  end

  it 'Deposit() should add to the balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(50)
    expect(deposit).to eq(150.0)
  end

  it 'Balance() should return current balance' do
    expect(balance).to eq(100)
  end
end
