require_relative '../person'

RSpec.describe Person do
  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(25, 'John Doe')
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    context 'when person is of age' do
      it 'reurns true' do
        person = Person.new(18)
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when person is under age but has parent\'s permision' do
      it 'returns true' do
        person = Person.new(15, 'Jane Doe', parent_permission: true)
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when person is under age and has not been permited' do
      it 'returns false' do
        person = Person.new(15, 'Grace Fieder', parent_permission: false)
        expect(person.can_use_services?).to be(false)
      end
    end
  end

  describe '#to_h' do
    it 'returns a hash represantation of person' do
      person = Person.new(23, 'Alice Smith')
      expected_hash = {
        age: 23,
        name: 'Alice Smith',
        parent_permission: true,
        id: anything,
        rentals: []
      }
      expect(person.to_h).to match(expected_hash)
    end
  end
end
