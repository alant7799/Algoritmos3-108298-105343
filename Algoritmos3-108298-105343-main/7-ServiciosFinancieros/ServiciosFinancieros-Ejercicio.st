!classDefinition: #AccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #AccountTest
	instanceVariableNames: 'debitorAccount creditorAccount transferenceFor69 accountWithTenThousandPesos accountWithNegativeFiveThousandPesos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTest methodsFor: 'transactions tests' stamp: 'IACS 6/8/2022 22:36:04'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := Account new.

	self assert: 0 equals: account balance
! !

!AccountTest methodsFor: 'transactions tests' stamp: 'IACS 6/8/2022 22:36:03'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := Account  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!AccountTest methodsFor: 'transactions tests' stamp: 'IACS 6/8/2022 22:36:03'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := Account new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!AccountTest methodsFor: 'transactions tests' stamp: 'IACS 6/8/2022 22:36:04'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := Account new.
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!AccountTest methodsFor: 'transactions tests' stamp: 'IACS 6/8/2022 22:36:04'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := Account new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'transactions tests' stamp: 'IACS 6/8/2022 22:36:04'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := Account new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'transactions tests' stamp: 'IACS 6/8/2022 22:36:04'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := Account new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!AccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/8/2022 22:38:56'!
test08ATransferenceBetweenTwoAccountsChangesTheBalancesAccordingly
	| aDebitor aCreditor aTransference |
	
	aDebitor := Account new.
	aCreditor := Account new.
	Transference transfer: 50*peso from: aDebitor to: aCreditor.
	
	self assert: -50*peso equals: aDebitor balance.
	self assert: 50*peso equals: aCreditor balance.
	! !

!AccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/8/2022 22:23:52'!
test09ATransferenceCantBeCreatedWithoutAPositiveAmount
	self should: [Transference transfer: -50*peso from: debitorAccount to: creditorAccount .]
	raise: Error
	withExceptionDo:
	[ :anError | self assert: anError messageText = Transference invalidAmountErrorDescription].
	
	! !

!AccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:15:56'!
test10ATransferenceCanBeAskedForItsValue
	self assert: 69*peso equals: transferenceFor69 value.
	
	! !

!AccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:15:43'!
test11ATransferenceCanBeAskedForItsDepositTransaction
	self assert: 69*peso equals: transferenceFor69 deposit value.
	
	! !

!AccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:15:32'!
test12ATransferenceCanBeAskedForItsWithdrawTransaction
	self assert: 69*peso equals: transferenceFor69 withdraw value.
	
	! !

!AccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:39:39'!
test13TheDepositOfATransactionCanBeAskedForItsCounterpart
	| withdrawToCompareWith |
	withdrawToCompareWith := Withdraw for: 69*peso.
	self assert: withdrawToCompareWith = transferenceFor69 deposit counterpart.! !

!AccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:39:39'!
test14TheWithdrawOfATransactionCanBeAskedForItsCounterpart
	| depositToCompareWith |
	depositToCompareWith := Deposit for: 69*peso.
	self assert: depositToCompareWith = transferenceFor69 withdraw counterpart.! !


!AccountTest methodsFor: 'portfolio tests' stamp: 'IACS 6/8/2022 19:35:54'!
test15APortfolioIsCreatedWithBalanceZero
	self assert: 0 equals: Portfolio new balance. ! !

!AccountTest methodsFor: 'portfolio tests' stamp: 'IACS 6/8/2022 19:52:57'!
test16WhenWeAddAnAccountToAPortfolioItYieldsTheBalanceOfThatAccount
	| aPortfolio |
	aPortfolio := Portfolio new.
	aPortfolio add: accountWithTenThousandPesos .
	self assert: 10000*peso equals: aPortfolio balance.
	! !

!AccountTest methodsFor: 'portfolio tests' stamp: 'IACS 6/8/2022 19:53:47'!
test17TheBalanceOfAPortfolioWithTwoAccountsIsTheSumOfTheBalancesOfTheAccounts
	| aPortfolio |
	aPortfolio := Portfolio new.
	aPortfolio add: accountWithTenThousandPesos.
	aPortfolio add: accountWithNegativeFiveThousandPesos .
	self assert: 5000*peso equals: aPortfolio balance.
	! !


!AccountTest methodsFor: 'setUp/tearDown' stamp: 'IACS 6/8/2022 22:36:03'!
setUp
	debitorAccount := Account new.
	creditorAccount := Account new.
	transferenceFor69 := Transference transfer: 69*peso from: debitorAccount to: creditorAccount.
	
	accountWithTenThousandPesos := Account new.
	Deposit register: 10000*peso on: accountWithTenThousandPesos.
	
	accountWithNegativeFiveThousandPesos := Account new.
	Withdraw register: 5000*peso on: accountWithNegativeFiveThousandPesos. ! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!Account methodsFor: 'main protocol' stamp: 'IACS 6/7/2022 10:10:14'!
