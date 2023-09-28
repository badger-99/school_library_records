require_relative 'spec_helper'

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'does nothing if name is less than 10 characters long' do
      person = Person.new(18, 'alice', parent_permission: true)
      decorator = TrimmerDecorator.new(person)
      expect(decorator.correct_name).to eq('alice')
    end

    it 'trims first 10 characters if name is more than 10 characters long' do
      person = Person.new(18, 'Christopher', parent_permission: true)
      decorator = TrimmerDecorator.new(person)
      expect(decorator.correct_name).to eq('Christophe')
    end
  end
end
