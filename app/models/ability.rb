class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
     if user.role? :admin
        cannot :manage, :all
     elsif !user_signed_in
        cannot :manage, :all

  end
end
