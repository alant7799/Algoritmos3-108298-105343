!classDefinition: #AccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #AccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 15:57:31'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := Account new.

	self assert: 0 equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 15:57:31'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := Account  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 15:57:31'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := Account new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 15:57:31'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := Account new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 15:57:31'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := Account new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 15:57:31'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := Account new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 15:57:31'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := Account new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 18:30:28'!
test08AccountSendingMoneyToAnotherDecreasesItsBalanceAndIncreasesReceiversBalance

	| senderAccount receiverAccount |
	
	senderAccount := Account new.
	receiverAccount := Account new.
	
	Transfer anAmount: 	100 fromAccount: senderAccount toAccount: receiverAccount.
		
	self assert: 100 equals: (receiverAccount balance).
	self assert: -100 equals: (senderAccount balance).
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 18:29:51'!
test09AccountsSendingMoneyAndReceivingMoneyRegisterTheTransaction

	| senderAccount receiverAccount transaction |
	
	senderAccount := Account new.
	receiverAccount := Account new.
	
	Transfer anAmount: 	100 fromAccount: senderAccount toAccount: receiverAccount.
	
	transaction := (senderAccount transactions) at: 1.
	
	self assert: (transaction amountForAccount: senderAccount) equals: -100.
	self assert: (transaction amountForAccount: receiverAccount) equals:  100. 
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 18:29:41'!
test10AccountsSendingMoneyAndReceivingMoneyCanVerifyATransferOriginAndDestiny

	| senderAccount receiverAccount transfer |
	
	senderAccount := Account new.
	receiverAccount := Account new.
	
	Transfer anAmount: 	100 fromAccount: senderAccount toAccount: receiverAccount.
	
	transfer := (senderAccount transactions) at: 1.
	
	self assert: (transfer isThisYourReceiverAccount: receiverAccount).
	self assert: (transfer isThisYourSenderAccount: senderAccount).
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 18:29:32'!
test11AccountTransferingMoneyCanSeeTheAmountOfTheTransfer

	| senderAccount receiverAccount transfer |
	
	senderAccount := Account new.
	receiverAccount := Account new.
	
	Transfer anAmount: 	100 fromAccount: senderAccount toAccount: receiverAccount.
	
	transfer := (senderAccount transactions) at: 1.
	
	self assert: (transfer amount) equals: 100. 
! !

!AccountTest methodsFor: 'tests' stamp: 'AT 6/7/2022 18:29:12'!
test12AccountTReceivingMoneyCanSeeTheAmountOfTheTransfer

	| senderAccount receiverAccount transfer |
	
	senderAccount := Account new.
	receiverAccount := Account new.
	
	Transfer anAmount: 	100 fromAccount: senderAccount toAccount: receiverAccount.
	
	transfer := (receiverAccount transactions) at: 1.
	
	self assert: (transfer amount) equals: 100. ! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!Account methodsFor: 'main protocol' stamp: 'AT 6/7/2022 17:32:55'!
balance

	^transactions sum: [ :aTransaction | aTransaction amountForAccount: self ] ifEmpty: [ 0 ]! !

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

!AccountTransaction methodsFor: 'value' stamp: 'AT 6/7/2022 17:27:54'!
amountForAccount

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

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


!Deposit methodsFor: 'value' stamp: 'AT 6/7/2022 17:27:32'!
amountForAccount: anAccount

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

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


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'accessing' stamp: 'AT 6/7/2022 17:35:14'!
amountForAccount: anAccount 
	^value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value sender reciber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'AT 6/7/2022 17:54:55'!
amount
	^value.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AT 6/7/2022 18:16:22'!
amountForAccount: anAccount
	(self isThisYourSenderAccount: anAccount) ifTrue: [^ value negated]. 
	^value.
	
	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AT 6/7/2022 18:26:51'!
isThisYourReceiverAccount: anAccount 
	^(reciber = anAccount).! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AT 6/7/2022 17:31:16'!
isThisYourSenderAccount: anAccount 
	^(sender = anAccount).! !


!Transfer methodsFor: 'initialization' stamp: 'AT 6/7/2022 17:23:41'!
initializeWithSenderAccount: aSenderAccount andReciberAccount: aReciberAccount anAmount: anAmount  

	sender := aSenderAccount.
	reciber := aReciberAccount.
	value := anAmount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'AT 6/7/2022 18:19:06'!
anAmount: anAmount fromAccount: senderAccount toAccount: reciberAccount
	| transfer |
	transfer := Transfer new initializeWithSenderAccount: senderAccount andReciberAccount: reciberAccount anAmount: anAmount.
	senderAccount register: transfer.
	reciberAccount register: transfer.! !
