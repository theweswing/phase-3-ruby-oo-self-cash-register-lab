require 'pry'

class CashRegister
  attr_accessor :total
  attr_accessor :discount

  def initialize(discount = 1)
    @total = 0
    @discount = discount
    @totals = []
    @totals << @total
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity = 1)
    @totals << @total
    @transactions << [title, price, quantity]
    @total = @total + price * quantity
    i = 1
    while i <= quantity
      @items << title
      i += 1
    end
  end

  def apply_discount
    if (@discount == 1)
      'There is no discount to apply.'
    else
      discount_percentage = @discount * 0.01
      savings = discount_percentage * @total
      @total = @total - savings
      display_total = @total.to_i
      "After the discount, the total comes to $#{display_total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    last_transaction_price = @transactions[-1][-1] * @transactions[-1][1]
    @total = @total - last_transaction_price
  end
end
