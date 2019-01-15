class Work < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :mission, counter_cache: true
end
