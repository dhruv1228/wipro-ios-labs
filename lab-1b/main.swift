
import Foundation



public class CustomerAccount {


    private var amount: Double
    private var history: [String] = []


    public let holderName: String


    fileprivate var typeOfAccount = "Current"


    internal let bank = "XYZ Bank"


    public var balanceDetails: Double {
        return amount
    }


    public var allTransactions: [String] {
        return history
    }


    public init?(name: String, initialAmount: Double) {

        guard !name.isEmpty && initialAmount >= 0 else {
            return nil
        }

        holderName = name
        amount = initialAmount

        history.append("New account opened")
    }


    public func addMoney(_ value: Double) {

        guard value > 0 else {
            print("Please enter a valid deposit amount")
            return
        }

        amount += value
        history.append("Amount added: \(value)")

        print("Deposit completed successfully")
    }


    public func takeMoney(_ value: Double) {

        guard value > 0 else {
            print("Please enter a valid withdrawal amount")
            return
        }

        guard value <= amount else {
            print("Your account has insufficient funds")
            return
        }

        amount -= value
        history.append("Amount withdrawn: \(value)")

        print("Withdrawal completed successfully")
    }
}




fileprivate func displayAccountCategory(_ customer: CustomerAccount) {
    print("Account Category:", customer.typeOfAccount)
}




print("===== CUSTOMER BANK DETAILS =====")

if let customer = CustomerAccount(
    name: "Dhruv Pachauri",
    initialAmount: 6000
) {

    print("Customer:", customer.holderName)
    print("Bank:", customer.bank)

    displayAccountCategory(customer)

    print("Initial Balance:", customer.balanceDetails)



    print("\n===== ADD MONEY =====")

    customer.addMoney(1500)
    print("Available Balance:", customer.balanceDetails)



    print("\n===== TAKE MONEY =====")

    customer.takeMoney(800)
    print("Available Balance:", customer.balanceDetails)



    print("\n===== DEPOSIT VALIDATION =====")

    customer.addMoney(-200)



    print("\n===== WITHDRAWAL VALIDATION =====")

    customer.takeMoney(10000)



    print("\n===== ACCOUNT STATEMENT =====")

    for (index, record) in customer.allTransactions.enumerated() {
        print("\(index + 1). \(record)")
    }



    print("\n===== FINAL ACCOUNT SUMMARY =====")
    print("Account Holder:", customer.holderName)
    print("Final Balance:", customer.balanceDetails)

} else {

    print("Unable to open account. Check the entered details.")
}




print("\n===== CHECK INVALID ACCOUNT =====")

if let testCustomer = CustomerAccount(
    name: "",
    initialAmount: -100
) {
    print("Account successfully created")
} else {
    print("Account creation failed due to invalid details")
}
