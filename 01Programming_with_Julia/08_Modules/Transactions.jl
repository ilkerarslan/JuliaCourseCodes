module Transactions

include("BankModule.jl")
include("CustomerModule.jl")

using .BankModule, .CustomerModule

# Re-export the types and functions from BankModule and CustomerModule
export Bank, Customer

# Export our own functions
export deposit, withdraw

function deposit(cust::Customer, bank::Bank, amount::Float64)
    if cust.cash ≥ amount 
        cust.cash -= amount 
        cust.bankdeposit += amount 
        bank.cash += amount 
        bank.totalDeposit += amount 
    else
        println("Not enough cash to deposit this amount!")
    end
end

function withdraw(cust::Customer, bank::Bank, amount::Float64)
    if bank.cash ≥ amount 
        if cust.bankdeposit ≥ amount 
            bank.cash -= amount 
            bank.totalDeposit -= amount 
            cust.cash += amount 
            cust.bankdeposit -= amount 
        else
            println("You don't have that amount in your deposit account!")
        end
    else
        println("Not enough cash in our vaults. Sorry!")
    end
end

end # end of the module