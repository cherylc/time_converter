class TimeConverter
  def self.to_military(time_string)
    hours_string, minutes_string, meridian = time_string.scan(/(\d+):?(\d*)(am|a\.m\.|pm)/i).first

    format_am_military(hours_string.to_i, minutes_string.to_i, meridian.downcase)
  end

  private

  def self.format_am_military(hours, minutes, meridian = "am")
    hours = hours - 12 if (meridian == "am" && hours == 12)
    hours = hours + 12 if (meridian == "pm" && hours < 12)

    output = minutes.to_s
    output.insert(0, "0") if output.length < 2

    output.insert(0, hours.to_s)
    output.insert(0, "0") if output.length < 4
    output
  end
end
