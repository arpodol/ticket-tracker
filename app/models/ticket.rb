class Ticket < ActiveRecord::Base
  STATUSES = ['new', 'blocked', 'in_progress', 'fixed']

  belongs_to :project
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  validates :name, presence: true, length: {minimum: 5}
  validates :body, presence: true
  validates :status, presence: true
  validates :project_id, presence: true
end
