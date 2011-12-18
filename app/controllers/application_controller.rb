class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def show_errors(target)
    if target.errors.any?
      flash[:error] ||= []
      target.errors.full_messages.each do |msg|
        flash[:error] << msg
      end
    else
      flash[:error] = 'An error has occured!'
    end
  end
end
