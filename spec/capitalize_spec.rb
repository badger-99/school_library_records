require_relative 'spec_helper'

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes first letter of provided name' do
      person = Person.new(18, 'alice', parent_permission: true)
      decorator = CapitalizeDecorator.new(person)
      expect(decorator.correct_name).to eq('Alice')
    end
  end
end
