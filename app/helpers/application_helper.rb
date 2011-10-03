module ApplicationHelper

  def format_date(the_date)
    return the_date.strftime('%Y-%m-%d')
  end

  #def button(name,url)
  def button(*args)
    if args.size == 3
      name = args[0]
      url = args[1]
      style = args[2]
      content_tag :button, :type => "button", :onclick => "window.location.href =  '#{url_for(url)}'; ", :class => "#{style}" do
        "#{name}"
      end
    elsif args.size == 2
      name = args[0]
      url = args[1]
      content_tag :button, :type => "button", :onclick => "window.location.href =  '#{url_for(url)}'; " do
        "#{name}"
      end
    elsif args.size == 1
      name = args[0]
      content_tag :button, :type => "button" do
        "#{name}"
      end
    end
  end

end
