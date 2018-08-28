class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meeting, counter_cache: true
end
