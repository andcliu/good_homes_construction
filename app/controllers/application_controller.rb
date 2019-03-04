class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  alias_method :current_user, :current_admin
  include ApplicationHelper
  # add_breadcrumb "Home", :root_path
  # add_breadcrumb "Report", :admins_path
  rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized

  def index
    unless params[:controller]=='root'
      authorize this
    end
    # add_breadcrumb "#{this}", polymorphic_path(this)
  end
  
  def new
      authorize this
	end

  def show
    authorize this 
  end

  def edit
      authorize this
  end

  def update
    authorize this 
    model_name=this.find(params[:id])
    authorize model_name
    model_name.update_attributes(priv_params)
    redirect_to polymorphic_path(model_name)
  end

  def create
    authorize this
    this.create(priv_params)
    redirect_to polymorphic_path(this)
  end

  def destroy
    model_name=this.find(params[:id])
    authorize model_name
    model_name.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path(model_name), notice: "#{model_name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def print_index_pdf
    pdf_render "#{this}", "application/print_index"
  end

  def print_pdf 
    pdf_render "#{this}", "application/print_pdf"
  end

  def pdf_render filename, template
    render :pdf => filename,
      :layout => template.include?('index') ? 'print_index_layout' : 'print_pdf',
      :template => template,
      :page_size => 'Letter',
      :image_quality => 100,
      :dpi => 300
      # :margin => {:top => 10, :bottom => 10, :left => 0, :right => 10}
  end

  private 

  def priv_params
    p=this.model_name.singular.to_sym
    params.require(p).permit(
      attribute_keys(this).each do |f| 
        f
      end
    ) 
  end
  
  def admin_not_authorized
    policy_name = exception.policy.class.to_s.underscore
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to root_path
  end

end
