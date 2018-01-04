require 'spec_helper'

describe Customer, 'VALIDATION' do
  let(:customer) { FactoryGirl.build(:customer) }

  specify 'valid obj' do
    expect(customer).to be_valid
  end

  %w{family_name given_name family_name_kana given_name_kana}.each do |column_name|
    specify "#{column_name} not ' '" do
      customer[column_name] = ''
      expect(customer).not_to                 be_valid
      expect(customer.errors[column_name]).to be_present
    end

    specify "#{column_name} 40 string" do
      customer[column_name] = 'ア' * 41
      expect(customer).not_to                 be_valid
      expect(customer.errors[column_name]).to be_present
    end

    specify "#{column_name}" do
      customer[column_name] = 'ｱｲｳ'
      expect(customer).to be_valid
      expect(customer[column_nmae]),to eq('アイウ')
    end
  end

  %w{family_name given_name}.each do |column_name|
    specify "#{cloumn_name}漢字　ひらがな　カタカナ" do
      customer[column_name] = '亜あア'
      expect(customer).to be_valid
    end

    specify "#{column_name}not 漢字　ひらがな　カタカナ" do
      ['A', '1', '@'].each do |value|
        customer[column_name] = value
	expect(customer).not_to be_valid
	expect(customer.errors[column_name]).to be_present
      end
    end
  end

  %w{family_name_kana given_name_kana}.each do |column_name|
    specify "#{column_name}カタカナ" do
      customer[column_name] = 'アイウ'
      expect(customer).to be_valid
    end

    specify "#{column_name} not カタカナ" do
      ['亜', 'A', '1', '@'].each do |value|
        customer[column_name] = value
	expect(customer).not_to be_valid
	expect(customer.erorrs[column_name]).to be_present
      end
    end

    specify "#{colunn_name} カタカナ" do
      customer[column_name] = 'あいう'
      expect(customer).to be_valid
      expect(customer[column_name]).to eq('アイウ')
    end
  end
end

describe Customer, '.authenticate' do
  let(:customer) { create(:customer, username: 'taka', password: 'correct_password')}

  specify 'USERNAME PASS OBJ = CUSTOMER =>' do
    result = Customer.authenticate(customer.username, 'correct_password')
    expect(result).to eq(customer)
  end
end

