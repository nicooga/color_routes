module ColorRoutes

  # Some extensions to String to deal with ANSI colors.
  class StringANSI
  
    COLORS = {
      :black   => 30,
      :red     => 31,
      :green   => 32,
      :brown   => 33,
      :blue    => 34,
      :magenta => 35,
      :cyan    => 36,
      :gray    => 37
    }

    def color(color)
      code = "\033[#{COLORS[color]}m"
      end_code = "\033[0m"
      "#{code}#{self}#{end_code}"
    end

    def ansi_length
      gsub(/\033\[\d+m/, "").length
    end
   
    def ansi_ljust(n)
      ljust(n + length - ansi_length)
    end

    def ansi_rjust(n)
      rjust(n + length - ansi_length)
    end

  end
  
end

class String
  include ColorRoutes::StringANSI
end