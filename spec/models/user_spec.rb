require 'spec_helper'

describe User do
  before do
  	@user = User.new(name: "Example user", email: "user@example.com")
  end

  subject { @user }

  it { should respond_to(:name)}
  it { should respond_to(:email)}
  it {should be_valid} #verify that @user object is initially valid

  describe "when name is not present" do
  	before { @user.name = ""}
  	it {should_not be_valid}
  end
end
