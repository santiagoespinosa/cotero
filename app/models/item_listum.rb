class ItemListum < ActiveRecord::Base
  belongs_to :item
  belongs_to :listum
end
