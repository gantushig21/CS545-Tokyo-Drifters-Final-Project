<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<style type="text/css">
@import
url(
"<spring:url value="
resource
/css/index.css"/>");
</style>

<script type="text/javascript"
	src="<spring:url value="/resource/js/main.js"/>"></script>

<%@ include file="parts/meta.jsp"%>
<title>Home Page</title>

</head>
<body>
	<%@ include file="parts/Header.jsp"%>
	<div class="container">
		<main> <!-- DAY OF THE WEEK -->
		<div class="days">

			<div class="day">
				<p class="sunday">sunday</p>
			</div>

			<div class="day">
				<p class="monday">monday</p>
			</div>

			<div class="day">
				<p class="tuesday">tuesday</p>
			</div>

			<div class="day">
				<p class="wednesday">wednesday</p>
			</div>

			<div class="day">
				<p class="thursday">thursday</p>
			</div>

			<div class="day">
				<p class="friday">friday</p>
			</div>

			<div class="day">
				<p class="saturday">saturday</p>
			</div>

		</div>
		<!-- CLOCK -->
		<div class="clock">
			<!-- HOUR -->
			<div class="numbers">
				<p class="hours"></p>
				<p class="placeholder">88</p>
			</div>

			<div class="colon">
				<p>:</p>
			</div>

			<!-- MINUTE -->
			<div class="numbers">
				<p class="minutes"></p>
				<p class="placeholder">88</p>
			</div>

			<div class="colon">
				<p>:</p>
			</div>

			<!-- SECOND -->
			<div class="numbers">
				<p class="seconds"></p>
				<p class="placeholder">88</p>
			</div>

			<!-- AM / PM -->
			<div class="am-pm">

				<!-- AM -->
				<div>
					<p class="am">am</p>
				</div>

				<!-- PM -->
				<div>
					<p class="pm">pm</p>
				</div>
			</div>

		</div>
		<!-- END CLOCK --> </main>
	</div>
	<%@ include file="parts/Footer.jsp"%>
</body>
</html>