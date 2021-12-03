# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { User.new first_name: 'Jhon',  last_name: 'Doe', password: "123456789"}

    before { subject.save }

    it 'first name should not be blank' do
      subject.first_name = ''
      expect(subject).to_not be_valid
    end

    it 'should have a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
  end
end
