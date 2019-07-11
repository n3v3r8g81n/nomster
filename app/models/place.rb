class Place < ApplicationRecord
  self.per_page = 3
  belongs_to :user
end
