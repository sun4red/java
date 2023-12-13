# 과제.   다음과 같은 정보가 있는 리스트에서 나이(age)를 기준으로 오름차순으로 정렬하는
#         프로그램을  작성 하세요?

people = [
    {'name': 'noah', 'age': 19},
    {'name': 'liam', 'age': 23},
    {'name': 'jacob', 'age': 9},
    {'name': 'mason', 'age': 21}
]

# 방법1.
people.sort(key=lambda x: x['age'])
print(people)

# 방법2.
result = sorted(people, key=lambda x: x['age'])
print(result)