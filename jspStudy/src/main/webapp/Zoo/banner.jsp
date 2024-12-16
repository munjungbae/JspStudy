<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int num = (int) Math.floor(Math.random() * (3 - 1 + 1) + 1);
%>
<script>
function onload() {
        const img = document.querySelector(".banner_change");
        const left = document.querySelector(".fa-caret-left");
        const right = document.querySelector('.fa-caret-right');

        let intervalID = null;

        function change() {
        		let num = Math.floor(Math.random() * (4 - 1 + 1) + 1);
            let srcData = "http://localhost:8080/jspStudy/Zoo/img/lulu"+num+".png";

            img.src = srcData;
        }
        intervalID = setInterval(change, 2000);

        img.addEventListener("mouseenter", (event) => {
            clearInterval(intervalID);
        })
        img.addEventListener("mouseleave", (event) => {
            intervalID = setInterval(change, 2000);
        })
        left.addEventListener("click", change);

        left.addEventListener("mouseenter", (event) => {
            clearInterval(intervalID);
        })
        left.addEventListener("mouseleave", (event) => {
            intervalID = setInterval(change, 2000);
        })

        right.addEventListener("click", change);

        right.addEventListener("mouseenter", (event) => {
            clearInterval(intervalID);
        })
        right.addEventListener("mouseleave", (event) => {
            intervalID = setInterval(change, 2000);
        })
    }
</script>

	<aside>
		<div class="img_change">
			<i class="fa-solid fa-caret-left"></i> <img
				src="./img/lulu<%=num%>.png" alt="" class="banner_change"> <i
				class="fa-solid fa-caret-right"></i>
		</div>
	</aside>