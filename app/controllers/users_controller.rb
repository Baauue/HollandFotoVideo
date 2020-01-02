class UsersController < ApplicationController
before_action :authenticate_user!, except: [:index]
	def index
		@image = Image.all
	end

	def showpage
		@image = Image.all
		@user = User.all
		if !@user
			flash[:error] = "Je moet inloggen"
			rrp
		end
	end

	def create
		pa = params[:user]
		user = User.create(email: pa[:email], password: pa[:password], password_confirmation: pa[:password_confirmation])
		if user.valid?
			flash[:success] = 'Gebruiker aangemaakt'
		else
			flash[:danger] = user.errors
		end
		rb
	end

	def newimage
		user = current_user
		if !user
			rrp
		end
	end

	def destroy
		@user = User.find params[:id]
		if @user == current_user
	      flash[:danger] = 'Je kan jezelf niet verwijderen'
	    else
	      @user.destroy
	      flash[:notice] = 'Gebruiker verwijderd'
	    end
    	rb
	end

	def edit
		@user = User.find_by_id (params[:id])
	end

	def update
		@user = User.find_by_id (params[:id])
	    @user.update user_params
	    flash[:success] = 'Gebruiker opgeslagen'
	    rb
  	end

	def show
		rrp
	end

private
def user_params
	params.require(:user).permit(:email,:password,:password_confirmation)
end

  def image_params
    params.require(:image).permit(:file, :title)
  end
end  
