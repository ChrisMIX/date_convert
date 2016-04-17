class String
  def fix_that_date()

    months = {"January" => "01",
      "JAN" => "01",
      "Jan" => "01",
      "February" => "02",
      "FEB" => "02",
      "Feb" => "02",
      "March" => "03",
      "MAR" => "03",
      "Mar" => "03",
      "April" => "04",
      "APR" => "04",
      "Apr" => "04",
      "May" => "05",
      "June" => "06",
      "JUN" => "06",
      "Jun" => "06",
      "July" => "07",
      "JUL" => "07",
      "Jul" => "07",
      "August" => "08",
      "AUG" => "08",
      "Aug" => "08",
      "September" => "09",
      "SEPT" => "09",
      "Sept" => "09",
      "October" => "10",
      "OCT" => "10",
      "Oct" => "10",
      "November" => "11",
      "NOV" => "11",
      "Nov" => "11",
      "December" => "12",
      "DEC" => "12",
      "Dec" => "12"}

      #3/20/2016 4:05:07 PM
    if /(\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2}:\d{2} (AM|PM))/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date.split(" ")

      date << new_date[0][-4..-1] + "-"

        if new_date[0][1] == "/"
          date << "0" + new_date[0][0] + "-" +  new_date[0][2..3] + "-"
        else
          date << new_date[0][0..1] + "-" + new_date[0][3..4]
        end

      date << "T" + new_date[1] + ".000Z"

       #2016-20-03T16:05:07-08:00
    elsif /(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}-\d{2}:\d{2})/.match(self).nil? == false
      date = self
      day = date[5..6]
      month = date[8..9]

      date[5..6] = month
      date[8..9] = day


      #3/20/2016 4:05 PM
    elsif /(\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2} (AM|PM))/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date.split(" ")
      date << new_date[0][-4..-1] + "-"

        if new_date[0][1] == "/"
          date << "0" + new_date[0][0] + "-" +  new_date[0][2..3] + "-"
        else
          date << new_date[0][0..1] + "-" + new_date[0][3..4]
        end

      date << "T" + new_date[1] + ":00.000Z"

       #20/03/2016
    elsif /(\d{2}\/\d{2}\/\d{4})/.match(self).nil? == false && self[0..1].to_i > 12
      date = ""
      new_date = self
      date << new_date[-4..-1] + "-" + new_date[-7..-6] + "-"

      if new_date[1] == "/"
        date << "0" + new_date[0]
      else
        date << new_date[0..1]
      end

      #3/20/2016
    elsif /(\d{1,2}\/\d{2}\/\d{4})/.match(self).nil? == false
        date = self
        date = date.prepend("0") << "/"
        last_five = date[6..10]
        date = date[1..4].prepend(last_five).gsub!(/\//, "-")

      #Sunday, MAR 20, 2016
    elsif /([a-zA-Z]{5,9}, [a-zA-Z]{3} \d{1,2}, \d{4})/.match(self).nil? == false

      date = ""
      new_date = self
      new_date = new_date.split(" ")
      date << new_date[3] + "-" + months[new_date[1]] + "-" + new_date[2][0..1]



      #Sunday 20th of March 2016 04:05:07 PM
    elsif /([a-zA-Z]{5,9} \d{1,2}[a-zA-Z]{2} of [a-zA-Z]{3,9} \d{4} \d{2}:\d{2}:\d{2} (AM|PM))/.match(self).nil? == false
        date = ""
        new_date = self
        time = new_date[-11..-4] + ".000Z"
        new_date = new_date.split(" ")

        date << new_date[4] + "-" + months[new_date[3]] + "-" + new_date[1][0..1] + "T" + time

      #Sunday, March 20, 2016 4:05:07 PM
    elsif (/([a-zA-Z]{5,9}\, [a-zA-Z]{5,9} \d{1,2}, \d{4})/.match(self).nil? == false) && (/(\d{1,2}\:\d{2}\:\d{2}\ (AM|PM))/.match(self).nil? == false)

      date = ""
      new_date = self
      newest_date = /([a-zA-Z]{5,9}\, [a-zA-Z]{5,9} \d{1,2}, \d{4})/.match(self)[0][-14..-1]

      newest_date2 = newest_date.split(" ")
      date << newest_date[-4..-1] + "-" + months[newest_date2[0]] + "-" + newest_date2[1][0..1] + "T"

      time = new_date[-11..-1]

      if time[0] != " "
        time = time[0..7].prepend("0") << ".000"
      else
        time = time[1..7].prepend("0") << ".000"
      end

      date << time + "Z"

      #Sunday, March 20, 2016 4:05 PM
    elsif (/([a-zA-Z]{5,9}\, [a-zA-Z]{5,9} \d{1,2}, \d{4})/.match(self).nil? == false) && (/(\d{1,2}\:\d{2}\ (AM|PM))/.match(self).nil? == false)
      date = ""
      new_date = self
      newest_date = /([a-zA-Z]{5,9}\, [a-zA-Z]{5,9} \d{1,2}, \d{4})/.match(self)[0][-14..-1]

      newest_date2 = newest_date.split(" ")
      date << newest_date[-4..-1] + "-" + months[newest_date2[0]] + "-" + newest_date2[1][0..1] + "T"

      time = new_date[-7..-1]

      if time[0] != " "
        time = time[0..7].prepend("0") << ":00.000"
      else
        time = time[1..7].prepend("0") << ":00.000"
      end

      date << time + "Z"

      #4:05:07 PM
    elsif /(\d{1}\:\d{2}\:\d{2}\ (AM|PM))/.match(self).nil? == false || /(\d{2}\:\d{2}\:\d{2}\ (AM|PM))/.match(self).nil? == false
      date = self
      date = date[0..6].prepend("0") << ".000"

      #Sunday, March 20, 2016
    elsif /([a-zA-Z]{5,9}\, [a-zA-Z]{5,9} \d{1,2}, \d{4})/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date[-14..-1]
      newer_date = new_date.split(" ")
      date << new_date[-4..-1] + "-" + months[newer_date[0]] + "-" + newer_date[1][0..1]

      #March 20, 2016
    elsif /([a-zA-Z]{3,9} \d{1,2}, \d{4})/.match(self).nil? == false

      date = ""
      new_date = self
      new_date = new_date.split(" ")
      date << new_date[2] + "-" + months[new_date[0]] + "-" + new_date[1][0..1]

     #Sun, 20 Mar 2016 16:05:07 GMT
    elsif /([a-zA-Z]{3}, \d{1,2} [a-zA-Z]{3} \d{4} \d{2}:\d{2}:\d{2} [a-zA-Z]{3})/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date.split(" ")

      date << new_date[3] + "-" + months[new_date[2]] + "-" + new_date[1] + "T" + new_date[4] + "+00:00"

      #Sun, 20 Mar 2016 16:05:07 -0800
    elsif /([a-zA-Z]{3}, \d{1,2} [a-zA-Z]{3} \d{4} \d{2}:\d{2}:\d{2} -\d{4})/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date.split(" ")
      date << new_date[3] + "-" + months[new_date[2]] + "-" + new_date[1] + "T" + new_date[4] + new_date[5][0] + new_date[5][1..2] + ":" + new_date[5][3..4]

      #March, 2016
    elsif /([a-zA-Z]{3,9}, \d{4})/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date.split(" ")

      date << new_date[1] + "-"
      date << months[new_date[0].delete ","]

      #20160320 16:05:07
    elsif /(\d{8} \d{2}:\d{2}:\d{2})/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date.split(" ")

      date << new_date[0]
      date = date.insert(4, "-").insert(7, "-")
      date = date + "T" + new_date[1] + "Z"

      #20160320
    elsif /(\d{8})/.match(self).nil? == false
        date = self
        date.insert(4,"-").insert(7, "-")

        #20 March 2016
    elsif /(\d{2} [a-zA-Z]{3,9} \d{4})/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date.split(" ")
      date << new_date[2] + "-" + months[new_date[1]] + "-" + new_date[0]

      #2016.03.20
    elsif /(\d{4}.\d{2}.\d{2})/.match(self).nil? == false
      date = self
      date[4] = "-"
      date[7] = "-"


      #March 20
    elsif /([a-zA-Z]{3,9} \d{1,2})/.match(self).nil? == false
      date = ""
      new_date = self
      new_date = new_date.split(" ")

      date << "2016-" + months[new_date[0]] + "-" + new_date[1]

    else
      puts "It appears this time format is not supported."
    end
    date
  end
end
