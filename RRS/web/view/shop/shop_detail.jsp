<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- fmt를 사용하기위한 태그 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style>
#center {
   background: #F3F0F0;
}

/*shop 화면 CSS START*/
#center>#shopdetails {
   width: 70%;
   background: white;
   border: 1px solid #ccc;
   box-sizing: border-box;
   margin: 0 auto;
}

#center>#shopdetails>#cntdate {
   font-size: small;
   float: right;
   margin: 5px;
}

#center>#shopdetails>#shopimgname {
   width: 70%;
   margin-top: 20px;
   margin-bottom: 20px;
}

#center>#shopdetails>#shopimgname>p {
   font-size: x-large;
   font-weight: BOLD;
}

#center>#shopdetails>#shopimgname>img {
   max-height: 200px;
   float: right;
   margin: 20px;
   max-width: 200px;
}

#center>#shopdetails>#btnrecommend {
   width: 70%;
   margin: 0 auto;
}

#center>#shopdetails>#btnrecommend>#btnUp {
   border-top-left-radius: 5px;
   border-bottom-left-radius: 5px;
   margin-right: -4px;
}

#center>#shopdetails>#btnrecommend>#btnDown {
   border-top-right-radius: 5px;
   border-bottom-right-radius: 5px;
   margin-left: -3px;
}

#center>#shopdetails>#btnrecommend>button {
   width: 20%;
   height: 30%;
   font-size: 130%;
   text-align: center;
   border: 3px solid skyblue;
   background-color: rgba(0, 0, 0, 0);
   color: skyblue;
   padding: 5px;
}

#center>#shopdetails>#btnrecommend button:hover {
   color: white;
   background-color: skyblue;
}

#center>#shopdetails>#shopinfo {
   width: 70%;
   margin-top: 20px;
   margin-bottom: 10px;
   font-size: medium;
   margin-bottom: 10px;
}

/*shop 화면 CSS END*/

/*댓글 리스트 CSS START*/
#center>#commentdetails {
   width: 70%;
   hight: auto;
   background: white;
   border: 1px solid #ccc;
   box-sizing: border-box;
   margin: 0 auto;
   text-align: center;
}

#center>#commentdetails>h2 {
   float: left;
}

#center>#commentdetails>#comment_table {
   width: 70%;
   border-collapse: collapse;
   border-right: none;
   border-left: none;
   border-bottom: none;
   margin: 0 auto;
   font-size: 20px;
   overflow: auto;
}

.no, .wr, .pt, .we {
   width: 10%;
   height: 40px;
}

.con {
   width: 60%;
   height: 40px;
}
/*댓글 리스트 CSS END*/

/*댓글등록 CSS START*/
#center>#comments_id {
   width: 70%;
   hight: auto;
   background: white;
   border: 1px solid #ccc;
   box-sizing: border-box;
   margin: 0 auto;
   text-align: center;
}

input[type=file] {
   width: 30%;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight: BOLD;
}
/*댓글등록 CSS END*/

/*게시물 수정,삭제 버튼 CSS START*/
#center>#deleteupdate {
   width: 70%;
   hight: auto;
   margin: 0 auto;
   text-align: center;
}

#center>#deleteupdate>a {
   width:100px;
   text-decoration: none;
   font-size: small;
   color: white;
   padding: 1px 2px 1px 2px;
   margin: 2px;
   display: inline-block;
   border-radius: 10px;
   transition: all 0.1s;
   text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
   background-color:#2478FF;
}
/*게시물 수정,삭제 버튼 CSS END*/
</style>

<script>
   //이미지 줌 인
   function zoomIns(event) {
      event.target.style.transform = "scale(1.3)";
      event.target.style.zIndex = 1;
      event.target.style.transition = "all 0.5s";
   }
   //이미지 줌 아웃
   function zoomOuts(event) {
      event.target.style.transform = "scale(1)";
      event.target.style.zIndex = 0;
      event.target.style.transition = "all 0.5s";
   }

   /* ----------------------------------------------------------------------------------------- */
   /*                                      추천 시스템                                                                               */
   /* ----------------------------------------------------------------------------------------- */
   function recommendUp() {
      var updata = {
         "up" : "true",
         "shopid" : "${shopdetail.shopid}",
         "userid" : "${loginuser.userid }",
         "down" : "false"
      }
      $.ajax({
         url : 'shop_recommendimpl.mc',
         type : "POST",
         data : updata,
         success : function(d) {
            alert(d);
            window.location.reload();
         },
         error : function() {
         }
      });
   };

   function recommendDown() {
      var downdata = {
         "up" : "false",
         "shopid" : "${shopdetail.shopid}",
         "userid" : "${loginuser.userid }",
         "down" : "true"
      }
      $.ajax({
         url : 'shop_recommendimpl.mc',
         type : "POST",
         data : downdata,
         success : function(d) {
            alert(d);
            window.location.reload();
         },
         error : function() {
         }
      });
   };

   $(document).ready(function() {

      //추천 기능
      $('#btnrecommend > #btnUp').click(function() {
         recommendUp(); //추천 버튼 클릭 시 추천ajax
      });
      $('#btnrecommend > #btnDown').click(function() {
         recommendDown(); //비추 버튼 클릭 시 비추천ajax
      });
   });
