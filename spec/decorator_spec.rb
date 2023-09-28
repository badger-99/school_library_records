require_relative 'spec_helper'

describe Decorator do
  describe '#new' do
    it 'takes a nameable object and returns a Decorator object' do
      nameable = Nameable.new
      decorator = Decorator.new(nameable)
      expect(decorator).to be_an_instance_of Decorator
    end
  end

  describe "#correct_name" do
    it "delegates to the correct_name method of the nameable object" do
      nameable = Nameable.new
      decorator = Decorator.new(nameable)
      expect { decorator.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
