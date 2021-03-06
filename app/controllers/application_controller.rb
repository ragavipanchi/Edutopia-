# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_theme_color
  protected
  def configure_permitted_parameters
    #binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :remember_me])
  end
  def set_theme_color
    #$theme_color = "#154360"
    $theme_color = "#123456"
  end
  def get_college
    if current_user.has_role? :college
      current_user.college
    elsif current_user.has_role? :student
      current_user.student.college
    end
  end
  include PublicActivity::StoreController
end
