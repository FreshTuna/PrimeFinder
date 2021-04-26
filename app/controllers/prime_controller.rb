require 'csv'

class PrimeController < ApplicationController
  def index
  end

  def file 
    
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
end
