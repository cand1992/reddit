class SubsController < ApplicationController
	# Model - All the logic on the table or record, database constraints, associations

	# Views - Whatever the user sees and interacts with, front end, little logic

	# Controller / Routes - Traffic director
		# actions - what you can do on the app

		# actions - must return a response
			# HTML XML JSON
			# If it doesn't return a response then redirect to another action that does

	# callback - perform logic at certain actions
	# before_action
	# after_action
	# skip_before_action
	# skip_after_action

	# before_action :method_to_call
	# before_action :method_to_call, only: [:index, :show]
	# before_action :method_to_call, except: [:index, :show]

	# READ - GET
		# index action - all of the record of the table
			# def index
				# @model_names = Model_name.all
			# end

		# show action - show a single record, id, id is which record you want to see
			# def show
				# @model_name = Model_name.find(params[:id])
			# end

		# new action - display new record form, only creates the record in memory
			# def new
				# @model_name = Model_name.new
			# end

		# edit action - display the edit record form, id, which record we need to update
			# def edit
				# @model_name = Model_name.find(params[:id])
			# end

	# CREATE - POST
		# creates a record in db from the new action
		# def create
			# @model_name = Model_name.new(model_name_params)
			# if @model_name.save
				# do something or go somewhere
			# else
				# render :new
			# end
	  # end

	# model_name_params
		# pass certain attr
			# private
				# def model_name_params
					# params.require(:model_name).permit(:attr, :attr2, :everything_that_model_has)
				# end

	# UPDATE - PUT/PATCH
		# edit the record, from the edit form, id, which one to update
		# def update
			# @model_name = Model_name.find(params[:id])
			# if @model_name.update(model_name_params)
				# do something
			# else
				# render :edit
			# end
		# end

	# DESTROY - DELETE
		# delete the entire record, id, which one to delete
			# def destroy
				# Model_name.find(params[:id]).destroy
				# or
				# @model_name = Model_name.find(params[:id])
				# @model_name.destroy
			# end

  # def index
  # 	@subs = Sub.all
  # end

  # def show
  # 	@sub = Sub.find(params[:id])
  # end

  # def new
  # 	@sub = Sub.new
  # end

  # def create
  # 	@sub = Sub.new(sub_params)
  # 	if @sub.save
  # 		redirect_to @sub
  # 	else
  # 		render :new
  # 	end
  # end

  # def edit
  # 	@sub = Sub.find(params[:id])
  # end

  # def update
  # 	@sub = Sub.find(params[:id])
  # 	if @sub.update(sub_params)
  # 		redirect_to @sub
  # 	else
  # 		render :edit
  # 	end
  # end

  # def destroy
  # 	Sub.find(params[:id]).destroy
  # end

  # private
  # 	def sub_params
  # 		params.require(:sub).permit(:name)
  # 	end

  # before_action :set_sub, only: [:show, :edit, :update, :destroy]
  before_action :set_sub, except: [:index, :new, :create]

  def index
  	@subs = Sub.all
  end

  def show 	
  end

  def new
  	@sub = Sub.new
  	render partial: 'form'
  end

  def create
  	@sub = Sub.new(sub_params)
  	if @sub.save
  		redirect_to @sub
  	else
  		render partial: 'form'
  	end
  end

  def edit
  	render partial: 'form'
  end

  def update
  	if @sub.update(sub_params)
  		redirect_to @sub
  	else
  		render partial: 'form'
  	end
  end

  def destroy
  	@sub.destroy
  	redirect_to root_path
  end

  private
  	def set_sub
  		@sub = Sub.find(params[:id])
  	end

  	def sub_params
  		params.require(:sub).permit(:name)
  	end

end
