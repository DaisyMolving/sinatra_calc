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
   


 erb :mortgage
end

get '/trip_calc' do

erb :trip
end
