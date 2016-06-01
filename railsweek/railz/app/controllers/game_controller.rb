class GameController < ApplicationController
  def try
    if cookies[:counter].nil?
      cookies[:counter] = 0
    end

    if cookies[:comp_number].nil?
      cookies[:comp_number] = rand(100)
    end

    @user_num = params[:guess].to_i
    @comp_number = cookies[:comp_number].to_i
    @counter = cookies[:counter].to_i

    if (@user_num > @comp_number) && @counter < 7
      @counter += 1
      cookies[:counter] = @counter
      @result = ' too high'
    end

    if (@user_num < @comp_number) && @counter < 7
      @counter += 1
      cookies[:counter] = @counter
      @result = ' too low'
    end

    if (@user_num == @comp_number) && @counter < 7
      @result = 'You win!'
      cookies[:comp_number] = rand(100)
      @counter = 0
    end

    if @counter >= 7
      @result = ' wrong. Too many tries. You suck.'
      @counter = 0
      cookies[:counter] = @counter
      cookies[:comp_number] = rand(100)
    end

    render "try.html.erb"
  end

  def refresh
    render "try.html.erb"
  end
end
