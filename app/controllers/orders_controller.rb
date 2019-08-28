class OrdersController < ApplicationController
	before_action :authenticate_vendor!
end