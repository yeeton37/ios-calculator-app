# 계산기 I 프로젝트 저장소

> 프로젝트 기간 2022.03.14 ~ 2022.03.25 </br>
팀원 : [@Lingo](https://github.com/llingo) [@mmim](https://github.com/JoSH0318) / 리뷰어 : 👑 [@엘림](https://github.com/lina0322)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [STEP 1](#step-1)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [그라운드 룰](#그라운드-룰)
    + [스크럼](#스크럼)
    + [코딩 컨벤션](#코딩-컨벤션) 

---

## UML
![계산기 II](https://user-images.githubusercontent.com/94151993/160551272-085dad6c-3a19-46d9-b5f0-6e16d57367fd.png)

---

## [STEP 1]
### 고민 및 해결한 점
1️⃣ 커밋 단위를 어떻게 할 것 인가

계산기 I의 STEP1~3의 순서에 따라 변경사항이 없으면 파일을 기준으로 커밋을 하였고 변경사항이 있다면 기능을 기준으로 커밋을 진행했습니다.

- 계산기 I의 STEP1 ~ 3까지 순서
- 변경사항이 없으면 파일 기준
- 변경사항이 생기면 기능 기준

2️⃣ 합치는 기준은 무엇으로 둘 것인가

본격적으로 코드를 합치는 과정에 앞서 서로의 코드를 설명하고 충분히 이해하는 시간을 가졌습니다.
그리고 몇가지 기준을 세우고, 그 기준에 맞춰 코드를 합쳤습니다.

1. 팀원이 완벽히 이해하고 있는 코드를 사용한다. 
(이해하지 못하면 쓰지 않고 꼭 서야한다면 이해할 때까지 설명해야한다.)
2. 코드의 로직이 꼬이지 않는 선에서 합한다.
3. 요구사항에 어긋나거나, 부족한 점을 서로의 코드에서 채워나간다.
 
3️⃣ 합치는 과정에서 생긴 오류
1. 서로가 이해했던 요구사항이 달랐기 때문에 요구사항 정의에서 합의가 필요했습니다.
2. 각자가 설계한 프로젝트 구조와 데이터를 처리하는 로직의 설계가 달라 로직의 흐름을 변경하게되면 사이드이펙트가 발생하는 문제가 있었습니다.

> 따라서, 최대한 팀원의 로직의 흐름을 끊지 않는 선에서 부족한 요구사항을 보완했습니다.

4️⃣ bind 메서드 로직 변경한 점
1. ❓`1234.0`값을 입력하면 현재 입력값을 나타내는 Label에는 `1,234.0` 표시되어야 합니다. 하지만 `1234`를 나오는 오류가 있었고, 이를 해결하기 위해 변경해야 했습니다.
2. 해당 오류는 `1234.0`가 formtter를 거치며 생기는 오류로 판단했습니다.
3. ❗️`.`을 기준으로 두 개 요소로 배열에 담고, 정수만 formatter를 거치게하고 소수점 이후는 거치지 않는 형태로 Label에 할당하도록 했습니다.
4. 입력하는 경우와 계산하는 경우에서 `.`을 처리하는 방식이 달라져야하므로 계산하는 경우에는 한번도 formatter를 거치도록 변경했습니다.
5. ❓ViewModel의 OperandValue 프로퍼티의 값이 바뀌면 ViewController의 Label에 새로운 값을 할당하는 클로저가 길어지는 문제가 생겼습니다.
6. ❗️데이터를 Label에 들어갈 값으로 변경하는 로직을 메서드로 기능을 분리하는 방법으로 해결했습니다.

---

## [STEP 2]
### 고민 및 해결한 점

1️⃣ 코드를 합치는 과정에서 서로간의 코드가 충돌이 나는 경우도 있었지만, 수월하게 합쳐지는 경우도 많았습니다. 이것을 통해 다시 한번 객체지향 프로그램의 중요성을 깨달았습니다. 객체가 다른 객체를 의존하지 않고 역할과 책임을 다했기 때문에 합치는 과정에서 충돌이 없었다고 생각합니다! 

> 얼마나 객체끼리 의존하지 않고 있고, 객체가 역할과 책임에 충실하고 있는지를 파악해볼 수 있었습니다. 
역시 야곰의 큰그림 👍 👑

2️⃣ UML의 중요성

계산기 I 프로젝트의 STEP 2에서 주어진 UML을 각자 구현했었습니다. 계산기 II에서 팀원과 코드를 합칠 때 충돌이 적게나는 것을 느꼈고 이를 통해 **UML 설계의 중요성**을 깨달을 수 있었습니다.

3️⃣ 사전에 합의된 패턴의 중요성

`mmim`은 MVC패턴을 적용했고 `lingo`는 테스트를 위해 MVVM, 옵저버 패턴을 적용했습니다. 코드를 합치는 과정에서 서로 다른 패턴으로 구현되어있었고 그 과정에서 구조상의 충돌이 있었습니다. 
따라서, 설계하기전에 사전 합의된 패턴 사용의 중요성을 깨달을 수 있었습니다. 😅


### 궁금한 점

```swift
func addOperator(of operatorString: String) -> Bool {
    guard self.operandValue.value != "nan",
          self.operandValue.value != "0" || self.operatorType.value != nil
    else {
      return false
    }
    self.isResult = false
    if self.operandValue.value == "0" && self.operatorType.value != nil {
      self.operatorType.next(operatorString)
      return false
    }
    if let operatorType = self.operatorType.value {
      self.formulas.append(operatorType)
    }
    self.formulas.append(self.operandValue.value)
    self.operatorType.next(operatorString)
    self.operandValue.next("0")
    return true
}
```

저희 코드에서 대표적으로 guard문과 if문이 많은 메서드 중 하나입니다. 많은 조건들을 제어하기 위한 어쩔수 없는 선택이었다고 생각합니다. `early exit`의 같은 경우는 guard문을 사용하고 맨 위로, 나머지 조건들은 if문으로 아래쪽에 배치했습니다. 궁금한 점은 이런 경우 더 좋은 방법이 있을까요? 조언을 얻고 싶습니다.😭🙏

---

## 그라운드 룰
🪧 Lingo, mmim 팀 그라운드 룰

### 스크럼
스크럼은 딱딱한 분위기보단 자유롭고 부드러운 분위기로 😋
매일 아침 10시, 디스코드에서 진행
어제의 활동 리뷰
오늘 활동 예정 사항 / 목표
자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
컨디션 공유 😰
공유하고 싶은 이슈, 꿀팁 공유
스크럼 진행시간은 최대 30분을 넘기지 않기 ⏱
상황에 따라 조정 가능

#### 세션 있는 날
데일리 스크럼 + 18시 30분 ~ 진행

#### 세션 없는 날
데일리 스크럼 + 13시 ~ 진행

---

### 코딩 컨벤션
#### Swift 코드 스타일
코드 스타일은 [스타일쉐어 가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88) 에 따라 진행한다.

### Commit 규칙
커밋 제목은 최대 50자 입력
본문은 한 줄 최대 72자 입력

### Commit 제목 규칙
```
[chore] : 코드 수정, 내부 파일 수정
[feat] : 새로운 기능 구현
[style] : 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
[add] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
[fix] : 버그, 오류 해결
[del] : 쓸모없는 코드 삭제
[docs] : README나 WIKI 등의 문서 개정
[mod] : storyboard 파일,UI 수정한 경우
[correct] : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
[move] : 프로젝트 내 파일이나 코드의 이동
[rename] : 파일 이름 변경이 있을 때 사용합니다.
[improve] : 향상이 있을 때 사용합니다.
[refactor] : 전면 수정이 있을 때 사용합니다
[merge]: 다른브렌치를 merge 할 때 사용합니다.
```

### Commit Body 규칙
제목 끝에 마침표(.) 금지
한글로 작성

### 브랜치 이름 규칙
`II-STEP1`, `II-STEP2`, `II-STEP3`


