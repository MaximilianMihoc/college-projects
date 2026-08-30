def is_prime(num):
    if num > 1:
        n = round(num / 2) + 1
        for i in range(2,n):
            if(num % i == 0):
                return False
        return True
    return False


def get_prime(num):
    i = 1
    prime = 1
    while i <= num:
        prime += 1
        if is_prime(prime):
            print(prime)
            i+=1

    return prime


print("The 10001st prime number is: " + str(get_prime(10001)))