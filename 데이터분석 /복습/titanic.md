## Data Cleaning
   1. 마스킹 생성 
   - 마스킹이란? 특정 조건에 따라 데이터프레임이나 시리즈의 특정값들을 선택적으로 가리거나 변경하는 기법 
   <예시 코드>
   ```python 
    #나이가 25보다  큰 행 선택 (마스크 생성)
    mask = df['Age'] > 25
    print("마스크:\n", mask)
   ```
    2. 불필요한 데이터 삭제 
        * 특정 컬럼 삭제:
            df.drop()  
            ```python
            df.drop(['부가기호', 'Unnamed: 13'], axis=1) # 컬럼이 삭제된 새로운 DataFrame을 반환합니다.
            df.drop(['부가기호', 'Unnamed: 13', '주제분류번호'], axis=1, inplace=True) # 원본 DataFrame을 직접 수정합니다.
            ```
        - inplace= True: True로 설정하면 원본 DataFrame 을 직접 수정하고 새로운 DataFrame을 반환하지 않는다.
    3. 결측값(NAN값) 기준컬럼삭제  
            *dropna()메서드 활용 
            -how='any' (기본값): 컬럼(또는 행, axis=0인 경우)에 하나라도 NaN 값이 있으면 해당 컬럼(또는 행)을 삭제한다.

            - how='all': 컬럼(또는 행)의 모든 값이 NaN인 경우에만 해당 컬럼(또는 행)을 삭제한다.

          데이터 변환: 문자열 조작 핵심 요약
데이터 정제할 때 텍스트 데이터 표준화나 정보 추출 자주 함. Pandas Series는 강력한 .str 접근자 있어서 모든 요소에 문자열 메서드 적용 가능.

.str을 이용한 문자열 메서드 접근
Pandas Series가 문자열로 돼있다면, .str 속성으로 모든 파이썬 표준 문자열 메서드(예: upper(), len(), contains(), replace(), split(), extract() 등) 사용 가능함.

스크립트 예시
```python df['이메일'].str.upper(): 모든 이메일 주소 대문자로 바꿈.

df['이름'].str.len(): 각 이름 길이 계산.

df['이메일'].str.contains('gmail'): 각 이메일에 'gmail' 있는지 확인해서 True/False 반환.

df['전화번호'].str.replace('-', '').str.replace(' ', ''): 전화번호에서 하이픈이랑 공백 제거하려고 문자열 메서드 연결해서 씀.

df['이름'].str[:1]: 각 이름에서 첫 글자(예: 성) 추출. 파이썬 문자열 슬라이싱이랑 비슷함.

df['이메일'].str.extract(r'@([^.]+)): 정규표현식 써서 이메일 주소에서 도메인 이름(@ 뒤, 첫 마침표 . 앞 부분) 추출. 정규표현식은 문자열 패턴 찾기 강력한 도구.

df['취미'].str.split(','): 취미 문자열 쉼표 기준으로 분할해서, 각 요소가 취미 목록인 Series 만듦.

df['취미'].str.split(',').str[0]: 분할된 리스트에서 첫 번째 요소 뽑아서 첫 취미만 가져옴.
```

문자열 분할로 새 컬럼 만들기
가장 중요하게 강조한 부분임.

```Python

df[['사용자명', '도메인']] = df['이메일'].str.split('@', expand=True)
이 코드 엄청 유용함.

df['이메일'].str.split('@'): 각 이메일 문자열 '@' 기준으로 분할. expand=True 없으면, 결과는 각 요소가 리스트인 Series 됨.

expand=True: 이게 핵심. str.split()이랑 같이 expand=True 쓰면, 분할된 부분들이 자동으로 새로운 DataFrame의 별도 컬럼으로 확장됨.

df[['사용자명', '도메인']] 
```
= ...: 이렇게 만들어진 새 컬럼들을 원본 DataFrame df에 바로 할당해서 '사용자명'이랑 '도메인'이라는 별도 컬럼 생김. 구조화된 문자열을 새 특징으로 파싱하는 매우 흔하고 효율적인 방법임.