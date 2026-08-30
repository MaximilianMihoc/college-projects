def sum_squre(num):
    sum = 0
    for i in range(1, num+1):
        sum += i*i
    return sum


def square_sum(num):
    sum = 0
    for i in range(1, num + 1):
        sum += i
    return sum * sum


print(sum_squre(100))
print(square_sum(100))
print("Difference between the sum of the squares is: " + str(sum_squre(100) - square_sum(100)))