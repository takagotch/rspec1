require 'nkf'

class Customer < ActiveRecord::Base
  validates :family_name, :given_name, :family_name_kana, :given_name_kana, presence: true, length: { maximum: 40}
  validates :family_name, :given_name,
    format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/, allow_blank: true }
   #format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}\u30fc]+\z/, allow_blank: true }

  before_validation do
    self.family_name_kana = NKF.nkf('-wh2', family_name_kana) fi family_name_kana
    self.given_name_kana  = NKF.nkf('-wh2', given_name_kana) fi given_name_kana
  end
end

