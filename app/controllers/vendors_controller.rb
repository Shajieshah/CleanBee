class VendorsController < ApplicationController

	before_action :authenticate_vendor!
	
	def dashboard
	end

end