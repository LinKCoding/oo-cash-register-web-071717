require 'pry'

class CashRegister
  attr_accessor :items, :total
  attr_reader :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity.to_f
    quantity.times do
      self.items << title
    end
  end

  def apply_discount
    unless self.discount == 0
      self.total = self.total * (1 - self.discount/100.0)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = 0
  end

end