</script>

<div id="center">
   <p class="gap1"></p>

   <!-- shop 화면 div -->
   <div id="shopdetails">
      <!-- shop 개요 화면 -->
      <p id="cntdate">조회수 : ${shopdetail.cnt } &nbsp&nbsp 등록일자 :
         ${shopdetail.shopdate }</p>
      <br>
      <div id="shopimgname">
         <img onclick="window.open(this.src)" src="img/${shopdetail.img1 }"
            onmouseenter="zoomIns(event)" onmouseleave="zoomOuts(event)">
         <p>${shopdetail.shopname }</p>
      </div>

      <!-- 추천버튼 -->
      <div id="btnrecommend">
         <button id="btnUp">추천 : ${shoprecommend.upcount }</button>
         <button id="btnDown">비추 : ${shoprecommend.downcount }</button>
      </div>

      <!-- shop 정보 화면 div -->
      <div id="shopinfo">
         <p>위치 : ${shopdetail.address }</p>
         <p>전화 : ${shopdetail.shopphonenumber }</p>
         <p>정보 : ${shopdetail.info }</p>

      </div>

   </div>
   <p class="gap1"></p>



   <!-- 댓글리스트 div -->
   <div id="commentdetails">
      <p style="width: 70%; font-size: large;">&nbsp댓글&nbsp</p>
      <table id="comment_table" border="1">
         <tr>
            <th class="no">번호</th>
            <th class="wr">작성자</th>
            <th class="con">내용</th>
            <th class="pt">이미지</th>
            <th class="we">날짜</th>
         </tr>
         <!-- forEach 문을 활용하여 comment list 보여주기 -->
         <c:forEach var="c" items="${shop_comment }">
            <tr>
               <!-- 컨트롤러에서 넘겨준 list 모델 객체를 쓰는 방법을 잘 익혀두자 -->
               <td>${c.commentid}</td>
               <td>${c.userid}</td>
               <td>${c.commentcontents}</td>
               <c:choose>
                  <c:when test="${c.comment_img == null}">
                     <td></td>
                  </c:when>
                  <c:otherwise>
                     <td><img src="img/comment/${c.comment_img }"
                        style="width: 100px; height: 100px;"
                        onmouseenter="zoomIns(event)" onmouseleave="zoomOuts(event)"
                        onclick="window.open(this.src)"></td>
                  </c:otherwise>
               </c:choose>
               <td><fmt:formatDate value="${c.commentdate}"
                     pattern="yyyy-MM-dd HH:mm:ss" /></td>
            </tr>
         </c:forEach>
      </table>
      <br>
   </div>
   <p class="gap1"></p>

   <!-- 댓글등록 div (로그인 한 회원에게만 댓글 작성폼이 보이게 처리)-->
   <c:choose>
      <c:when test="${loginuser.userid == null}">
      </c:when>
      <c:otherwise>
         <div id="comments_id">
            <br>
            <h3>&nbsp&nbsp댓글작성</h3>
            <form enctype="multipart/form-data" name="bdto" method="post"
               action="shop_commentimpl.mc">
               <input type="hidden" name="userid" value="ID1000"> <input
                  type="hidden" name="shopid" value="${shopdetail.shopid }">
               <div>
                  <textarea name="commentcontents" id="commentcontents" rows="4"
                     cols="80" placeholder="댓글 입력"></textarea>
                  <div>
                     &nbsp사진&nbsp <input type="file" name="mf"> <input
                        type="submit" value="등록">
                  </div>
               </div>
            </form>
         </div>
         <p class="gap1"></p>
      </c:otherwise>
   </c:choose>


   <!-- 게시글 수정 삭제 -->
   <div id="deleteupdate">
      <!-- 게시글 수정 삭제 div (게시글 작성회원에게만 수정삭제폼이 보이게 처리)-->
      <c:choose>
         <c:when test="${loginuser.userid  == shopdetail.userid}">
            <a href="shopdelete.mc?shopid=${shopdetail.shopid }">DELETE</a>
            <a href="shopupdate.mc?shopid=${shopdetail.shopid }">UPDATE</a>
         </c:when>
         <c:otherwise>

         </c:otherwise>
      </c:choose>

   </div>

</div>