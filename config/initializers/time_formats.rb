Time::DATE_FORMATS[:short_ordinal]  = ->(time) { time.strftime("%A %B #{time.day.ordinalize}, %l:%M%P") }
