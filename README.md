
![babysbreath_detail](https://github.com/user-attachments/assets/9f1b8e1e-73c1-4067-b591-d0db3fb503de)
![Screenshot 2025-08-24 at 17 30 21](https://github.com/user-attachments/assets/9806a0a3-8eec-46a1-be65-47bafa622215)

<h1 align="center">📚 마이리움 팀 프로젝트</h1>
<p align="center">Spring MVC 기반 3인 협작 클론 사이트 프로젝트입니다.</p>
<br/>

</details>

## 📌 목차

- [개요](https://github.com/notuna87/myriumTeamproject#-개요)
- [기술 스택](https://github.com/notuna87/myriumTeamproject#-기술-스택)
- [프로젝트 설계](https://github.com/notuna87/myriumTeamproject#-프로젝트-설계)
- [실행 화면](https://github.com/notuna87/myriumTeamproject#-실행-화면)
- [PPT](https://github.com/notuna87/myriumTeamproject#-PPT)
- [개선사항](https://github.com/notuna87/myriumTeamproject#-개선사항)


## 📖 개요

  * **프로젝트 목표 : Spring MVC 기반으로 마이리움 클론 사이트를 제작하여, 실제 전자상거래 환경에서 상품 조회, 장바구니, 주문 등의 기능을 구현**

  * **개발 기간**
    * 1단계 (07.16 ~ 07.17, 2일) : 요구사항 분석, 화면 흐름 및 데이터 정의<br/>
    * 2단계 (07.18 ~ 07.19, 2일) : DB 설계, ERD 및 아키텍처 기획<br/>
    * 3단계 (07.21 ~ 08.15, 20일) : 기능 구현, 화면 개발, 보안 및 테스트<br/>
    * 4단계 (08.12 ~ 08.14, 3일) : 최종 점검, 스모크 테스트, 배포<br/>
    
## 🛠️ 기술 스택
- Language : `JAVA(11)`, `JavaScript(1.5)`
- Framework / Library: `JSP(JavaServer Pages)(2.3)`, `JSTL`, `JDBC`,`DBManager`,`EL`,`jQuery`,`Lombok`
- Database : `Oracle 11g XE (11.2.0.2.0)`
- Server : `Apache Tomcat(9.0.70)`
- Tool : `Spring Tool Suite 3`
- API : `Daum postCode API`
- ETC : `Git`, `google Sheets`, `draw.io`, `erdCloud`, `sourcetree`

## 🧩 프로젝트 설계
<h3>🖥️Usecase Diagram</h3>
<img alt="481296084-728d4a85-0932-4a82-9524-97cdfa095230" src="https://github.com/user-attachments/assets/716f55e6-3f78-49a4-a3d9-e2c08a8ed390" />

<h3>🖥️ERD</h3>
<img alt="Myrium erd" src="https://github.com/user-attachments/assets/888cae06-4c6a-4435-bd6c-eeda52ab09a2" />
  
<details><summary><h3 align="center">🖱️클릭 : Class Diagram (26장)</h3></summary>
<h4>UploadController</h4>
<img width="2200" height="1347" alt="Diagram_UploadController" src="https://github.com/user-attachments/assets/95f413e3-6508-44ee-bc83-0cdf7372487c" />
<h4>TotalReviewController<h4>
<img width="1271" height="724" alt="Diagram_TotalReviewController" src="https://github.com/user-attachments/assets/dbb13257-40bb-40d2-9867-9bc67c14041d" />
<h4>SubController</h4>
<img width="2234" height="1259" alt="Diagram_SubController" src="https://github.com/user-attachments/assets/63e078eb-4fbd-488d-b62b-bbbadb3b3a0e" />
<h4>SearchController</h4>
<img width="1602" height="1185" alt="Diagram_SearchController" src="https://github.com/user-attachments/assets/c6a32127-e257-4edb-be40-6096fcae2cc1" />
<h4>ReviewController</h4>
<img width="2082" height="2085" alt="Diagram_ReviewController" src="https://github.com/user-attachments/assets/72f3a7c4-f4ed-4ef5-9ad1-434e8f8edfd0" />
<h4>ReplyController</h4>
<img width="1509" height="916" alt="Diagram_ReplyController" src="https://github.com/user-attachments/assets/4785b72d-5ece-4531-8113-1b72af856008" />
<h4>PurchaseController</h4>
<img width="2314" height="2085" alt="Diagram_PurchaseController" src="https://github.com/user-attachments/assets/b667aba8-2544-4419-beee-f87191dc0e91" />
<h4>OrderdetailController</h4>
<img width="1209" height="1138" alt="Diagram_OrderdetailController" src="https://github.com/user-attachments/assets/23629644-65fd-427a-ba63-0d745d10b7f2" />
<h4>MypageController</h4>
<img width="1170" height="1208" alt="Diagram_MypageController" src="https://github.com/user-attachments/assets/b71c2c5b-5a30-4c6f-8943-7c2189cd4a99" />
<h4>MemberupdateController</h4>
<img width="1475" height="1119" alt="Diagram_MemberupdateController" src="https://github.com/user-attachments/assets/c41d3ba2-3da9-4512-ba2e-96fe92999f52" />
<h4>MemberRestController</h4>
<img width="1281" height="1069" alt="Diagram_MemberRestController" src="https://github.com/user-attachments/assets/6e85674c-c6fa-415b-b4f8-c66b8209d104" />
<h4>MemberController</h4>
<img width="1932" height="747" alt="Diagram_MemberController" src="https://github.com/user-attachments/assets/a7885bfd-8a0a-465d-850c-6c44a521e04e" />
<h4>JoinController</h4>
<img width="1410" height="851" alt="Diagram_JoinController" src="https://github.com/user-attachments/assets/354d0199-7771-4a95-b8bb-a7cfa15d1484" />
<h4>HomeController</h4>
<img width="1614" height="1330" alt="Diagram_HomeController" src="https://github.com/user-attachments/assets/537ff07b-6190-41de-a97a-6acec7f8c7c4" />
<h4>FindpwController</h4>
<img width="1380" height="927" alt="Diagram_FindpwController" src="https://github.com/user-attachments/assets/2c90fa72-2c4b-4850-a593-5b173c09bc97" />
<h4>FindidController</h4>
<img width="1463" height="1016" alt="Diagram_FindidController" src="https://github.com/user-attachments/assets/d10db07d-b6d8-445e-9751-ff04e4a69b23" />
<h4>EtcController</h4>
<img width="1156" height="576" alt="Diagram_EtcController" src="https://github.com/user-attachments/assets/0b5ba722-2752-456a-a183-6dac795fd5c6" />
<h4>CategoryPageController</h4>
<img width="1675" height="1191" alt="Diagram_CategoryPageController" src="https://github.com/user-attachments/assets/6e3c099b-3f25-4cdb-a017-7d8247bb85a2" />
<h4>CartController</h4>
<img width="1958" height="1352" alt="Diagram_CartController" src="https://github.com/user-attachments/assets/c6afbfb7-04d0-406c-a0e5-74f9bca70d57" />
<h4>AdminReviewController</h4>
<img width="1356" height="978" alt="Diagram_AdminReviewController" src="https://github.com/user-attachments/assets/e189804b-4f76-479c-8d75-3074f949c0c0" />
<h4>AdminProductController</h4>
<img width="1954" height="1348" alt="Diagram_AdminProductController" src="https://github.com/user-attachments/assets/c0eecd98-7b29-40da-9d70-9a2d2638dfb5" />
<h4>AdminOrderController</h4>
<img width="1367" height="951" alt="Diagram_AdminOrderController" src="https://github.com/user-attachments/assets/9d46a3aa-d5d5-47a7-b880-102180798df2" />
<h4>AdminNoticeController</h4>
<img width="1642" height="904" alt="Diagram_AdminNoticeController" src="https://github.com/user-attachments/assets/7f82b528-73ea-4612-afb5-d38c51c161df" />
<h4>AdminMemberController</h4>
<img width="1656" height="991" alt="Diagram_AdminMemberController" src="https://github.com/user-attachments/assets/ed83d685-bea2-42ce-b190-471321abd429" />
<h4>AdminFaqController</h4>
<img width="809" height="567" alt="Diagram_AdminFaqController" src="https://github.com/user-attachments/assets/c1c378c6-3086-4147-ab8e-f430d6b41a65" />
<h4>AdminBoardController</h4>
<img width="2361" height="1100" alt="Diagram_AdminBoardController" src="https://github.com/user-attachments/assets/7edb5e8d-b6d8-443f-9a1f-3b4263d580ee" />
</details>


## 🖥️ 실행 화면

<h3>⭐ 메인</h3>

   * **1. 메인**
      * 관리자가 정한 상품들을 메인화면에 선택하여 전시가 가능합니다.
      * 타임세일의 경우 슬라이더로 표시되며, 다른 전시화면에서 타임세일 여부를 표시해줍니다.
      * `상품더보기` 버튼을 클릭할시 상단 전시는 3개씩, 하단 전시는 4개씩 상품이 더 표시되며, 모두 표시되었을 경우 버튼이 사라집니다.
<p align="center"><img src="https://github.com/user-attachments/assets/4c16c37a-8589-4adb-9d23-31de15f801d2"></p>


<h3>⭐ 회원</h3>

  * **2.1. 회원가입**
    * 회원가입 페이지에서 신규 회원 정보를 입력하여 계정을 생성할 수 있습니다.
    * 기본정보(아이디, 비밀번호, 이름, 생년월일, 성별, 연락처, 이메일, 주소)를 입력합니다.
    * 주소 입력 시 **카카오 주소 API**를 연동하여 정확한 주소 검색이 가능합니다.
    * 비밀번호는 개인정보 보안을 위해 **암호화(Encryption)** 처리되어 DB에 저장됩니다.
    * 입력 정보에 대해 **유효성 검사**를 진행한 후 DB에 저장됩니다.
    * 약관 동의(필수/선택) 항목을 체크한 후에만 회원가입이 완료됩니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/8d7976ac-a774-4f95-808a-7b63e924ce88"></p>
    
  * **2.2. 로그인**
    * 로그인 페이지에서 아이디와 비밀번호를 입력하여 계정에 접속할 수 있습니다.
    * 입력된 비밀번호는 **암호화(Encryption)** 처리되어 DB의 저장값과 검증됩니다.
    * 로그인 성공 시 세션(Session)이 생성되어 사용자 인증 상태가 유지됩니다.
    * 로그인한 사용자의 이름이 상단 배너에 표시되며, 로그아웃 버튼으로 전환됩니다.
    * 로그인 실패 시 오류 메시지를 출력하여 사용자에게 알림을 제공합니다.
    * 세션 만료 또는 로그아웃 시 자동으로 인증이 해제되고 메인 페이지로 이동합니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/f5a3f46e-98c2-429a-abaf-ffc6009af5ed"></p>

  * **2.3. 아이디,비밀번호 찾기**
    * 사용자가 이름과 이메일 또는 휴대폰 번호를 입력하여 등록된 아이디를 조회할 수 있습니다.
    * 입력된 정보가 DB와 일치하는 경우 해당 아이디를 즉시 화면에 출력합니다.
    * 일치하는 정보가 없을 경우 오류 메시지를 제공하여 재입력을 안내합니다.
    * 입력값에 대한 **유효성 검사**를 수행하여 잘못된 값 입력을 방지합니다.
    * 이메일 또는 휴대폰 번호 인증을 통해 비밀번호를 찾을 수 있습니다.
    * 입력된 정보가 DB와 일치하는 경우 결과 페이지로 **분기 처리**됩니다.
    * 임시 비밀번호를 영문·숫자 조합으로 생성하여 사용자에게 발급합니다.
    * 발급된 임시 비밀번호는 로그인 후 **비밀번호 변경**을 통해 수정하도록 안내합니다.
    * 입력 정보가 불일치할 경우 오류 메시지를 제공하여 재시도를 유도합니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/fa2a294b-6a58-45ba-b5d8-7ad315e2921a"></p>

<h3>⭐ 상품 상세</h3>
  
   * **3-1. 상품 이미지**
      * 작은 슬라이더를 통하여 원하는 이미지를 찾고 선택할 수 있습니다.
      * 선택된 이미지는 큰 슬라이더에 표시됩니다.
      * 큰 슬라이더의 화살표 버튼으로 1장씩 넘기며 볼 수 있습니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/c23e93c7-6356-4a02-bc3e-190ff8820d33"></p>
   * **3-2. 수량조절, 장바구니, 구매하기 버튼**
      * `-버튼` 과 `+버튼`을 클릭하여 수량을 조절할 수 있습니다.
      * 수량을 조절할때 자동으로 가격이 계산되어 총 금액에 반영됩니다.
      * 재고 이상의 상품을 구매하려 할 시 재고부족 알람창이 출력됩니다.
      * `장바구니`버튼을 클릭시 선택한 수량만큼 장바구니에 등록됩니다.
      * 재고를 초과하여 장바구니에 등록할 경우, 재고수로 초기화 시켜 재고수를 초과하지 않게 됩니다.
      * `구매하기`버튼을 클릭시 선택한 수량만 즉시 구매가 가능하며, 장바구니에 담긴 상품은 포함되지 않습니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/b00c1890-877c-4518-8a7e-8bf869e54324"></p>
   * **3-3. 인기가 많은 상품**
      * 판매량으로 정렬하여 상위 10개의 상품만 하단 슬라이더로 표시됩니다.
      * 마우스 드래그를 통하여 좌우 슬라이드가 가능합니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/41c3effd-1d79-4b62-911f-dcbcee4ddf51"></p>
  * **3-4. 결제,배송,교환/반품 안내**
      * 리뷰 리스트를 표시해줍니다.
      * 페이징 기능을 통하여 1페이지당 3개의 리뷰를 화면에 보여줍니다.
      * `전체보기`버튼을 클릭 시 모든 리뷰 페이지로 이동, `작성하기`클릭 시 마이페이지로 이동하게 됩니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/92b123f6-9ab7-4e6e-b4ff-5a9ff5eb962c"></p>
  * **3-5. 리뷰 리스트**
      * 리뷰 리스트를 표시해줍니다.
      * 페이징 기능을 통하여 1페이지당 3개의 리뷰를 화면에 보여줍니다.
      * `전체보기`버튼을 클릭 시 모든 리뷰 페이지로 이동, `작성하기`클릭 시 마이페이지로 이동하게 됩니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/22e96523-0385-46f0-9e6c-9fb8e928faeb"></p>
  * **3-6. 문의 리스트**
      * 문의하기 리스트를 표시해줍니다.
      * `답변여부`를 통하여 한눈에 `답변대기`, `답변완료` 상태를 확인할 수 있습니다.
      * 게시글 제목을 클릭하여 해당 문의글을 조회할 수 있습니다.
      * `전체보기`버튼을 클릭 시 사이트 전체의 문의글을 확인할 수 있습니다.
      * `문의작성하기`버튼을 클릭하여 해당 상품에 관한 문의글을 작성할 수 있습니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/c160f196-48c3-46f0-9af1-5d750ea2b53a"></p>
</details>

<h3>⭐ 장바구니</h3>

   * **4. 장바구니**
      * 상품에서 `장바구니` 버튼을 통하여 장바구니에 상품을 담을 수 있습니다.
      * 원하는 상품만 선택하여 구매가 가능합니다.
      * 선택한 상품을 갯수에 따라 자동으로 계산하여 총 결제금액을 보여줍니다.
      * 상품의 총 금액이 `49,900원`을 초과하지 않는 경우 배송비 `3,000원`이 자동으로 추가됩니다.
      * `삭제하기`버튼을 클릭하여 장바구니에서 상품을 삭제할 수 있습니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/5c0537e3-869a-490b-8a46-e8379664a69a"></p>

<h3>⭐ 결제</h3>

   * **5.1 주문서 작성**
      * `장바구니`페이지의 `주문하기`와 `상품`페이지의 `구매하기`버튼을 통하여 주문서 작성이 가능합니다.
      * 회원 정보를 불러와 주문자를 확인합니다.
      * `다음 주소 api`를 통하여 주소를 자동으로 입력할 수 있습니다.
      * 핸드폰번호및 배송요청사항을 선택할 수 있습니다. 배송요청사항의 `직접입력`을 선택할 경우, 요청사항을 직접 입력할 수 있습니다.
      * 주문하려는 상품의 리스트와 가격을 볼 수 있습니다. 상품의 총 가격이 `49,900원`을 넘기지 않을 경우 배송비가 표시됩니다.
      * 리스트의 `삭제하기`버튼을 클릭 시 삭제할 수 있습니다. 삭제될시 장바구니에서도 같이 삭제됩니다.
      * 배송비가 있다면 배송비를 포함한 최종 결제 금액이 표시됩니다.
      * 결제 수단을 선택할 수 있습니다.
      * 제공방침 및 청약철회방침의 자세히 버튼을 클릭 시 팝업버튼을 통하여 약관을 확인할 수 있습니다.
      * 버튼을 통하여 최종결제금액이 한번더 고객에게 안내됩니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/e8691b27-0894-4d36-8352-747e14e26a1e"></p>
      
   * **5.2 결제완료**
      * 날짜와 주문 카운트를 통하여 시퀀스를 통하여 주문번호를 자동으로 생성하여 부여합니다.
      * 최종 결제금액을 한번더 표시해줍니다.
      * 결제수단을 표시합니다.
      * 주문할때 입력한 주소 및 배송요청 사항을 표시해줍니다.
      * 주문한 상품 리스트를 표시해줍니다.
      * 주문한 상품들의 총 금액과 배송비가 있을 경우 배송비를 표시하여, 최종결제금액을 안내해줍니다.
      * `주문확인하기`버튼 클릭 시 마이페이지로 이동합니다.
      * `쇼핑계속하기`버튼 클릭 시 메인으로 이동합니다.
      <p align="center"><img src="https://github.com/user-attachments/assets/3946a130-679a-4a50-8ed1-bb4d9bb1178c"></p>
<h3>⭐ 마이페이지</h3>
 
  * **6.1 주문내역**
    * 마이페이지 주문내역 화면에서 사용자의 **총 주문 금액**을 확인할 수 있습니다.
    * 주문 상태(입금전, 배송준비중, 배송중, 배송완료, 구매확정)에 따라 **주문처리현황을 건수별로 조회**할 수 있습니다.
    * 교환/환불/취소 처리된 내역은 제외되어 표시됩니다.
    * 배송완료/구매확정 상태에서는 **구매후기 작성 버튼**을 통해 상품리뷰 작성이 가능합니다.
    * 각 주문내역의 **상세내역 클릭 시 주문별 상세 주문 정보**를 확인할 수 있습니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/2c59c35f-c660-4647-baa0-5d5dbe7e7877"></p>

  * **6.2 개별 클레임 처리**
    * 사용자는 주문내역에서 원하는 상품만 선택하여 **개별적으로 교환·환불·취소(클레임) 처리**를 할 수 있습니다.
    * 하나의 주문 안에서도 특정 상품만 선택해 **부분 처리**가 가능하며, 나머지 상품은 기존 주문 상태를 유지합니다.
    * 개별 처리 후에는 해당 상품의 상태가 즉시 반영되어 주문내역 및 주문상세 페이지에서 확인할 수 있습니다.
    * 교환·환불·취소 내역은 각 탭(교환/환불/취소)에서 별도로 구분되어 조회됩니다.
    * 처리 완료된 상품은 주문처리현황 건수에서 제외되어 표시됩니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/56d1fefa-8407-42a7-82b5-5a28d8e8423c"></p>

  * **6.3 전체 클레임 처리**
    * 사용자는 주문내역에서 주문 건 전체를 선택하여 **한 번에 교환·환불·취소(클레임) 처리**를 할 수 있습니다.
    * 주문 내 모든 상품을 대상으로 처리되며, 개별 선택 없이 전체 단위로 진행됩니다.
    * 전체 처리 시 각 상품의 상태가 동시에 변경되어 주문내역과 주문상세 페이지에서 즉시 확인할 수 있습니다.
    * 교환·환불·취소 내역은 각 탭(교환/환불/취소)에서 별도로 구분되어 조회됩니다.
    * 처리 완료된 주문 건은 주문처리현황에서 제외되어 표시됩니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/3ba63aea-91c0-44e4-848a-fcc330a63a94"></p>

  * **6.4 상품리뷰 작성**
    * 사용자는 **로그인 상태**에서만 상품 리뷰를 작성할 수 있습니다.
    * 각 상품별로 리뷰를 등록할 수 있으며, 작성 시 **별점(평균 별점 자동 계산 및 표시)** 기능이 제공됩니다.
    * 상단의 리뷰 메뉴 클릭 시, 사용자가 작성한 모든 리뷰를 **한 화면에서 모아보기** 할 수 있으며 관리자가 확인할 수 있습니다.
    * 상품상세보기 클릭 시, 해당 상품 페이지에 작성된 리뷰만 **상세페이지 하단**에서 확인할 수 있습니다.
    * 리뷰 작성 시 **이미지 업로드**가 가능하여 포토리뷰 등록을 지원합니다.
    * 배송완료 또는 구매확정 상태에서만 리뷰 작성 버튼이 활성화되어, 실제 구매 상품에 대해서만 리뷰 작성이 가능합니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/4d97880b-a2cb-46cd-a56f-8b44752f76ab"></p>
    
 * **6.5 회원정보수정**
    * 사용자는 마이페이지에서 **기본정보(주소, 연락처, 이메일 등)** 를 수정할 수 있습니다.
    * 입력값에 대해 **유효성 검사**가 적용되어 잘못된 값 저장을 방지합니다.
    * 주소 입력 시 **카카오 주소 API**를 연동하여 정확한 주소 검색이 가능합니다.
    * 수정된 정보는 DB에 반영되며, 정보 변경 완료 후 보안을 위해 **자동 로그아웃** 처리됩니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/1c21f7d7-d455-49d1-93b0-63e586c1713f"></p>

  * **6.6 비밀번호 변경**
    * 로그인한 사용자의 **아이디 정보**가 화면에 표시됩니다.
    * 사용자는 마이페이지에서 기존 비밀번호를 입력하여 본인 확인 후 **새 비밀번호로 변경**할 수 있습니다.
    * 기존 비밀번호가 DB의 암호화 값과 일치하지 않을 경우, 오류 메시지를 출력하여 재입력을 안내합니다.
    * 새 비밀번호는 개인정보 보호를 위해 **암호화(Encryption)** 처리 후 DB에 저장됩니다.
    * 비밀번호 변경 성공 시 알림 메시지를 제공하며, 해당 화면이 **새로고침 처리**되어 반영됩니다.
    * 변경 실패 시 사용자에게 오류 메시지를 출력하여 재시도를 유도합니다.  
    <p align="center"><img src="https://github.com/user-attachments/assets/adb7fb03-c27d-495c-959e-19d8826a757c"></p>
    
<h3>⭐ 관리자페이지-대시보드</h3>

  * **7 관리자로그인**
    * 관리자 권한이 있는 회원이 로그인 시 `관리자페이지 대쉬보드`로 이동합니다.
<p align="center"><img src="https://github.com/user-attachments/assets/4d8a50c5-b7eb-4323-bdc1-7d02e6924ae1"></p>

<h3>⭐ 관리자페이지-상품관리</h3>

  * **8-1 상품등록, 이미지 업로드**
    * 상품목록 페이지에서 `등록`을 통해 새로운 상품을 등록할 수 있습니다.
    * 상품의 기본정보(카테고리, 전시영역, 상품명, 설명, 가격)와 할인정보, 재고량을 입력합니다.
    * 상품이미지(최대10개) 업로드 후 대표이미지 설정할 수 있으며 상품상세정보 이미지(최대2개)를 업로드 할 수 있습니다.
    * 입력 정보의 유효성 검사 후 DB에 저장됩니다.
<p align="center"><img src="https://github.com/user-attachments/assets/dbca452b-8ab4-47fb-adad-32781c025bf6"></p>


    
## 🗂️ PPT ---- ppt 사진 넣을곳

</br>

## 🚀 개선사항
</br>

