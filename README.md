
<img width="2731" height="1149" alt="Frame 16" src="https://github.com/user-attachments/assets/e475fd1c-89a1-40c8-a5bb-031ab8d4d7bd" />

### 목차
[1. 프로젝트 소개](#프로젝트-소개)  <br/>
[2. 개발 기간](#개발-기간)  <br/>
[3. 개발 목표](#개발-목표)  <br/>
[4. 아키텍처](#아키텍처)  <br/>
[5. 파일 구조](#파일구조)  <br/>
[6. 사용 기술 및 라이브러리](#사용-기술-및-라이브러리)  <br/>
[7. 기능 정리](#기능-정리)  <br/>
[8. 화면 리스트](#화면-리스트)  <br/>
[9. 팀원 소개](#팀원-소개)  <br/>


# 프로젝트 소개

> **“스스로 식단을 계획하고 관리할 수 있는 다이어트 파트너 담다잇!”**
>

최근 건강에 대한 관심이 급증하며 **다이어트 식품 시장이 빠르게 성장**하고 있지만, 소비자들은 오히려 수 많은 정보와 상품 속에서 **선택의 어려움**을 겪고 있습니다.

**담다잇**은 이러한 문제를 해결하기 위해, 신뢰할 수 있는 다이어트 식품을 한곳에 모아 판매하는 것을 넘어, 사용자가 **칼로리 계산기**를 통해 자신의 식단을 데이터에 기반하여 적극적으로 관리할 수 있는 **건강 식품 전문 쇼핑몰앱** 입니다.

  <br>

# 개발 기간

**2025.06.25 ~ 2025.07.18**

  <br>
  
# 개발 목표

- 안정적인 커머스 (가입부터 결제까지)
- 개인화된 활동 내역 관리 시스템 구축 (마이페이지를 통한 개인 데이터 관리)
- 신뢰도 구축 (투명한 리뷰) 및 추가 기능 (칼로리 계산기)

  <br>

# 아키텍처

<img width="1132" height="398" alt="image" src="https://github.com/user-attachments/assets/e51f7260-f416-4aa1-aa1f-e00e6f2102ff" />

  <br>

### 파일구조
```
🗂️lib/
│
├── 🗂️ core/               # 앱 전역 설정 (상수, utils, api client, 공통 위젯 등)
│   ├── 📁 constants/      # 앱 전역 상수
│   ├── 📁 utils/          # 앱 공통 함수
│   ├── 📁 network/        # Dio 같은 API Client
│   ├── 📁 secutr/         # 토근 저장 위한 SecureStorage
│   ├── 📁 widgets/        # 공통 위젯
│   └── 📁 theme/          # 색상, 폰트, 스타일
│
├── 🗂️ data/               # Model, Repository (데이터 계층)
│   ├── 📁 models/
│   │   ├── 📁 product/   
│   │   ├── 📁 review/
│   │   └── 📁 response/ 
│   │   │   ├── api_response    # 공통 response 틀
│   │   │   ├── product_list_response   # 개별 response
│   │   │   └── ...
│   │   └── ...
│   ├── 📁 repositories/
│   │   ├── 📄 product_repository.dart
│   │   ├── 📄 review_repository.dart    
│   │   └── ...
│   └── 📁 datasources/    
│       └── 📄 product_datasource   
│       └── ...
│      
│
├── 🗂️ presentation/       # View, ViewModel (UI 계층)
│   ├── 📁 screens/
│   │   ├── 📁 home/
│   │   │   ├── 📄 home_screen.dart
│   │   │   ├── 📄 home_viewmodel.dart (기존에 provider 이름 -> 화면_viewmodel)
│   │   │   ├── widgets/
│   │   │   │   ├── 📄 product_list_item.dart
│   │   │   │   └── ...
│   │   ├── 📁 review/
│   │   │   ├── 📄 review_screen.dart
│   │   │   ├── 📄 review_viewmodel.dart
│   │   │   └──📁 widgets/
│   │   │       ├── 📄 review_list_item.dart
│   │   │       └── ...
│   │   └── ...
│   └── 📁 routes/         # Route 관리
│
└── 📄 main.dart

```

  <br>

# 사용 기술 및 라이브러리

| 용도 | 이름 | 버전 |
| --- | --- | --- |
| 언어 | Dart | `3.8.1` |
| Framework | Flutter | `3.32.2` |
| IDE | Android Studio | `Meerkat 2024.3.1` |
| 데이터베이스 | MongoDB |  |
| 개발 툴 | MongoDB Compass |  |
| 협업 툴 | Figma, Notion, SourceTree, canva |  |

  <br>

| 이름 | 용도 | 버전 |
| --- | --- | --- |
| `provider` | 상태 관리  | `6.1.5` |
| `dio` | HTTP 통신 | `5.8.0` |
| `pretty_dio_logger` | HTTP 로그용 | `1.4.0` |
| `flutter_secure_storage` | 토큰 암호화 저장 | `9.2.4` |
| `image_picker` | 이미지 선택 | `1.1.2` |
| `kpostal` | 우편주소 검색 | `1.1.0` |
| `flutter_rating_bar` | 별점 레이팅 바 | `4.0.1` |
| `carousel_slider` | 홈 배너 자동 재생 | `5.1.1` |
| `intl` | 숫자 포맷 처리 | `0.18.0` |
| `animations` | 화면 전환 애니메이션 | `2.0.8` |
| `flutter_svg` | svg 이미지 파일 처리 | `2.2.0` |


  <br>

# 기능 정리
### 🙋‍♂️ 가입

- 회원 가입
- 로그인

### ➕ 칼로리 계산기

- 음식, 제조사 명 입력을 통한 영양 정보 검색
- 영양 상세 정보 다이얼로그
- 칼로리 계산
    - 검색된 음식들을 칼로리 계산 대상 리스트에 추가, 삭제
    - 칼로리 계산 리스트 항목에 따른 섭취 칼로리 계산

### 🛒 커머스

- 홈
    - 이벤트 배너
    - 카테고리 별 상품 보기
    - 신상품 순 상품 리스트
    - 조회순 상품 리스트
    - 판매순 상품 리스트
   <br>
- 상품 검색
    - 상품 명, 카테고리 별, 가격대 설정을 통한 상품 검색
    - 검색 결과
  <br>
- 상품 상세
    - 주문 수량 설정
    - 상세(영양)정보
    - 리뷰
        - 별점
        - 작성된 리뷰, 사진 보기
    - 찜
    - 장바구니
    - 바로구매
  <br>
- 장바구니
    - 상품 선택, 추가, 삭제
  <br>
- 주문
    - 배송지, 결제 수단 입력 후 주문
### 👤 마이페이지

- 찜한 상품
- 주문 목록
- 리뷰 입력
- 리뷰 목록 조회, 수정, 삭제
- 배송지 변경
- 닉네임 변경
- 비밀번호 변경
- 로그아웃

  <br>

# 화면 리스트

<img width="9414" height="6987" alt="Group 423" src="https://github.com/user-attachments/assets/89ee9406-d322-4aa7-9b7c-277a88f26b13" />


  <br>

# 팀원 소개
| 팀장 | 부팀장 | 최고의 팀원 |
| --- | --- | --- |
| <img src="https://github.com/see-ho.png" width="150px"/> | <img src="https://github.com/ChoiHyeonSu0.png" width="150px"/> | <img src="https://github.com/xogns950.png" width="150px"/> |
| <a href="https://github.com/see-ho">이소희 | <a href="https://github.com/ChoiHyeonSu0">  최현수 | <a href="https://github.com/xogns950">  강태훈 |
