class Investor < ActiveRecord::Base
  has_many :investments, dependent: :destroy
end
