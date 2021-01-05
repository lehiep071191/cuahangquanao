class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :content, presence: true
	validate :check_comment
	private
	def check_comment
		if content.include?("dit") || content.include?("địt") || content.include?("dit") || content.include?("me may") || content.include?("mẹ mày") || content.include?("con me")
		 	errors.add(:content, "comment cua ban chứa từ ngữ không được phép sử dụng")
		end
	end
end
