class User < ActiveRecord::Base
    before_save :set_admin

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :store
  has_and_belongs_to_many :roles
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def role?(role)
  	return !!self.roles.find_by_name(role.to_s.camelize.downcase)
  end

  private
    def set_admin
      if User.count == 0
        self.roles << Role.find_by_name('admin')
      end
    end

end
