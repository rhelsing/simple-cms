module ApplicationHelper

	def error_messages_for(object)
		render(:partial => 'application/error_messages', :locals => {:object => object})
	end

	def pluralize_without_count(count, noun, text = nil)
		if text == nil
			#regular functionality
			if count != 0
    			count == 1 ? "#{noun}" : "#{noun.pluralize}"
  			end
		else
			#alt
			if count != 0
    			count == 1 ? "#{noun}" : "#{text}"
  			end
		end
	end

	def status_tag(boolean, options={})
		options[:true_text] ||= ''
		options[:false_text] ||= ''

		if boolean
			content_tag(:span, options[:true_text], :class =>'status true' )
		else
			content_tag(:span, options[:true_text], :class => 'status false' )
		end
	end
end
