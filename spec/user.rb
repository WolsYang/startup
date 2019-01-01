class User
	def initialize(amount)
      @amount = amount
    end

    def balance
      @amount
    end

    def deposit(amount)
      @amount += amount if amount > 0
    end
end