require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
    #@project = Project.new(name: "filling station", description: "fill up with fuel")
    @user = User.create!(name: "vincent", email: "vince@example.com", 
                          password: "password", password_confirmation: "password")
    @project = @user.projects.build(name: "car", description: "get the car serviced")
  end
  
  
end