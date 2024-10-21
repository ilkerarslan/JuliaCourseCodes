include("BankModule.jl")
using .BankModule

b = Bank("First Bank")
defaultBank(b)   # will throw an error
BankModule.defaultBank(b);

import CustomerModule   # will throw an error
include("CustomerModule.jl")
using .CustomerModule
c = Customer("ilker")

CustomerModule.defaultCustomer(c);
c 

bank2 = Bank("Second Bank")
cust2 = Customer("Tom")

import .BankModule.defaultBank
defaultBank(bank2)
bank2

import .CustomerModule.defaultCustomer
defaultCustomer(cust2)
cust2

include("Transactions.jl")
using .Transactions

bank3 = Bank("Third Bank")
cust3 = Customer("Julia")

deposit(cust3, bank3, 10.0)
