require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user_attr = attributes_for(:user)
  end

  it "should create a new instance of a user given valid attributes" do
    User.create!(@user_attr)
  end
end
