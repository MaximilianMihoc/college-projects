# 1.    Multiples of 3 and 5
# Find the sum of all the multiples of 3 or 5 below 1000.


def multiple3and5():
    numbers = range(1, 1000)
    res = 0
    for num in numbers:
        if num % 3 == 0 or num % 5 == 0:
            res += num

    return res


print("Multiple of 3 and 5:" + str(multiple3and5()) )


# 2. Even Fibonacci numbers
# By considering the terms in the Fibonacci sequence 
# whose values do not exceed four million, find the sum of the even-valued terms.


def fibonacci_even_sum(maxNum):
    num1 = 1
    num2 = 2

    sum = 2
    #print(num2)

    while num1 + num2 <= maxNum:
        num3 = num1 + num2
        if num3 % 2 == 0:
            #print(num3)
            sum += num3

        num1 = num2
        num2 = num3

    return sum
# print("Even Sum is: " + str(fibonacci_even_sum(4000000)))

# 3. Largest Prime Number
# What is the largest prime factor of the number 600851475143 ?


def is_prime(num):
    if num > 1:
        n = round(num / 2) + 1
        for i in range(2,n):
            if(num % i == 0):
                return False
        return True
    return False


def largest_prime(number):
    max = 0
    for i in range(2, number):
        if number % i == 0:
            if is_prime(i):
                if max < i:
                    max = i
                    print(max)
    return max


# print(largest_prime(13195))
# print(largest_prime(600851475143))
# it took a long time to run this


# 4. Largest palindrome product
# Find the largest palindrome made from the product of two 3-digit numbers.

# function which return reverse of a string
def reverse(s):
    return s[::-1]


def is_palindrome(s):
    # Calling reverse function
    rev = reverse(s)

    # Checking if both string are equal or not
    if (s == rev):
        return True
    return False


def find_largest_palindrome():
    max1 = 0
    max2 = 0
    palindMax = 0
    for i in range(999, 100, -1):
        for j in range(i, 100, -1):
            num = i*j
            if num > palindMax:
                if is_palindrome(str(num)):
                    max1 = i
                    max2 = j
                    palindMax = num
    print(max1)
    print(max2)
    return palindMax

# print(find_largest_palindrome())

# 5. Smallest multiple
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


def smallest_multiple():
    ok = 1
    num = 2
    while ok == 1:
        ok = 0
        for i in range(2, 20):
            if num % i != 0:
                ok = 1

        if ok == 1:
            num += 1

    return num

# print(smallest_multiple())




