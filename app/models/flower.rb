class Flower < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	scope :f_type, proc { |f_type| where(:f_type => f_type) }
	scope :latest, order("created_at DESC").limit(6)
	scope :featured, where("rate > 10").order("created_at DESC").limit(3)

	def self.promoted
		where("discount > 0").order("discount DESC").limit(3)
	end

	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
	
end
