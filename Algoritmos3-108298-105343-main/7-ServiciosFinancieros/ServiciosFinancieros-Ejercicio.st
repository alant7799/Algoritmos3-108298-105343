!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'debitorAccount creditorAccount transferenceFor69'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'transactions tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'transactions tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'transactions tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'transactions tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'transactions tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'transactions tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'transactions tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 11:12:47'!
test08ATransferenceBetweenTwoAccountsChangesTheBalancesAccordingly
	| transference |
	transference := Transference createTransferOf: 50*peso from: debitorAccount to: creditorAccount .
	transference execute.
	self assert: -50*peso equals: debitorAccount balance.
	self assert: 50*peso equals: creditorAccount balance.
	! !

!ReceptiveAccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 11:13:10'!
test09ATransferenceCantBeCreatedWithoutAPositiveAmount
	self should: [Transference createTransferOf: -50*peso from: debitorAccount to: creditorAccount .]
	raise: Error
	withExceptionDo:
	[ :anError | self assert: anError messageText = Transference invalidAmountErrorDescription].
	
	! !

!ReceptiveAccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:15:56'!
test10ATransferenceCanBeAskedForItsValue
	self assert: 69*peso equals: transferenceFor69 value.
	
	! !

!ReceptiveAccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:15:43'!
test11ATransferenceCanBeAskedForItsDepositTransaction
	self assert: 69*peso equals: transferenceFor69 deposit value.
	
	! !

!ReceptiveAccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:15:32'!
test12ATransferenceCanBeAskedForItsWithdrawTransaction
	self assert: 69*peso equals: transferenceFor69 withdraw value.
	
	! !

!ReceptiveAccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:39:39'!
test13TheDepositOfATransactionCanBeAskedForItsCounterpart
	| withdrawToCompareWith |
	withdrawToCompareWith := Withdraw for: 69*peso.
	self assert: withdrawToCompareWith = transferenceFor69 deposit counterpart.! !

!ReceptiveAccountTest methodsFor: 'transferences tests' stamp: 'IACS 6/7/2022 12:39:39'!
test14TheWithdrawOfATransactionCanBeAskedForItsCounterpart
	| depositToCompareWith |
	depositToCompareWith := Deposit for: 69*peso.
	self assert: depositToCompareWith = transferenceFor69 withdraw counterpart.! !


!ReceptiveAccountTest methodsFor: 'setUp/tearDown' stamp: 'IACS 6/7/2022 12:14:43'!
setUp
	debitorAccount := ReceptiveAccount new.
	creditorAccount := ReceptiveAccount new.
	transferenceFor69 := Transference createTransferOf: 69*peso from: debitorAccount to: creditorAccount ! !


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

!Deposit methodsFor: 'associating' stamp: 'IACS 6/7/2022 12:29:12'!
counterpart
	^Withdraw for: value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


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

!Withdraw methodsFor: 'associating' stamp: 'IACS 6/7/2022 12:40:23'!
counterpart
	^Deposit for: value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'IACS 6/7/2022 10:10:14'!
balance

	^transactions sum: [ :aTransaction | aTransaction effectOnBalance ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'amount debitor creditor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'instance creation' stamp: 'IACS 6/7/2022 10:52:01'!
initializeCreateTransferOf: anAmount from: aDebitor to: aCreditor
	(anAmount positive not)ifTrue: [self error: Transference invalidAmountErrorDescription].
	amount := anAmount.
	debitor := aDebitor.
	creditor := aCreditor.! !


!Transference methodsFor: 'execution' stamp: 'IACS 6/7/2022 10:39:50'!
execute
	Withdraw register: amount on: debitor.
	Deposit register: amount on: creditor.! !


!Transference methodsFor: 'accessing' stamp: 'IACS 6/7/2022 12:09:07'!
deposit
	^Deposit for: amount.! !

!Transference methodsFor: 'accessing' stamp: 'IACS 6/7/2022 11:09:38'!
value
	^amount.! !

!Transference methodsFor: 'accessing' stamp: 'IACS 6/7/2022 12:10:07'!
withdraw
	^Withdraw for: amount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'IACS 6/7/2022 10:37:30'!
createTransferOf: anAmount from: aDebitor to: aCreditor 
	^self new initializeCreateTransferOf: anAmount from: aDebitor to: aCreditor. ! !


!Transference class methodsFor: 'exception handling' stamp: 'IACS 6/7/2022 10:53:48'!
invalidAmountErrorDescription
	^ 'The amount of the transference must be positive'.! !
