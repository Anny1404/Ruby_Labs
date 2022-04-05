require "rspec"
require "./CashMachine"

RSpec.describe CashMachine do
  before do
    File.write("balance.txt", 100.0)
  end

  it 'Withdraw() should substract from the balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("W", 40, "Q")
    CashMachine.new.init
    expect(File.read("balance.txt").chomp.to_f).to eql(60.0)
  end

  it 'Deposit() should add to the balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("D", 50, "Q")
    CashMachine.new.init
    expect(File.read("balance.txt").chomp.to_f).to eql(150.0)
  end

  it 'Balance() should return current balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("B", "Q")
    CashMachine.new.init
    expect(File.read("balance.txt").chomp.to_f).to eql(100.0)
  end
end


