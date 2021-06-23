<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<!-- 하단 정보 불러오기 -->
		<style>
			.ani-ft{transition:all 0.3s;
			animation-name:ani-bt;
			animation-delay: 0.35s;
			animation-duration: 0.35s;
			bottom:-100px;
			animation-fill-mode: forwards;
			}

			@keyframes ani-bt{
				0%{
					bottom:-100px;
					opacity: 0;
				}
				100%{
					bottom:0;
					opacity: 1;
				}
			}
		</style>

		<div class="footer ani-ft">
		<!-- 하단 정보 -->	
			<div>
				<div class="f-copy">
					<p>copyright(c) AHYUN. All Rights Reserved</p>

				</div>
			</div>
		</div>

		<!-- 콘텐츠 끝 -->
		<script>
			$(".notice").on("click", function() {
				$(this).children("ul").slideToggle(100)
			})

			$(".gnb li").hover(function() {
				$(this).children("ul").slideToggle(100)
			})

			let mouseCursor = document.querySelector(".cursor");
			let aLinks = document.querySelectorAll("a");
			let inputLinks = document.querySelectorAll("input");
			let buttonLinks = document.querySelectorAll("button");
			let areaLinks = document.querySelectorAll("textarea");
			let selectLinks = document.querySelectorAll("select");
			let goggleLinks = document.querySelectorAll(".g-signin2");
			let delLinks = document.querySelectorAll(".delete-btn");
			let allLinks = document.querySelectorAll(".delete-all");
			
			window.addEventListener("scroll", cursor);
			window.addEventListener("mousemove", cursor);
			
			function cursor(e) {
				mouseCursor.style.left = e.pageX + "px";
				mouseCursor.style.top = e.pageY - scrollY + "px";
			}
			
			aLinks.forEach((link) => {
				link.addEventListener("mouseover", () => {
					mouseCursor.classList.add("cursor-grow");
				});
				link.addEventListener("mouseleave", () => {
					mouseCursor.classList.remove("cursor-grow");
				});
			});

			inputLinks.forEach((link) => {
				link.addEventListener("mouseover", () => {
					mouseCursor.classList.add("cursor-grow");
				});
				link.addEventListener("mouseleave", () => {
					mouseCursor.classList.remove("cursor-grow");
				});
			});
			
			buttonLinks.forEach((link) => {
				link.addEventListener("mouseover", () => {
					mouseCursor.classList.add("cursor-grow");
				});
				link.addEventListener("mouseleave", () => {
					mouseCursor.classList.remove("cursor-grow");
				});
			});

			areaLinks.forEach((link) => {
				link.addEventListener("mouseover", () => {
					mouseCursor.classList.add("cursor-grow");
				});
				link.addEventListener("mouseleave", () => {
					mouseCursor.classList.remove("cursor-grow");
				});
			});
			
			selectLinks.forEach((link) => {
				link.addEventListener("mouseover", () => {
					mouseCursor.classList.add("cursor-grow");
				});
				link.addEventListener("mouseleave", () => {
					mouseCursor.classList.remove("cursor-grow");
				});
			});
			
			goggleLinks.forEach((link) => {
				link.addEventListener("mouseover", () => {
					mouseCursor.classList.add("cursor-grow");
				});
				link.addEventListener("mouseleave", () => {
					mouseCursor.classList.remove("cursor-grow");
				});
			});

			delLinks.forEach((link) => {
				link.addEventListener("mouseover", () => {
					mouseCursor.classList.add("cursor-grow");
				});
				link.addEventListener("mouseleave", () => {
					mouseCursor.classList.remove("cursor-grow");
				});
			});

			allLinks.forEach((link) => {
				link.addEventListener("mouseover", () => {
					mouseCursor.classList.add("cursor-grow");
				});
				link.addEventListener("mouseleave", () => {
					mouseCursor.classList.remove("cursor-grow");
				});
			});

			$(document).ready(function() {
				document.querySelector(".circle-small").classList.add("go");
				document.querySelector(".circle-big").classList.add("go");
				
	            let subCount = sub.childElementCount - 1;
	            
	            let x = document.getElementsByClassName("number")[0];
	            x.innerText = subCount;
			});

		  AOS.init();
		</script>
	</body>
</html>