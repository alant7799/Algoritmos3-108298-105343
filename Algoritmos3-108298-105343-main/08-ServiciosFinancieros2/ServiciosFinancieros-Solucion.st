!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests'!
test01BalanceOfPortfolioWithoutAccountsIsZero
	self
		assert: 0
		equals: Portfolio new balance.! !

!PortfolioTest methodsFor: 'tests'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: temp1.
	temp2 _ Portfolio with: temp1.
	self
		assert: temp1 balance
		equals: temp2 balance.! !

!PortfolioTest methodsFor: 'tests'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios
	| temp1 temp2 temp3 temp4 |
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: temp1.
	temp2 _ Portfolio with: temp1.
	temp3 _ ReceptiveAccount new.
	Withdraw
		register: 50 * peso
		on: temp3.
	temp4 _ Portfolio
		with: temp2
		with: temp3.
	self
		assert: temp3 balance + temp2 balance
		equals: temp4 balance.! !

!PortfolioTest methodsFor: 'tests'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction
	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso)).! !

!PortfolioTest methodsFor: 'tests'!
test05PortfolioHasRegisteredItsAccountsTransactions
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp3 _ Deposit
		register: 100 * peso
		on: temp1.
	temp2 _ Portfolio with: temp1.
	self assert: (temp2 hasRegistered: temp3).! !

!PortfolioTest methodsFor: 'tests'!
test06PortfolioLooksForRegisteredTransactionsRecursively
	| temp1 temp2 temp3 temp4 temp5 temp6 |
	temp1 _ ReceptiveAccount new.
	temp6 _ Deposit
		register: 100 * peso
		on: temp1.
	temp2 _ Portfolio with: temp1.
	temp3 _ ReceptiveAccount new.
	temp5 _ Withdraw
		register: 50 * peso
		on: temp3.
	temp4 _ Portfolio
		with: temp2
		with: temp3.
	self assert: (temp4 hasRegistered: temp6).
	self assert: (temp4 hasRegistered: temp5).! !

!PortfolioTest methodsFor: 'tests'!
test07PortfolioHasNoTransactionWhenHasNoAccounts
	self assert: Portfolio new transactions isEmpty.! !

!PortfolioTest methodsFor: 'tests'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions
	| temp1 temp2 temp3 temp4 temp5 |
	temp1 _ ReceptiveAccount new.
	temp3 _ Deposit
		register: 100 * peso
		on: temp1.
	temp5 _ Withdraw
		register: 100 * peso
		on: temp1.
	temp2 _ Portfolio with: temp1.
	temp4 _ temp2 transactions.
	self
		assert: 2
		equals: temp4 size.
	self assert: (temp4 includes: temp3).
	self assert: (temp4 includes: temp5).! !

!PortfolioTest methodsFor: 'tests'!
test09PortfolioTransactionsAreCalculatedRecursively
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 |
	temp1 _ ReceptiveAccount new.
	temp6 _ Deposit
		register: 100 * peso
		on: temp1.
	temp2 _ Portfolio with: temp1.
	temp3 _ ReceptiveAccount new.
	temp5 _ Withdraw
		register: 50 * peso
		on: temp3.
	temp4 _ Portfolio
		with: temp2
		with: temp3.
	temp7 _ temp4 transactions.
	self
		assert: 2
		equals: temp7 size.
	self assert: (temp7 includes: temp6).
	self assert: (temp7 includes: temp5).! !

!PortfolioTest methodsFor: 'tests'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Portfolio with: temp1.
	self
		should: [ temp2 add: temp1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :argm2_3 |
			self
				assert: Portfolio canNotAddAccountErrorMessage
				equals: argm2_3 messageText.
			self
				assert: 1
				equals: temp2 accountsSize.
			self assert: (temp2 accountsIncludes: temp1) ].! !

!PortfolioTest methodsFor: 'tests'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Portfolio with: temp1.
	temp3 _ Portfolio with: temp2.
	self
		should: [ temp3 add: temp1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :argm3_4 |
			self
				assert: Portfolio canNotAddAccountErrorMessage
				equals: argm3_4 messageText.
			self
				assert: 1
				equals: temp3 accountsSize.
			self assert: (temp3 accountsIncludes: temp2) ].! !

