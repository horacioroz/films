class QuotesController < ApplicationController
	
	def index
		@quote = Quote.order("RANDOM()").first
	end
	
	# def new
	# 	@quote = Quote.new
	# end 
	#esto tendria que borrarse porque ya no se utiliza porque se utiliza el modal, lo dejo para pegar una repasada luego, lo mismo que new.html.erb
	
	def create
		@quote = Quote.create(quote_params)
		if @quote.invalid?
			flash[:error] = '<strong>Could not save</strong> yhe data you entered is invalid'			
		end
		redirect_to root_path
	end

	def about
		
	end
	private
	def quote_params
		params.require(:quote).permit(:saying, :author)
	end
end
