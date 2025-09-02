## `LangChain의 **메모리(Memory)**와 **출력 파서(OutputParser)**를 활용하여 대화형 AI를 구축`

### 1. 메모리 (Memory)

LLM은 기본적으로 대화 내용을 기억하지 못하는 **`stateless`** 상태입니다. 따라서 대화의 맥락을 유지하려면 이전 대화 내용을 프롬프트에 지속적으로 주입해야 합니다.

* **`ConversationBufferMemory`**: 대화 내용을 그대로 저장하고 필요할 때 불러와 LLM에 전달하는 가장 기본적인 메모리 방식입니다.
* **`RunnablePassthrough.assign`**: `Runnable` 체인 내에서 특정 변수(예: `chat_history`)에 메모리 내용을 할당하는 데 사용됩니다.
* **`RunnableLambda`와 `itemgetter`**: 메모리 객체의 `load_memory_variables` 메서드를 호출하여 저장된 대화 기록을 가져오고, `itemgetter`로 그중 `chat_history` 키에 해당하는 값만 추출합니다.

---

### 2. 출력 파서 (OutputParser)

출력 파서는 LLM의 자유로운 형식의 텍스트 출력을 **구조화되고 일관된 데이터**로 변환하는 역할을 합니다. 이를 통해 LLM의 답변을 리스트, 사전, Pydantic 모델 등 다양한 형식으로 변환하여 후속 작업에 활용할 수 있습니다.

* **`PydanticOutputParser`**: Pydantic 모델을 사용해 LLM의 출력을 특정 스키마(형식)를 가진 객체로 변환합니다. 이메일 내용을 제목, 요약, 발신자 등으로 구조화하는 데 유용합니다.
* **`CommaSeparatedListOutputParser`**: LLM의 출력을 쉼표로 구분된 문자열 리스트로 변환합니다.
* **`StructuredOutputParser`**: LLM의 출력을 사전(dictionary) 형식으로 변환합니다.
* **`EnumOutputParser`**: LLM의 답변을 사전에 정의된 열거형(Enum) 값 중 하나로 제한합니다.

### 3. Runnable 체인 (`Runnable` Chain)

`Runnable`은 `invoke`, `batch`, `stream`과 같은 표준 인터페이스를 따르는 모든 LangChain 구성 요소입니다. `LCEL`의 파이프(`|`) 연산자를 사용하여 여러 `Runnable`을 연결하면 복잡한 작업을 효율적으로 수행하는 **체인**을 만들 수 있습니다. `prompt | llm | parser`와 같은 체인은 사용자 입력을 받아서(프롬프트), 답변을 생성하고(LLM), 최종적으로 출력 형식을 변환하는(파서) 과정을 순차적으로 처리합니다.

### 4. Memoryd의 구동방식 
1. 메모리는 기본적으로 모든 대화 내역을 LLM Input에 밀어넣는 것
2. 대화가 길어지면 토큰 수가 증가하고, 성능하락이 일어난다. 
3. 개선 방식 컨셉
    1. 요약(대화 엔티티 메모리)
    2. 적정 길이에서 앞부분 자르기 (대화 버퍼 윈도우 메모리)
    3. 정리(특정 명사들로 정리, Node-Edge 그래프 방식 등) 

    좋은 요청이에요 🙆 제가 LangChain에서 자주 쓰이는 대화 메모리(memory) 5종류를 간단하게 정리해드리고, 마지막에 토큰 개념까지 설명드릴게요.

⸻

1. 대화 버퍼 메모리 (ConversationBufferMemory)
	•	모든 대화를 그대로 누적해서 저장.
	•	잘리지 않고 처음부터 끝까지 대화 기록이 남음.
	•	장점: 전체 맥락 유지가 확실함.
	•	단점: 대화가 길어질수록 토큰 사용량이 많아짐 → 비용 & 속도 문제 발생.

⸻

2. 대화 버퍼 윈도우 메모리 (ConversationBufferWindowMemory)
	•	최근 n번의 대화만 저장.
	•	“윈도우”처럼 마지막 몇 개 대화만 맥락으로 남김.
	•	장점: 토큰 절약 가능.
	•	단점: 이전 대화 맥락이 사라져서 긴 맥락 유지가 어렵다.

⸻

3. 대화 토큰 버퍼 메모리 (ConversationTokenBufferMemory)
	•	전체 대화를 저장하되, 토큰 수(max_token_limit) 기준으로 초과되면 앞부분부터 잘라냄.
	•	장점: 최근 맥락을 최대한 많이 보존하면서도 토큰을 제어할 수 있음.
	•	단점: 앞부분이 잘려나가므로 아주 긴 대화 맥락은 잃어버릴 수 있음.

⸻

4. 대화 엔티티 메모리 (ConversationEntityMemory)
	•	대화 중에 등장하는 엔티티(사람, 장소, 사물, 개념 등) 를 추출해서 저장.
	•	예:
	•	“내 이름은 유진이야” → 엔티티: 유진 = 사람
	•	“나는 서울에 살아” → 엔티티: 서울 = 장소
	•	장점: 중요한 개체 중심으로 기억하므로 장기간 대화에서 유용.
	•	단점: 엔티티만 기억하기 때문에 맥락 전체는 부족할 수 있음.

⸻

5. 대화 요약 메모리 (ConversationSummaryMemory)
	•	이전 대화를 LLM으로 요약해서 저장.
	•	장점: 긴 대화도 요약본으로 관리할 수 있어 효율적.
	•	단점: 요약 과정에서 중요한 맥락이 왜곡되거나 빠질 수 있음.

⸻

토큰(Token)이란?
	•	LLM이 문장을 처리할 때 쓰는 최소 단위.
	•	자연어를 그대로 쓰지 않고 단어/어절/부분 단어 단위로 쪼개어 처리함.
	•	예시 (OpenAI 기준 BPE 토크나이저):
	•	"안녕하세요" → 토큰 1개
	•	"Hello world" → "Hello"(1개) + " world"(1개) → 총 2개
	•	"데이터 분석가" → "데이터" + " 분석가" → 2개
	•	모델이 한 번에 볼 수 있는 맥락(Context length)은 토큰 단위로 제한됨.

⸻

📌 정리하면:
	•	BufferMemory = 전부 기억
	•	BufferWindowMemory = 최근 n개만 기억
	•	TokenBufferMemory = 토큰 수 기준으로 앞부분 잘라내며 기억
	•	EntityMemory = 중요한 개체(사람, 장소 등)만 기억
	•	SummaryMemory = 요약해서 기억

⸻

