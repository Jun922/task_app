class Friend < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
