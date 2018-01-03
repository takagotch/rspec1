require 'spec_helper'

describe Customer do
  let(:customer) do
    Customer.new(
      family_name: 'yoshioka', given_name: 'takashi',
      family_name_kana: 'yoshioka', given_name_kana: 'takashi'
    )
  end

  specify 'valid obj' do
    expect(customer).to be_valid
  end

  %w{family_name given_nmae family_name_kana given_name_kana}.each do |column|
    specify "#{column_name} not ' '" do
      customer[column_name] = ''
      expect(customer).not_to                 be_valid
      expect(customer.errors[column_name]).to be_present
    end

    specify "#{column_name} 40stiring" do
      customer[column_name] = 'A' * 41
      expect(customer).not_to                 be_valid
      expect(customer.errors[column_name]).to be_present
    end
end

