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
   


 erb :home
end
