# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class HomeController < ApplicationController
  before_action :set_user, except: :front
  respond_to :html, :js

  def index
    @post = Post.new
    @friends = @user.all_following.unshift(@user)
    if params[:feeds] == "public"
      @activities = PublicActivity::Activity.where(owner_id: @friends, private_flag: false).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    else
      @activities = PublicActivity::Activity.where(owner_id: get_college.user_id, private_flag: true).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
  end

  def front
    @activities = PublicActivity::Activity.where(private_flag: false).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
  def find_friends
  @friends = @user.all_following
  #binding.pry
  @users = User.with_role(:college).where.not(id: @friends.unshift(@user)).paginate(page: params[:page])# || @search.results.paginate(page: params[:page])
  #binding.pry
  #@users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])

  end

  def search_colleges

    @search = User.search do
      keywords(params[:college_search])
    end
    #
    # puts "++++++++++++++++++++++"
    arr = []
    # @search.results.each do |user|
    #   if user.has_role?(:college)
    #     arr << user.id
    #   end
    # end
    @users = @search.results

    # puts "++++++++++++++++++++++"
    #   p @users
    # puts "++++++++++++++++++++++"

    # puts "++++++++++++++++++++++"

    # redirect_to :find_friends
  end

  def search_friends
    @friends = @user.all_following
    @users = User.where("name LIKE ?", "%#{params[:q]}%").where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
  end
private
  def set_user
    @user = current_user
  end
end
