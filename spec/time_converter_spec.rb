require './lib/time_converter'

describe TimeConverter do
  describe "when converting am" do
    describe "when regular hours" do
      (1..11).to_a.each do |hour|
        hour_formatted = hour.to_s.length == 1 ? "0#{hour}" : hour.to_s

        it "converts #{hour}am to #{hour_formatted}00" do
          TimeConverter.to_military("#{hour}am").should == "#{hour_formatted}00"
        end
      end
    end

    describe "when 12am edge case hour" do
      it "converts 12am to 0000" do
        TimeConverter.to_military("12am").should == "0000"
      end
    end

    describe "when AM is in capital letters" do
      it "converts 1AM to 0100" do
        TimeConverter.to_military("1AM").should == "0100"
      end
    end
  end

  describe "when converting pm" do
    describe "when regular hours" do
      (1..11).to_a.each do |hour|
        hour_formatted = "#{hour + 12}"

        it "converts #{hour}pm to #{hour_formatted}00" do
          TimeConverter.to_military("#{hour}pm").should == "#{hour_formatted}00"
        end
      end
    end

    describe "when 12pm edge case hour" do
      it "converts 12pm to 1200" do
        TimeConverter.to_military("12pm").should == "1200"
      end
    end

    describe "when PM is in capital letters" do
      it "converts 1PM to 1300" do
        TimeConverter.to_military("1PM").should == "1300"
      end
    end
  end
  
  describe "when converting hours and minutes" do
    it "converts 1:30pm to 1330" do
      TimeConverter.to_military("1:30pm").should == "1330"
    end

    it "converts 1:05pm to 1305" do
      TimeConverter.to_military("1:05pm").should == "1305"
    end
  end
end