!PortfolioTest methodsFor: 'tests'!
test12PortfolioCanNotIncludeItself
	| temp1 |
	temp1 _ Portfolio new.
	self
		should: [ temp1 add: temp1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :argm1_2 |
			self
				assert: Portfolio canNotAddAccountErrorMessage
				equals: argm1_2 messageText.
			self
				assert: 0
				equals: temp1 accountsSize ].! !

!PortfolioTest methodsFor: 'tests'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Portfolio new.
	temp3 _ Portfolio with: temp2.
	temp3 add: temp1.
	self
		should: [ temp2 add: temp1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :argm4_4 |
			self
				assert: Portfolio canNotAddAccountErrorMessage
				equals: argm4_4 messageText.
			self assert: temp2 accountsIsEmpty ].! !

!PortfolioTest methodsFor: 'tests'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively
	| temp1 temp2 temp3 temp4 temp5 temp6 |
	temp1 _ ReceptiveAccount new.
	temp4 _ Portfolio new.
	temp2 _ Portfolio with: temp4.
	temp3 _ Portfolio with: temp2.
	temp3 add: temp1.
	temp5 _ Portfolio with: temp4.
	temp6 _ Portfolio with: temp5.
	temp6 add: temp1.
	self
		should: [ temp4 add: temp1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :argm8_7 |
			self
				assert: Portfolio canNotAddAccountErrorMessage
				equals: argm8_7 messageText.
			self assert: temp4 accountsIsEmpty ].! !

!PortfolioTest methodsFor: 'tests'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd
	| temp1 temp2 temp3 temp4 |
	temp4 _ ReceptiveAccount new.
	temp2 _ Portfolio new.
	temp3 _ Portfolio
		with: temp4
		with: temp2.
	temp1 _ Portfolio with: temp4.
	self
		should: [ temp2 add: temp1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :argm4_5 |
			self
				assert: Portfolio canNotAddAccountErrorMessage
				equals: argm4_5 messageText.
			self assert: temp2 accountsIsEmpty ].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated
	| temp1 |
	temp1 _ ReceptiveAccount new.
	self
		assert: 0
		equals: temp1 balance.! !

!ReceptiveAccountTest methodsFor: 'tests'!
test02DepositIncreasesBalanceOnTransactionValue
	| temp1 |
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: temp1.
	self
		assert: 100 * peso
		equals: temp1 balance.! !

!ReceptiveAccountTest methodsFor: 'tests'!
test03WithdrawDecreasesBalanceOnTransactionValue
	| temp1 |
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: temp1.
	Withdraw
		register: 50 * peso
		on: temp1.
	self
		assert: 50 * peso
		equals: temp1 balance.! !

!ReceptiveAccountTest methodsFor: 'tests'!
test04WithdrawValueMustBePositive
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ 50 * peso.
	self
		assert: temp2
		equals:
			(Withdraw
				register: temp2
				on: temp1) value.! !

!ReceptiveAccountTest methodsFor: 'tests'!
test05ReceptiveAccountKnowsRegisteredTransactions
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Deposit
		register: 100 * peso
		on: temp1.
	temp3 _ Withdraw
		register: 50 * peso
		on: temp1.
	self assert: (temp1 hasRegistered: temp2).
	self assert: (temp1 hasRegistered: temp3).! !

!ReceptiveAccountTest methodsFor: 'tests'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Deposit for: 100 * peso.
	temp3 _ Withdraw for: 50 * peso.
	self deny: (temp1 hasRegistered: temp2).
	self deny: (temp1 hasRegistered: temp3).! !

!ReceptiveAccountTest methodsFor: 'tests'!
test07AccountKnowsItsTransactions
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Deposit
		register: 50 * peso
		on: temp1.
	self
		assert: 1
		equals: temp1 transactions size.
	self assert: (temp1 transactions includes: temp2).! !


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTest methodsFor: 'as yet unclassified'!
test01AccountSummaryKnowsHowToShowAReportWithADepositFor100
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp1 register: (Deposit for: 100).
	temp2 _ AccountSummary new obtainSummaryFor: temp1.
	self
		assert: temp2
		equals: (OrderedCollection with: 'Depósito por 100 pesos').! !

!ReportTest methodsFor: 'as yet unclassified'!
test02AccountSummaryKnowsHowToShowAReportWithADepositFor200
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp1 register: (Deposit for: 200).
	temp2 _ AccountSummary new obtainSummaryFor: temp1.
	self
		assert: temp2
		equals: (OrderedCollection with: 'Depósito por 200 pesos').! !

