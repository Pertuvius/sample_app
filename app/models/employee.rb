class Employee < ApplicationRecord
  belongs_to :employer
  has_many :timesheets, dependent: :destroy

  validates :employer_id, presence: true
	validates :first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	validates :last_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
