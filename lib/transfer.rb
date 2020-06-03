class Transfer
attr_accessor :sender, :amount, :status, :receiver
  def initialize(sender, receiver, amount)
    @sender = sender
    @status = "pending"
    @amount = amount
    @receiver = receiver
  end
  def valid?
    @sender.valid?
    @receiver.valid?
  end
  def execute_transaction
    if valid? && @sender.balance > @amount && status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end