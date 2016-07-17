class Investment < ActiveRecord::Base
  belongs_to :investor
  scope :with_investors, -> { joins("LEFT OUTER JOIN investors on investments.investor_id = investors.id").select("investments.*, investors.name as investor_name") }
end
