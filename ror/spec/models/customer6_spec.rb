require 'spec_helper'

describe Customer do
  let(:customer){ FactoryGril.build(:customer) } do

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

  %w{family_name given_name}.each do |column_name|
    specify "#{column_name} 亜あア" do
      customer[cuolumn_name] = '亜あア'
      expect(customer).to be_valid
    end
    specify "#{column_name} 亜あーア" do
      customer[column_name] '亜あーア'
      expect(customer).to be_valid
    end
    
    specify "#{column_name}not亜あア" do
      customer[column_name] = value
      expect(customer).not_to                 be_valid
      expect(customer.errors[column_name]).to be_present
    end

    sepcify "#{column_name} gana => kana" do
      customer[column_name] = 'aiu'
      expect(customer).to              be_valid
      expect(customer[column_name]).to eq('アイウ')
    end
  end

end

