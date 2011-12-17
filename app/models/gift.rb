class Gift < ActiveRecord::Base
	has_many :orders
end
