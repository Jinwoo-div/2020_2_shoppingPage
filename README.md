# 간단한 쇼핑페이지 만들기 
  ### 기능 설명
+ 사용기술
  * JS, CSS, HTML 사용하여 제작
  * JSP사용하여 로컬서버에서 동작
  * 로컬DB를 간단한 MyBatis사용하여 연결
 
 <img src="https://user-images.githubusercontent.com/66550739/111020975-c389e400-840c-11eb-940a-f32b07135493.png" width="350" height="200"></img>(전체적인 구성도)

1. 로그인 페이지

 <img src="https://user-images.githubusercontent.com/66550739/111024372-c7743100-8421-11eb-961f-51d689c6fadb.png" width="350" height="200"></img>

  * 아이디, 비밀번호 입력 후 확인 클릭 시 구성도 따라 해당 페이지로 이동
  * 존재하지 않는 계정 입력시 경고창 출력

2. 관리자 페이지

<img src="https://user-images.githubusercontent.com/66550739/111025762-9c8ddb00-8429-11eb-90c2-dd708fcceb07.png" width="350" height="200"></img>

  * 별도설정한 관리자계정으로 로그인 시 이동되는 페이지
  * 상품 추가/수정/삭제 가능

3. 회원가입 페이지

<img src="https://user-images.githubusercontent.com/66550739/111025840-3e152c80-842a-11eb-813f-4b48693a6439.png" width="350" height="200"></img>

  * 세 개의 항목들을 채우고 난 후 확인 버튼 클릭
  * 중복된 ID로 확인되면 경고창 출력
  * 정상적으로 가입되면 로그인 페이지로 이동

4. 사용자 페이지 1

<img src="https://user-images.githubusercontent.com/66550739/111025944-e0351480-842a-11eb-9fac-8b25c746a392.png" width="350" height="200"></img>

  * 상단 검색창을 통해 검색
  * 중앙의 광고창을 통해 광고가 3초간격으로 지나감
  * 좌측의 카테고리를 통해 카테고리별 상품 확인 가능

4. 사용자 페이지 2

<img src="https://user-images.githubusercontent.com/66550739/111026155-3e162c00-842c-11eb-809c-5029632bcdbb.png" width="350" height="200"></img>

  * 1번 페이지에서 검색 또는 카테고리 검색을 통해 접근
  * 상품들 목록 시현

