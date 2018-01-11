require 'pry'

class Transfer
attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end

end
