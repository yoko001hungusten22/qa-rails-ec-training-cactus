class Product < ApplicationRecord
    belongs_to : Category
    belongs_to : Sale_status
    belongs_to : Product_status
    has_many : Purchase
end