!ReportTest methodsFor: 'as yet unclassified'!
test03AccountSummaryKnowsHowToShowAReportWithAWithdrawFor200
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp1 register: (Withdraw for: 200).
	temp2 _ AccountSummary new obtainSummaryFor: temp1.
	self
		assert: temp2
		equals: (OrderedCollection with: 'Extracción por 200 pesos').! !

!ReportTest methodsFor: 'as yet unclassified'!
test04AccountSummaryKnowsHowToShowAReportWithAWithdrawFor100
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp1 register: (Withdraw for: 100).
	temp2 _ AccountSummary new obtainSummaryFor: temp1.
	self
		assert: temp2
		equals: (OrderedCollection with: 'Extracción por 100 pesos').! !

!ReportTest methodsFor: 'as yet unclassified'!
test05AccountSummaryKnowsHowToShowAReportWithATransferForDeposit100
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	Transfer
		amount: 100 * peso
		from: temp2
		to: temp1.
	temp3 _ AccountSummary new obtainSummaryFor: temp1.
	self
		assert: temp3
		equals: #('Entrada por transferencia de 100 * pesos' ) asOrderedCollection.! !

!ReportTest methodsFor: 'as yet unclassified'!
test06AccountSummaryKnowsHowToShowAReportWithAWithdrawFor100AndADepositFor200
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp1 register: (Withdraw for: 100).
	temp1 register: (Deposit for: 200).
	temp2 _ AccountSummary new obtainSummaryFor: temp1.
	self
		assert: temp2
		equals: #('Extracción por 100 pesos' 'Depósito por 200 pesos' ) asOrderedCollection.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount
	| temp1 temp2 |
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp2.
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp1.
	Transfer
		amount: 2 * peso
		from: temp2
		to: temp1.
	self
		assert: 8 * peso
		equals: temp2 balance.
	self
		assert: 12 * peso
		equals: temp1 balance.! !

!TransferTest methodsFor: 'as yet unclassified'!
test02ATransferKnowsItsValue
	| temp1 temp2 temp3 |
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp2.
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp1.
	temp3 _ Transfer
		amount: 2 * peso
		from: temp2
		to: temp1.
	self
		assert: 2 * peso
		equals: temp3 value.! !

!TransferTest methodsFor: 'as yet unclassified'!
test03DepositLegKnowsItsWithdrawCounterpart
	| temp1 temp2 temp3 |
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp2.
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp1.
	temp3 _ Transfer
		amount: 2 * peso
		from: temp2
		to: temp1.
	self
		assert: temp3 withdrawLeg
		equals: temp3 depositLeg withdrawLeg.! !

!TransferTest methodsFor: 'as yet unclassified'!
test04WithdrawLegKnowsItsDepositCounterpart
	| temp1 temp2 temp3 |
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp2.
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp1.
	temp3 _ Transfer
		amount: 2 * peso
		from: temp2
		to: temp1.
	self
		assert: temp3 depositLeg
		equals: temp3 withdrawLeg depositLeg.! !

!TransferTest methodsFor: 'as yet unclassified'!
test05OriginAndDestinationAccountsCannotBeTheSame
	| temp1 |
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp1.
	self
		should: [
			Transfer
				amount: 2 * peso
				from: temp1
				to: temp1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :argm2_2 |
			self
				assert: Transfer cannotTransferToOriginErrorDescription
				equals: argm2_2 messageText.
			self
				assert: 10 * peso
				equals: temp1 balance ].! !

!TransferTest methodsFor: 'as yet unclassified'!
test06CannotTransferAZeroAmount
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 10 * peso
		on: temp1.
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 5 * peso
		on: temp2.
	self
		should: [
			Transfer
				amount: 0
				from: temp1
				to: temp2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :argm4_3 |
			self
				assert: Transfer cannotTransferZeroErrorDescription
				equals: argm4_3 messageText.
			self
				assert: 10 * peso
				equals: temp1 balance ].! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol'!
balance
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol'!
hasRegistered: arg1
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol'!
transactions
	self subclassResponsibility.! !


!Account methodsFor: 'composition'!
addedTo: arg1
	self subclassResponsibility.! !

!Account methodsFor: 'composition'!
isComposedBy: arg1
	self subclassResponsibility.! !


