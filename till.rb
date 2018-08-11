class Till
  attr_reader(:id, :money)

  def initialize(id)
    @id = id
    @money = 0
  end

  def take_payment(guest, amount)
    if guest.wallet >= amount
      guest.remove_money(amount)
      @money += amount
      return true
    end
    return false
  end
end
