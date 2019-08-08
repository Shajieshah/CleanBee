class ShopsController < ApplicationController
	before_action :authenticate_vendor!
	
end