!Account methodsFor: 'private'!
addTransactionsTo: arg1
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization'!
initialize
	accounts _ OrderedCollection new.
	parents _ OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol'!
balance
	^ accounts
		sum: [ :argm0_1 |
			argm0_1 balance ]
		ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'main protocol'!
hasRegistered: arg1
	^ accounts anySatisfy: [ :argm0_2 |
		argm0_2 hasRegistered: arg1 ].! !

!Portfolio methodsFor: 'main protocol'!
transactions
	| temp1 |
	temp1 _ OrderedCollection new.
	accounts do: [ :argm1_2 |
		argm1_2 addTransactionsTo: temp1 ].
	^ temp1.! !


!Portfolio methodsFor: 'accounts management'!
accountsIncludes: arg1
	^ accounts includes: arg1.! !

!Portfolio methodsFor: 'accounts management'!
accountsIsEmpty
	^ accounts isEmpty.! !

!Portfolio methodsFor: 'accounts management'!
accountsSize
	^ accounts size.! !

!Portfolio methodsFor: 'accounts management'!
add: arg1
	self assertCanAdd: arg1.
	accounts add: arg1.
	arg1 addedTo: self.! !


!Portfolio methodsFor: 'private'!
addTransactionsTo: arg1
	accounts do: [ :argm0_2 |
		argm0_2 addTransactionsTo: arg1 ].! !


!Portfolio methodsFor: 'composition'!
addRootParentsTo: arg1
	parents
		ifEmpty: [ arg1 add: self ]
		ifNotEmpty: [
			parents do: [ :argm0_2 |
				argm0_2 addRootParentsTo: arg1 ]].! !

!Portfolio methodsFor: 'composition'!
addedTo: arg1
	parents add: arg1.! !

!Portfolio methodsFor: 'composition'!
anyRootParentIsComposedBy: arg1
	^ self rootParents anySatisfy: [ :argm0_2 |
		argm0_2 isComposedBy: arg1 ].! !

!Portfolio methodsFor: 'composition'!
assertCanAdd: arg1
	(self anyRootParentIsComposedBy: arg1) ifTrue: [ self signalCanNotAddAccount ].! !

!Portfolio methodsFor: 'composition'!
isComposedBy: arg1
	^ self = arg1 or: [
		accounts anySatisfy: [ :argm0_2 |
			(argm0_2 isComposedBy: arg1) or: [ arg1 isComposedBy: argm0_2 ]]].! !

!Portfolio methodsFor: 'composition'!
rootParents
	| temp1 |
	temp1 _ Set new.
	self addRootParentsTo: temp1.
	^ temp1.! !

!Portfolio methodsFor: 'composition'!
signalCanNotAddAccount
	self error: self class canNotAddAccountErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified'!
canNotAddAccountErrorMessage
	^ 'Can not add repeated account to a portfolio'.! !

!Portfolio class methodsFor: 'as yet unclassified'!
with: arg1
	^ self new
		add: arg1;
		yourself.! !

!Portfolio class methodsFor: 'as yet unclassified'!
with: arg1 with: arg2
	^ self new
		add: arg1;
		add: arg2;
		yourself.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization'!
initialize
	super initialize.
	transactions _ OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol'!
balance
	^ transactions
		inject: 0
		into: [ :argm0_1 :argm0_2 |
			argm0_2 affectBalance: argm0_1 ].! !

!ReceptiveAccount methodsFor: 'main protocol'!
hasRegistered: arg1
	^ transactions includes: arg1.! !

!ReceptiveAccount methodsFor: 'main protocol'!
register: arg1
	transactions add: arg1.! !

!ReceptiveAccount methodsFor: 'main protocol'!
transactions
	^ transactions copy.! !


!ReceptiveAccount methodsFor: 'private'!
addTransactionsTo: arg1
	arg1 addAll: transactions.! !


!ReceptiveAccount methodsFor: 'composition'!
addedTo: arg1
	^ self.! !

!ReceptiveAccount methodsFor: 'composition'!
isComposedBy: arg1
	^ self = arg1.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'as yet unclassified'!
obtainSummaryFor: arg1
	| temp2 |
	temp2 _ OrderedCollection new.
	arg1 transactions do: [ :argm1_3 |
		temp2 add: argm1_3 print ].
	^ temp2.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value'!
print
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value'!
value
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'balance'!
affectBalance: arg1
	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization'!
initializeFor: arg1
	value _ arg1.! !


