class Monument < ActiveRecord::Base
belongs_to :collection
has_many :pictures, dependent: :destroy
belongs_to :category
end
