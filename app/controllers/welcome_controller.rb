class WelcomeController < ApplicationController
  def index
    @topics = Topic.all
    @new_topic = Topic.new
  end
end
