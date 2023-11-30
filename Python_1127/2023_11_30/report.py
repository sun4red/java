n1 = int(input("정수 1: "))
n2 = int(input("정수 2: "))
n3 = int(input("정수 3: "))

max = n1
min = n1

if n2 > max:
    max = n2

elif n2 < min:
    min = n2

if n3 > max:
    max = n3

elif n3 < min:
    min = n3

print("최대값:", max)
print("최소값:", min)
