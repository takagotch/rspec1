require 'spec_helper'

describe Customer do
  specify "family_name not ' '" do
  end

  specify "given_name not ' '" do
    customer = Customer.new(
      family_name: 'yoshioka', given_name: '',
      family_name_kana: 'yoshioka', given_name_kana: 'takashi'
    )
    expect(customer).not_to                 be_valid
    expect(customer.errors[:given_name]).to be_present
  end

  specify "family_name_kana not ' '" do
  end

  specify "given_name_kana not ' '" do
  end
end