balance

	^transactions sum: [ :aTransaction | aTransaction effectOnBalance ] ifEmpty: [ 0 ]! !

!Account methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!Account methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!Account methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'associating' stamp: 'IACS 6/7/2022 12:39:39'!
= anotherTransaction
	self subclassResponsibility .! !

!AccountTransaction methodsFor: 'associating' stamp: 'IACS 6/7/2022 12:28:31'!
counterpart
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'IACS 6/7/2022 10:09:29'!
effectOnBalance

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'associating' stamp: 'IACS 6/7/2022 12:39:39'!
= anotherTransaction
	^self effectOnBalance = anotherTransaction effectOnBalance.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositForTransference category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #DepositForTransference
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!DepositForTransference methodsFor: 'initialization' stamp: 'IACS 6/8/2022 23:06:05'!
initializeFor: anAmount withTransfer: aTransference 
	value := anAmount.
	transference := aTransference.! !


!DepositForTransference methodsFor: 'as yet unclassified' stamp: 'IACS 6/8/2022 23:08:56'!
counterpart
	^transference depositCounterpart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositForTransference class' category: 'ServiciosFinancieros-Ejercicio'!
DepositForTransference class
	instanceVariableNames: ''!


!DepositForTransference class methodsFor: 'instance creation' stamp: 'IACS 6/8/2022 23:02:15'!
for: anAmount withTransfer: aTransference 
	^self new initializeFor: anAmount withTransfer: aTransference ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'IACS 6/7/2022 10:09:49'!
effectOnBalance
	^ value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'associating' stamp: 'IACS 6/7/2022 12:39:39'!
= anotherTransaction
	^self effectOnBalance = anotherTransaction effectOnBalance.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawForTransference category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #WithdrawForTransference
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawForTransference methodsFor: 'associating' stamp: 'IACS 6/8/2022 22:55:38'!
counterpart
	^transference withdrawCounterpart.! !


!WithdrawForTransference methodsFor: 'initialization' stamp: 'IACS 6/8/2022 23:06:10'!
initializeFor: anAmount withTransfer: aTransference 
	value := anAmount.
	transference := aTransference.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawForTransference class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawForTransference class
	instanceVariableNames: ''!

!WithdrawForTransference class methodsFor: 'instance creation' stamp: 'IACS 6/8/2022 23:02:55'!
for: anAmount withTransfer: aTransference 
	^self new initializeFor: anAmount withTransfer: aTransference ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'assets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'IACS 6/8/2022 21:37:44'!
balance
	^assets sum: [ :anAccount | anAccount balance] ifEmpty: [0].! !


!Portfolio methodsFor: 'adding' stamp: 'IACS 6/8/2022 21:37:43'!
add: aReceptiveAccount 
	assets add: aReceptiveAccount.! !


!Portfolio methodsFor: 'initialization' stamp: 'IACS 6/8/2022 21:37:43'!
initialize
	assets := OrderedCollection new.! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'amount deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'instance creation' stamp: 'IACS 6/8/2022 23:01:01'!
initializeTransfer: anAmount from: aDebitorAccount to: aCreditorAccount 
	(anAmount positive not)ifTrue: [self error: Transference invalidAmountErrorDescription].
	deposit := DepositForTransference for: anAmount withTransfer: self.
	withdraw := WithdrawForTransference for: anAmount withTransfer: self.
	amount := anAmount.
	aDebitorAccount register: withdraw.
	aCreditorAccount register: deposit.! !



!Transference methodsFor: 'accessing' stamp: 'IACS 6/8/2022 22:24:27'!
deposit
	^deposit.! !

!Transference methodsFor: 'accessing' stamp: 'IACS 6/8/2022 23:07:32'!
depositCounterpart
	^withdraw.! !

!Transference methodsFor: 'accessing' stamp: 'IACS 6/7/2022 11:09:38'!
value
	^amount.! !

!Transference methodsFor: 'accessing' stamp: 'IACS 6/8/2022 22:24:34'!
withdraw
	^withdraw.! !

!Transference methodsFor: 'accessing' stamp: 'IACS 6/8/2022 23:08:06'!
withdrawCounterpart
	^deposit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'IACS 6/8/2022 22:13:28'!
transfer: aNumberOfPesos from: aReceptiveAccount to: anotherReceptiveAccount 
	^self new initializeTransfer: aNumberOfPesos from: aReceptiveAccount to: anotherReceptiveAccount ! !


!Transference class methodsFor: 'exception handling' stamp: 'IACS 6/7/2022 10:53:48'!
invalidAmountErrorDescription
	^ 'The amount of the transference must be positive'.! !
