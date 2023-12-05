jumin = str(input("주민번호: "))

if len(jumin) != 13:
    print("잘못된 주민번호")


elif jumin[6] == '1':
    print("남자")
elif jumin[6] == '2':
    print("여자")
