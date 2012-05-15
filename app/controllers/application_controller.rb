class ApplicationController < ActionController::Base
	# ...
	before_filter :init_blog
  helper :exhibits
	private
	def init_blog
		@blog = THE_BLOG
	end
end

