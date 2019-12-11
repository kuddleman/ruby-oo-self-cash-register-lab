class CashRegister

  attr_accessor :total, :discount
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item_array = []
  end

  def add_item(title, price, quantity=1)
    @current_transaction_amount = price * quantity
    @total += (price * quantity)

    if quantity > 1
      i = 1
      while i <= quantity
        @item_array << title
        i += 1
      end
    else
      @item_array << title
    end 
  end

  def apply_discount
    if @discount > 0
      @discount = @discount/100.to_f
      @total = @total - (@total * @discount)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item_array
  end

  def void_last_transaction
    @total = @total - @current_transaction_amount
    @item_array.pop
    if @item_array.length == 0
      @total = 0.0
    end
  end


end
