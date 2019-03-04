Rails.application.routes.draw do
  devise_for :admins,:controllers => {
  																		:sessions => "sessions"
  																	}
 	root 'root#index'
  get '/:controller/:id/print_pdf', :action => :print_pdf
  get '/:controller/print_index_pdf', :action => :print_index_pdf
  temp=ActiveRecord::Base.connection.tables
  temp.each do |e|
    unless e=='schema_migrations' or e=='ar_internal_metadata'
      resources e.to_sym
    end
  end


end

