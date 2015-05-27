require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do 
  @operator = params[:operator]
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f

    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '/' then @first / @second
    when '*' then @first * @second
    end
  end
  erb :home
end

get '/power' do
  @first = params[:first].to_f
  @second = params[:second].to_f 
  @result = @first ** @second
  erb :power
end

get '/sqrt' do
  @first = params[:first].to_f
  @result = Math.sqrt(@first)
  erb :sqrt
end

get '/bmi' do
  @measuring_system = params[:measuring_system]
  if @measuring_system
    @first = params[:first].to_f
    @second = params[:second].to_f

    @result = case @measuring_system
    when 'm' then (@first / (@second**2)).round(2)
    when 'i' then ((@first / (@second**2))*703).round(2)
    end
  end
  erb :bmi
end

get '/mortgage' do   
  @principal = params[:principal].to_f
  @interest_rate = params[:interest_rate].to_f 
  @number_of_payments = params[:number_of_payments].to_f

  @result = (@principal * ((@interest_rate * ((1 + @interest_rate) **@number_of_payments)) / (((1 + @interest_rate)**@number_of_payments)-1))).round(2)  
  erb :mortgage
end

get '/trip_calc' do
  @distance = params[:distance].to_f
  @speed = params[:speed].to_f
  @cost_per_gallon = params[:cost_per_gallon].to_f
  @fuel_efficiency = params[:fuel_efficiency].to_f
  
  @result_length = (@distance / @speed).round(1)
  @result_cost = @distance / (@fuel_efficiency - (@speed - 60) *2) * @cost_per_gallon
  
  @result = []

  @result << @result_length
  @result << @result_cost

  erb :trip
end
