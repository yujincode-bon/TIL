## 주식 차트 시각화, KPI 분석 
## KPI 
### RFM 분석 
고객을 3가지 측면에서 바라보는 프리즘 
- Recency: 얼마나 최근에 구매 했는가?(최근성) 활성도 측정 으로 , 낮을수록 좋음 
- Frequency: 얼마나 자주 구매했는가? (반복성)
- Monetary: 얼마나 많이 구매하는가? (가치)
<용어>
CAC(고객 획득 비용) LTV/CLV(고객 생애 가치), NPS(순고객 추천지수)-> 고객이 자사의 제품이나 서비스를 다른 사람에게 추천할 의향이 있는지를 측정하는 지표
- 고객생애가치 = 평균 주문가치 * (연간 구매빈도) * (고객 생존 기간)
해석


### 코호트분석 
- 같은 시점에 유사한 행동을 보인 사용자 집단을 추적해서 시간이 지나면서 이들의 행동이 어떻게 변하는지 분석하는 방법
<헷갈렸던 코드>

1. pd.to_datetime(): 파이썬 내장함수가 아닌 판다스의 함수를 사용함 

2. reset_index()는 **Pandas DataFrame의 인덱스를 초기화(재설정)**하는 함수임.
기존 인덱스를 일반 컬럼으로 옮기고, 0부터 시작하는 정수 인덱스를 새로 부여합니다.
```python 
import pandas as pd

data = {'이름': ['유진', '철수'], '점수': [85, 90]}
df = pd.DataFrame(data)
df.set_index('이름', inplace=True)

print(df)
#       점수
# 이름
# 유진   85
# 철수   90

df_reset = df.reset_index()

print(df_reset)
#    이름  점수
# 0  유진   85
# 1  철수   90


"""
언제 사용될까?

1. 그룹화나 피벗 후 인덱스 정리하고 싶을 때 
2. 인덱스를 컬럼으로 만들고 싶을때 
3. 데이터 재정렬 후 인덱스 초기화할 때 
"""
```
3.  rfm['r_score'] = pd.qcut(rfm['recency'], 5, labels=[5, 4, 3, 2, 1])
    rfm['f_score'] = pd.qcut(rfm['frequency'].rank(method='first'), 5, labels=[1, 2, 3, 4, 5])
    rfm['m_score'] = pd.qcut(rfm['monetary'], 5, labels=[1, 2, 3, 4, 5])
--> 여기서 recency 는 최근 구매일로서 작은 수 일수록 좋지만, 여기서 r_score는 **rfm이라는 DataFrame에 새로 만드는 “컬럼 이름”** 이며,
* pd.qcut을 사용해서>
	•	데이터를 분위수 기준으로 나눔
	•	여기서는 recency 값을 5분위로 나누고,
	•	가장 최근(값이 작을수록 좋음) 고객에게 높은 점수(5점)를 부여하는 방식입니다.
* 5개의 구간에 점수를 부여한 값이므로!!

"r_score 값은 클수록 좋음"

```python 
# 고객 세그먼트 정의
def segment_customers(rfm_data: pd.DataFrame):
    """
    RFM 점수를 기반으로 고객을 의미있는 세그먼트로 분류
    - R >= 4, F >= 4: 최고
    - R >= 3, F >= 3: 충성
    - R >= 4, F <= 2: 신규
    - R <= 2, F >= 3: 위험
    - R <= 2, F <= 2: 이탈
    - 기타
    """
    def rfm_level(df):
        if (df['r_score'] >= 4) and (df['f_score'] >= 4):
            return '최고'
        elif (df['r_score'] >= 3) and (df['f_score'] >= 3):
            return '충성'
        elif (df['r_score'] >= 4) and (df['f_score'] <= 2):
            return '신규'
        elif (df['r_score'] <= 2) and (df['f_score'] >= 3):
            return '위험'
        elif (df['r_score'] <= 2) and (df['f_score'] <= 2):
            return '이탈'
        else:
            return '기타'
    
    rfm_data['segment'] = rfm_data.apply(rfm_level, axis=1)
    return rfm_data

rfm_segmented = segment_customers(rfm_data)
rfm_segmented
```
4. unique()
```python
rfm_data['segment'] = rfm_data.apply(rfm_level, axis=1)
    return rfm_data
```
고객 등급 분류(RFM segmentation) 를 위해
각 행(row) 에 대해 rfm_level() 이라는 함수를 적용하여,
그 결과를 'segment'라는 새로운 컬럼에 저장하는 작업으로 '헹' 을 기준으로 함수를 적용한다. 