class Employer < ApplicationRecord
	has_many :employees, dependent: :destroy
	has_many :budgets, dependent: :destroy
	
	validates :first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	validates :last_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
