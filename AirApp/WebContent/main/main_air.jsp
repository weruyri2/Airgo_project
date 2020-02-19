<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/main_air.css" rel="stylesheet">

<script type="text/javascript">
//슬라이드 스크립

var slideIndex = 1;

showSlides(slideIndex);

function plusSlides(n) {

  showSlides(slideIndex += n);

}

function currentSlide(n) {

  showSlides(slideIndex = n);

}

function showSlides(n) {

  var i;

  var slides = document.getElementsByClassName("mySlides");

  var dots = document.getElementsByClassName("dot");

  if (n > slides.length) {slideIndex = 1}

  if (n < 1) {slideIndex = slides.length}

  for (i = 0; i < slides.length; i++) {

      slides[i].style.display = "none";

  }

  for (i = 0; i < dots.length; i++) {

      dots[i].className = dots[i].className.replace(" active", "");

  }

  slides[slideIndex-1].style.display = "block";

  dots[slideIndex-1].className += " active";

}

</script>


</head>
<body>
<!-- 메인 슬라이드 -->

<div class="slideshow-container">

<div class="mySlides fade2">

<img class="main_slideImg" src="../images/1.jpg">

<div class="text">Caption Text</div>

</div>

<div class="mySlides fade2">

<img class="main_slideImg" src="../images/2.jpg">

<div class="text">Caption Two</div>

</div>

<div class="mySlides fade2">

<img class="main_slideImg" src="../images/3.jpg">

<div class="text">Caption Three</div>

</div>

<a class="prev" onclick="plusSlides(-1)">❮</a>

<a class="next"onclick="plusSlides(1)">❯</a>

</div>

<br>

<div style="text-align: center">

<span class="dot" onclick="currentSlide(1)"></span> 

<span class="dot" onclick="currentSlide(2)"></span>

<span class="dot" onclick="currentSlide(3)"></span>

</div>


</body>
</html>