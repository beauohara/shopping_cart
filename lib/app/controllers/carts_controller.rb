class CartsController < ActionController::Base   
  include ShoppingCart
  before_filter :get_cart
  layout 'application'
  
  def show
    render :partial => 'cart', :layout => 'application'
  end
  
  def edit
    logger.info "edit cart id: #{@current_cart.id}"    
  end
  
  def update
    # logger.info "params[:cart][:existing_line_item_attributes]=#{params[:cart][:existing_line_item_attributes]}"
    params[:cart][:existing_line_item_attributes] ||= {}
    # logger.info "params[:cart][:existing_line_item_attributes]=#{params[:cart][:existing_line_item_attributes]}"
    
    if @current_cart.update_attributes(params[:cart])
      # logger.info "current_cart=#{@current_cart}"
      flash[:notice] = 'Cart was successfully updated.'
    end
    render :action => "edit"
  end

end
