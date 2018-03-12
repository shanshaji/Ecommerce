class Ability
  include CanCan::Ability

   
  # Create, Read, Update, Destroy
    #:create = new,create
    #:read = index,show
    #:destroy = destroy
    #:manage = new,create,index,show,edit,update,destroy


  def initialize(user)
    if user.nil?
        can :read, [Category, Product]
    elsif user.role? "admin"
        can :manage, [Category, Product, Review, Brand, Coupon]
    elsif user.role? "customer"
        can :read, [Category, Product]
        can [:create, :read], Review
        can [:update, :destroy], Review do |review|
            review.user_id == user.id   
        end
    elsif user.role? "moderator"
        can :read, [Category, Product, Review]
        can :create, Review
        can :update, [Category, Product]
        can :destroy, Review
          
    end       
            
   
  end
end
