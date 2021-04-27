require 'csv'
require 'tempfile'

class PrimeController < ApplicationController
  def index
  end

  def file_upload
    csv_file = CSV.read(params[:file], :headers=>true)
    numbers  = csv_file['numbers'].map {|i| Integer(i)}
    primes   = []

    temp     = [ false, false ] + [ true ] * (numbers.length - 1)

    for num in 1...(numbers.length + 1)
        if temp[num] == true
            primes.append(num)
            num.step(numbers.length, num) do |iter|
                temp[iter] = false
            end
        end
    end
    
    res = []

    numbers.each do |num|
        if primes.include? num
            res.append(num)
        end
    end 

    return render json: {status: 'SUCCESS', data: res}
  end

  def file_download
    file     = Tempfile.new(['test','.csv'])
    csv_file = CSV.open('test.csv', "w") do |csv|
      csv<<['numbers']
      for prime in params[:primes] do
        csv<<[Integer(prime)]
      end
    end

    logger.debug file.read

    return send_file(file, disposition: 'attachment')
  end
end