!Deposit methodsFor: 'value'!
print
	| temp1 |
	temp1 _ 'Depósito por ' append: self value asString.
	temp1 _ temp1 append: ' pesos'.
	^ temp1.! !

!Deposit methodsFor: 'value'!
value
	^ value.! !


!Deposit methodsFor: 'balance'!
affectBalance: arg1
	^ arg1 + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation'!
for: arg1
	^ self new initializeFor: arg1.! !


!Deposit class methodsFor: 'as yet unclassified'!
register: arg1 on: arg2
	| temp3 |
	temp3 _ self for: arg1.
	arg2 register: temp3.
	^ temp3.! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value'!
value
	^ transfer value.! !


!TransferLeg methodsFor: 'initialization'!
initializeWith: arg1
	transfer _ arg1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified'!
of: arg1 on: arg2
	| temp3 |
	temp3 _ self new initializeWith: arg1.
	arg2 register: temp3.
	^ temp3.! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing'!
withdrawLeg
	^ transfer withdrawLeg.! !


!TransferDepositLeg methodsFor: 'balance'!
affectBalance: arg1
	^ arg1 + self value.! !


!TransferDepositLeg methodsFor: 'AA'!
print
	| temp1 |
	temp1 _ 'Entrada por transferencia de ' append: self value asString.
	^ temp1.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing'!
depositLeg
	^ transfer depositLeg.! !


!TransferWithdrawLeg methodsFor: 'balance'!
affectBalance: arg1
	^ arg1 - self value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization'!
initializeFor: arg1
	value _ arg1.! !


!Withdraw methodsFor: 'value'!
value
	^ value.! !


!Withdraw methodsFor: 'balance'!
affectBalance: arg1
	^ arg1 - value.! !


!Withdraw methodsFor: 'AAA'!
print
	| temp1 |
	temp1 _ 'Extracción por ' append: self value asString.
	temp1 _ temp1 append: ' pesos'.
	^ temp1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation'!
for: arg1
	^ self new initializeFor: arg1.! !


!Withdraw class methodsFor: 'as yet unclassified'!
register: arg1 on: arg2
	| temp3 |
	temp3 _ self for: arg1.
	arg2 register: temp3.
	^ temp3.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value'!
value
	^ value.! !


!Transfer methodsFor: 'accessing'!
depositLeg
	^ depositLeg.! !

!Transfer methodsFor: 'accessing'!
withdrawLeg
	^ withdrawLeg.! !


!Transfer methodsFor: 'initialization'!
initializeWith: arg1 withdrawLeg: arg2 depositLeg: arg3
	value _ arg1.
	withdrawLeg _ arg2.
	depositLeg _ arg3.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors'!
cannotTransferToOriginErrorDescription
	^ 'Transfer destionation cannot be the origin account'.! !

!Transfer class methodsFor: 'errors'!
cannotTransferZeroErrorDescription
	^ 'Transfer amount should be positive'.! !

!Transfer class methodsFor: 'errors'!
signalCannotTransferToOrigin
	self error: self cannotTransferToOriginErrorDescription.! !

!Transfer class methodsFor: 'errors'!
signalCannotTransferZero
	self error: self cannotTransferZeroErrorDescription.! !


!Transfer class methodsFor: 'assertions'!
assert: arg1 canBeTransferedTo: arg2 from: arg3
	self
		assertCanTransferTo: arg2
		from: arg3.
	self assertCanTransfer: arg1.! !

!Transfer class methodsFor: 'assertions'!
assertCanTransfer: arg1
	^ arg1 isZero ifTrue: [ self signalCannotTransferZero ].! !

!Transfer class methodsFor: 'assertions'!
assertCanTransferTo: arg1 from: arg2
	^ arg2 = arg1 ifTrue: [ self signalCannotTransferToOrigin ].! !


!Transfer class methodsFor: 'instance creation'!
amount: arg1 from: arg2 to: arg3
	| temp4 temp5 temp6 |
	self
		assert: arg1
		canBeTransferedTo: arg3
		from: arg2.
	temp4 _ self new.
	temp6 _ TransferWithdrawLeg
		of: temp4
		on: arg2.
	temp5 _ TransferDepositLeg
		of: temp4
		on: arg3.
	^ temp4
		initializeWith: arg1
		withdrawLeg: temp6
		depositLeg: temp5.! !
