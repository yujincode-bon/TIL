# 파이썬 제어문 

## 조건문 
1. if문
- 조건은 TRUE/FALSE 로 평가됨

```
if num%2 == 1: #if  num % 2 1: 결과 똑같음.  
    print ("ODD")
else: 
    print("EVEN")

print(num)
```

2. 조건 표현식 
* 활용법 
조건에 따라 값 정할때
"삼항 연산자" 라고도 부름 

<구조>

true_value if <조건식> else sales_value 

## 반복문
1. while 반복문
*문법 while <조건식>:
            <코드블럭>

--연습--

```
total = 0 #다 더할 변수를 만들어야한다. 
#사용자 입력을 문자 -> 정수로 바꾼 후에 n에 저장 
#n= int(input()) # 당연히 입력창은 숫자만 쓸 수 있음 
n=10
#1부터 n까지 더한다== n부터 1까지 더한다. 
while n>0:
    total +=n
    n-=1
print(total)
```
2. FOR 문 
** 활용
for <임시변수>:박스 in <순회가능한 데이터>(컨베이어벨트로 운송되는 데이터들>):
            <코드블럭>
- 비유하자면, WHILE 문은 수동, FOR 문은 자동 

--연습--- 
```
rice = ['보리', '보리', '보리', '쌀', '보리']

# 아래에 코드를 작성하세요.
for grain in rice:
    print(grain)
    if grain == '쌀':
        print('잡았다!')
        break
```