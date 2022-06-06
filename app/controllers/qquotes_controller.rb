class QquotesController < ActionController::Base

  def show
    @quotes = Qquotes.all
    @current_quote = @quotes.sample


  end

end
