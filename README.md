# 멀티캠퍼스 세미 프로젝트(Spring MVC를 활용한 웹사이트 제작) 
## 소비자들끼리 소통해서 공유하는 맛집리스트 사이트 구현
- 다녀온 음식점에 대한 평가를 소비자가 직접 입력하여 다른 소비자들끼리 공유할 수 있고 추천시스템을 통해 음식점들의 랭킹을 측정해 소비자가 현명한 선택을 할 수 있도록 한다. 등록된 음식점들은 클릭을 통해 해당 음식점의 게시글로 이동해 상세한 정보를 직접 확인할 수 있다. 소비자들은 게시글에서 추천과 비추천을 통해 해당 음식점의 선호를 표시할 수 있다. 추천이 많은 음식점은 랭킹에 오르게 된다. 댓글을 통해 이미 등록된 음식점에 다른 소비자가 직접 의견을 제시하거나 사진을 통해 맛집에 대한 정보를 공유할 수 있다.

## UI

## 프로젝트 실행
- 사이트 경로 : 127.0.0.1/RRS

- 개인 설정
1. src/com/controller/Util.java 에서 이미지 저장 경로 설정
2. src/myspring.xml(com.test 내부 파일용) 에서 Database Setting 개인설정으로 변경(17~23줄)
3. web/WEB-INF/config/spring.xml 에서 Database Setting 개인설정으로 변경(58~67줄)

- 공통 설정
1. web/WEB-INF/web.xml 에서 dispatcher설정(.mc로 통일)

## ERD & 구성도

![ERD](https://user-images.githubusercontent.com/39368262/92594470-c715a480-f2dd-11ea-840c-bd3bad2da5bd.jpg)

![구성도](https://user-images.githubusercontent.com/39368262/92594518-d7c61a80-f2dd-11ea-8c37-8882b01244ef.png)

## 개발도구
1) 언어
   - HTML, CSS, JavaScript, Jquery, JSP, JSTL, AJAX, Java

2) DataBase
   - Oracle(11g Express Edition), Tomcat(9.0)

3) Framework
   - Spring(Annotation), Mybatis

4) IDE
   - Eclipse, Sqldeveloper
