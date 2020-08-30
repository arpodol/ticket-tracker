class Ticket < ActiveRecord::Base
  STATUSES = ['new', 'blocked', 'in_progress', 'fixed']

  belongs_to :project
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags

  validates :name, presence: true, length: {minimum: 5}
  validates :body, presence: true
  validates :status, presence: true
  validates :project_id, presence: true
end
