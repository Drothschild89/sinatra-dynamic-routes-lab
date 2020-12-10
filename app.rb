require_relative 'config/environment'

class App < Sinatra::Base

    get "/reversename/:name" do
    @user_name = params[:name].reverse
    "#{@user_name}"
    end

    get '/square/:number' do
      "#{params[:number].to_i * params[:number].to_i}"
    end

    get "/say/:number/:phrase" do
      empty_string = ""
      @number = params[:number].to_i
      @phrase = params[:phrase]
      @number.times{empty_string += "#{@phrase}"}
      empty_string
    end

    get '/say/:word1/:word2/:word3/:word4/:word5' do
      @word_1 = params[:word1]
      @word_2 = params[:word2]
      @word_3 = params[:word3]
      @word_4 = params[:word4]
      @word_5 = params[:word5]
      "#{@word_1} #{@word_2} #{@word_3} #{@word_4} #{@word_5}."
    end

    get '/:operation/:number1/:number2' do
      @operation = params[:operation]      
      @number1 = params[:number1].to_i      
      @number2 = params[:number2].to_i      
      operations = {'add' => '+', 'multiply' => '*', 'divide' => '/', 'subtract' => '-'}
      op_to_use = operations[@operation]
      "#{@number1.send(op_to_use, @number2)}"
    end

end