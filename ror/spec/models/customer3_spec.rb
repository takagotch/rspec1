require 'spec_helper'

describe Customer do
  specify 'valid obj' do
    customer = Customer.new(
      family_name: 'yoshioka', given_name: 'takashi',
      family_name_kana: 'yoshioka', given_name_kana: 'takashi'
    )
    expect(customer).to be_valid
  end

  %w{family_name given_nmae family_name_kana given_name_kana}.each do |column|
    specify "#{column_name} not ' '" do
      customer = Customer.new(
        family_name: 'yoshioka', given_name: 'takashi',
	family_name_kana: 'yoshioka', given_name: 'takashi'
      )
      customer[column_name] = ''
      expect(customer).not_to be_valid
      expect(customer.errors[column_name]).to be_present
    end

    specify "#{column_name} 40stiring" do
      customer = Customer.new(
        family_name: 'yoshioka', given_name: 'takashi',
	family_name_kana: 'yoshioka', given_name_kana: 'takashi'
      )
      customer[column_name] = 'A' * 41
      expect(customer).not_to                 be_valid
      expect(customer.errors[column_name]).to be_present
    end
end

