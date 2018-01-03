require 'spec_helper'

describe Customer do
  %w{family_name given_name family_name_kana given_name_kana}.each do |colum_name|
    specify "#{column_name} not ' '" do
      customer = Customer.new(
        family_name: 'yoshioka', given_name: 'yoshioka',
	family_name_kana: 'yoshioka', given_name_kana: 'takashi'
      )
      customer[column_name] = ''
      expect(customer).not_to                 be_valid
      expect(customer.errors[column_name]).to be_present
    end
  end
end

