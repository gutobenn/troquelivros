class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :create, :new]

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def new
    @friend_request = FriendRequest.new
  end

  def create
    friend = User.find(params[:id])
    @friend_request = current_user.friend_requests.new(friend: friend)

    if @friendship.save
	    flash[:notice] = "Friend requested."
	    redirect_to :back
	  else
	    flash[:error] = "Unable to request friendship."
	    redirect_to :back
	  end
  end

  def destroy
    @friend_request.destroy
    head :no_content
  end

  def update
    @friend_request.accept
    head :no_content
  end

  private

    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end

end
