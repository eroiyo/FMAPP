# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validates' do
    subject { Category.new name: 'Starting validation', user_id: 1 }

    before { subject.save }

    it 'should have a title' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have a blank title' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end
  end
end
