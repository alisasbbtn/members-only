module PostsHelper
  def custom_format(datetime)
   if datetime.to_date == Date.today
     "today"
   elsif datetime.to_date == Date.yesterday
     "yesterday"
   elsif (date > Date.today - 7) && (date < Date.yesterday)
     date.strftime("%A")
   else
     date.strftime("%B %-d")
   end
 end

 def datetime(datetime)
   "#{custom_format(datetime)} at #{datetime.strftime("%H:%M")}"
 end
end
