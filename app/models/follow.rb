# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class Follow < ActiveRecord::Base
  include Shared::Callbacks

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes
  attr_accessor :private_flag
  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true

  def block!
    self.update_attribute(:blocked, true)
  end

  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| model.follower }
  tracked only: [:create, :like], private_flag: Proc.new{ |controller, model| model.private_flag }
  validates_presence_of :follower
  validates_presence_of :followable
  def private_flag
   @private_flag || false
  end
end
