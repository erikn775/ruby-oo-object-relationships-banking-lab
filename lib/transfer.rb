require 'pry'
class Transfer
  
    attr_accessor :sender, :receiver, :status, :amount
    attr_reader 

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end
  
    def valid?
      @sender.valid? && @receiver.valid? && status != "complete"
    end

    def execute_transaction
      if valid? && @amount <= @sender.balance
        @sender.balance = @sender.balance - @amount 
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
      else 
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
        
      end
      
      
    end

    def reverse_transfer
        if @status == "complete"
          @sender.balance = @sender.balance + @amount 
          @receiver.balance = @receiver.balance - @amount
          @status = "reversed"
        end
      
    end

end
