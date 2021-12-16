# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deductible, type: :model do
  describe 'validates' do
    subject { Deductible.new name: 'Deductible', user_id: 1, amount: 5 }

    before { subject.save }

    it 'should have a title' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have a blank title' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should have an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end
end
