require 'spec_helper'

describe Customer do
  specigy "" do
    customer = Customer.new(
      family_name: '', given_name: 'takashi',
      family_name_kana: 'yoshioka', given_name_kana: 'takashi'
    )
    expect(customer).not_to                  be_valid
    expect(customer.errors[:family_name]).to be_present
  end
end

