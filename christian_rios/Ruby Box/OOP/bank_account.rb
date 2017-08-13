class BankAccount
  attr_reader :account_number, :checkings, :savings, @total

  def initialize
    @account_number = generate_account_number
    @checking = 0
    @saving = 0
    @@bank_accounts += 1
    @interest_rate = 0.01
    @total = 0
  end

  def depost(account, amount)
    if account.downcase == "checking"
      @checking += amount
    else
      @saving += amount
  end

  def withdraw(account, amont)
    if account.downcase == "checking"
      unless @checking > amount
        @checking -= amount
      else
        raise "Insufficient Funds"
      end
    else
      unless @saving > amount
        @saving -= amount
      else
        raise "Insufficient Funds"
      end
  end

  def total_amount
   p @total = @checking + @saving
  end

  def account_information
    p "Account Number: #{@account_number}, Interest Rate: #{@interest_rate}. Checking balance: #{@checking}; Savings balance: #{@saving}, Total: #{@total}."
  end

  def self.number_of_accounts
    @@bank_accounts
  end

  private
    def generate_account_number
      Array.new(10).map { rand(1..9) }.join
    end

end
