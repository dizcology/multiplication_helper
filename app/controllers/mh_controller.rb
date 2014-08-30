class MhController < ApplicationController

  def index #this is the root, supposed to be for the user to log in before sending the user to practice"
    
    current_user = User.first #user "tester"
    
    redirect_to :practice
  end

end
