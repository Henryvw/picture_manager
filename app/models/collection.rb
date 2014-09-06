class Collection < ActiveRecord::Base
has_many :monuments, dependent: :destroy
belongs_to :user
end
