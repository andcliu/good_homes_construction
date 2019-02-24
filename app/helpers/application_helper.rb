module ApplicationHelper
	def hours_operation
		'<tr><td class="subtitle">Monday</td><td>10am - 3pm</td><td>5pm - 12am</td></tr>
		<tr><td class="subtitle">Tuesday</td><td>10am - 3pm</td><td>5pm - 12am</td></tr>
		<tr><td class="subtitle">Wednesday</td><td>10am - 3pm</td><td>5pm - 12am</td></tr>
		<tr><td class="subtitle">Thursday</td><td>10am - 3pm</td><td>5pm - 12am</td></tr>
		<tr><td class="subtitle">Friday</td><td>10am - 3pm</td><td>5pm - 1am </td></tr
		<tr><td class="subtitle">Saturday</td><td>10am - 3pm</td><td>5pm - 1am </td></tr
		<tr><td class="subtitle">Sunday</td><td>10am - 3pm</td><td>5pm - 1am </td></tr
		'.html_safe
	end

	def methods
		%w'new create update destroy edit create show'
	end

	def business_name 
		"biz name"
	end
	def business_header_name 
		"<span class='color_red'>2</span>Cheng's".html_safe
	end
	def business_info
		'	<span class="title">Phone:</span> (510)888-5518<br>
			<span class="title">Email:</span> 2chengs@gmail.com<br>
			<span class="title">Address:</span> 888 B St. Hayward
		'.html_safe
	end

	def this 
		controller_name.to_s.include?('_') ? controller_name.camelcase.singularize.constantize : controller_name.singularize.humanize.constantize
	end

	def constantize_table e
		e.to_s.include?('_') ? e.camelcase.singularize.constantize : e.last=='s' ? e.singularize.humanize.constantize : e.camelcase.singularize.constantize
	end

	def object_count e 
		e.all.blank? ? 0 : e.all.count
	end
	def var_name e 
		instance_variable_set(:"@#{e.singularize}",e)
	end

	def attribute_keys e 
		f=e.new.attributes.keys - %w'updated_at created_at'

		temp=[]
		f.each do |g| 
			temp.push g.to_sym 
		end
		return temp
	end

	def not_tables_in_admin
		%w'admins ar_internal_metadata schema_migrations employee_infos wages work_schedules'
	end

	def db_tables
		table=[]
		temp=ActiveRecord::Base.connection.tables
		temp.each do |e|
			table.push(e)
		end
		table=table-not_tables_in_admin
		return table.sort_by{|h| h}.reverse!
	end

	def table_fields e
		constantize_table(e).admin_view.present? ? (constantize_table(e).admin_view-['updated_at']) : constantize_table(e).list_view 
	end

	def sanitize e
		if e.present?
			if e.is_a? Float
				number_to_currency(e)
			elsif e.is_a? String 
				e.humanize
			
			elsif e.is_a? Date 
				Date.parse(e.to_s).strftime("%m/%d/%Y")
			end
		end
	end

	def form_fields e
		e.form_view.present? ? view=e.form_view : e.list_view.present? ? view=e.list_view : view=e.admin_view
		return view
	end

	def form_collection e
		g=e.to_s.gsub('_id','')
		if g.to_s.include?('_')
			g=g.camelcase.singularize.constantize
		else 
			g=g.humanize.constantize
		end
		g=g.all.collect{|e|[e.to_s,e.id]}
		return g
	end

	def form_class e 
		e.include?('date') ? cn='datepicker' : cn='validate inputs'
		return cn
	end

	def return_views e 
		f=e.new.attributes.keys - %w'updated_at created_at'
		return f
	end

	def month_date e
		Date.parse(e.to_s).strftime("%m/%d") 
	end


end
