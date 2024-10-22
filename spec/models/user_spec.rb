# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { build(:user) }

  describe 'validations' do
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is valid with a name' do
      subject.name = 'John Doe'
      expect(subject).to be_valid
    end

    it 'is not valid with a name that is too long' do
      subject.name = 'a' * 51
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:posts) }
  end
end
