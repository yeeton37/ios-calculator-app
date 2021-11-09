# 계산기 프로젝트

## 목차 
- [Step 1](#step-1)
  - [UML](#uml) 
  - [고민된 점 및 해결 방법](#고민된-점-및-해결-방법)

## Step 1 

구현 기간: 2021.11.08 ~ 09



### UML
![Calculator_Model_UML_1](https://user-images.githubusercontent.com/45652743/140879022-2b667e5b-7d49-49dd-8f1a-951211ea8223.png)

### 고민된 점 및 해결 방법

> 1. 타입 명시에 관한 부분 

`LinkedList`나 `CalculatorItemQueue`를 구현할 때에 특정한 타입을 선택해서 적어줘야 할까에 대한 고민을 해봤습니다. 현재는 계산기 프로젝트이기 때문에 유효한 타입으로는 `Double`(or `Float`)이나 `String`정도가 들어올 수 있다고 생각했습니다. 이에 특정한 타입을 정해두고 `LinkedList`나 `CalculatorItemQueue`를 구현하는 것이 아니라 generics를 활용하여 확장성있는 타입을 구현하였습니다. 또한 generics 사용시 `T`가 아닌 더 명확한 의미를 주고자 `Element`라는 키워드를 활용하였습니다


> 2. `Array` vs `LinkedList`

Queue를 구현하기 위해 어떠한 자료구조를 써야할지 고민을 해봤습니다. Array를 기반으로 queue를 구현한다면 별도의 추가 코드 없이 구현할 수 있겠지만, LinkedList의 이점이 명확하게 드러나는 것 같아 LinkedList 자료구조를 선택했습니다. 

|자료 구조|Array|LinkedList|
|---|---|---|
|장점|1. 인덱싱(검색)이 빠르다(`O(1)`)|1. 데이터 추가 및 삭제가 빠르다 <br> 2. 데이터 추가/삭제시 메모리 재배치가 필요없기에 오버헤드가 낮다  |
|단점|1. 메모리의 위치가 연속적이고 고정적이기에 오버헤드가 높다 <br> 2. 데이터 추가/삭제가 느리다 |1. 인덱싱(검색)이 느리다(`O(n)`) |

계산기 프로젝트에서는 값의 검색보다는 추가/삭제가 더 빈번하게 발생할 것이라 생각하여 `LinkedList` 타입을 선택하였고 그 중에서 `계산은 우선순위 없이 순서대로 된다`라는 부분에 착안하여 `Singly Linked List`를 구현한 후 이를 활용하여 Queue를 구현했습니다. 

> 3. TDD에 대하여 

TDD 기반으로 프로젝트를 진행해보고자 테스트 코드를 우선적으로 작성하였습니다. 테스트 코드를 짤 때 미세하게 놓친 부분들이 실제 프로덕션 코드를 구현할 때 생각이 나기도 했고 이를 수정해가며 테스트를 통과할 수 있는 코드를 작성해봤습니다. 테스트 실행 이후 code coverage를 살펴보며 커버되지 않는 부분이 있는지 스스로 피드백하며 테스트를 진행해봤습니다. 
