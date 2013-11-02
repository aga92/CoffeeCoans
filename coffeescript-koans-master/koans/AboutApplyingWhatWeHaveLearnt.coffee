describe 'About Applying What We Have Learnt', ->
  operations = [
    { direction: 'RT', distance: 200}
    { direction: 'FWD', distance: 50}
    { direction: 'RT', distance: 100}
    { direction: 'RT', distance: 20}
    { direction: 'FWD', distance: 200}
    { direction: 'RT', distance: 10}
  ]

  it 'should find a needle in a haystack (imperative)', ->
    findNeedle = (ops) ->
      hasInvalidOperation = false
      for i in [0..ops.length-1]
        if (ops[i].direction == 'FWD' && ops[i].distance > 100)
          hasInvalidOperation = true
          break
      return hasInvalidOperation

    expect(findNeedle(operations)).toBe(true)


  it 'should find needle in a haystack (functional)', ->
    # FILL_ME_IN solution goes in here
    # HINT: one way of doing this would be a 'for in when' construct using sum and
    # filter functions, the existential operator is also useful
    isInvalid = (operation) ->
      return operation.direction == 'FWD' && operation.distance > 100
    findNeedle = (ops) ->
      invalidOps = ops.filter isInvalid
      return invalidOps?
    (expect findNeedle(operations)).toBe(true)


  it 'should add all the natural numbers below 1000 that are multiples of 3 or 5 (imperative)', ->
    total = 0
    for i in [1..1000]
      if (i % 3 == 0 || i % 5 == 0)
        total += i
    expect(total).toBe(234168)


  it 'should add all the natural numbers below 1000 that are multiples of 3 or 5 (functional)', ->
    # FILL_ME_IN solution goes in here
    # HINT: one way of doing this would be a 'for in when' construct using sum and
    # filter functions
    isDivisibleBy3Or5 = (num) ->
      return (num % 3 == 0 || num % 5 == 0)
    sum = (i, a) -> i + a
    mySum = ([1..1000].filter isDivisibleBy3Or5).reduce sum
    (expect mySum).toBe(234168)


  it 'should find the sum of all the even valued terms in the fibonacci sequence which do not exceed four million (imperative)', ->
    sum = 0
    fib = [0, 1, 1]
    i = 3
    currentFib = 0

    # Note, the condition in the while loop isn't strictly necessary, as the first fib
    # >4m is actually odd, but it is good practice for avoiding fencepost errors
    while (currentFib = fib[i] = fib[i-1] + fib[i-2]) < 4000000
      if (currentFib % 2 == 0)
        sum += currentFib
      i+=1
    expect(sum).toBe(4613732)


  it 'should find the sum of all the even valued terms in the fibonacci sequence which do not exceed four million (functional)', ->
    # FILL_ME_IN solution goes in here
    # HINT: one way of doing this would be to construct an array of Fibonacci numbers
    # using a function and a while loop, and then to filter it using an even function
    fib0 = 0
    fib1 = 1
    fib2 = 1
    next_fib = ->
      fib0 = fib1
      fib1 = fib2
      fib2 = fib0 + fib1
      return fib1
    fibb = (next_fib() while fib2<4000000)
    mySum = (fibb.filter (num)-> num%2==0).reduce (i, a)->i+a
    expect(mySum).toBe(4613732)
    

# UNCOMMENT FOR EXTRA CREDIT  
  it 'should find the largest prime factor of a composite number', ->
    lpf = (myNumber) ->
      i = 2
      while myNumber>1
        if(myNumber % i == 0)
          myNumber = myNumber / i
        else i = i+1
      return i
    expect(lpf(90720)).toBe(7)
    
  it 'should find the largest palindrome made from the product of two 3 digit numbers', ->
    isPalindrome = (num) ->
       myString = num.toString()
       revString = myString.split("").reverse().join ""
       return myString == revString
    palindrome = ->
      max_pal = 0
      for num1 in [100..999]
        for num2 in [100..999]
          prod = num1 * num2
          if(prod > max_pal && isPalindrome(prod))
            max_pal = prod
      return max_pal
    expect(palindrome()).toBe(906609)
  
#  it 'should what is the smallest number divisible by each of the numbers 1 to 20', ->

#  it 'should what is the difference between the sum of the squares and the square of the sums', ->

#  it 'should find the 10001st prime', ->

