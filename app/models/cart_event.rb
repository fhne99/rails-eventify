class CartEvent < ApplicationRecord
  belongs_to :event
  belongs_to :cart
end
