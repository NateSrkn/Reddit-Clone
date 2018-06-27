module ApplicationHelper
    def bootstrap_class_for flash_type
        case flash_type
          when :success
            "alert-success" # Green
          when :error
            "alert-danger" # Red
          when :alert
            "alert-warning" # Yellow
          when :notice
            "alert-info" # Blue
          else
            flash_type.to_s
        end
      end
    
    def form_group_tag(errors, &block)
        css_class = 'form-group'
        css_class << ' has-error' if errors.any?

        content_tag :div, capture(&block), class: css_class
        
      end

      def avatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
      end
end
