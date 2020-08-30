class Tag < ActiveRecord::Base
   has_many :ticket_tags
   has_many :tickets, through: :ticket_tags

   validates :name, presence: true, length: {minimum: 3}
end
