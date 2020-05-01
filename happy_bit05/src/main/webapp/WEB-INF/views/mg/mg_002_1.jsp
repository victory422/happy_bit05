
<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>메세지 보내기</title>
	<link rel="stylesheet" href="/css/main.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">


</head>
<body>
	<div class="container bg-light">
		<div class="wrapper-2">
			<input id="inputRoom" class="bg-gray round-input p-2" placeholder="Input room name">
			<button class="round-input" onclick="enterOrCreate()">
				<i class="fas fa-sign-in-alt"></i>
			</button>
		</div>
		<p class="font-size-s mt-3">생성된 방</p>
		<ul id="roomList" class="room-list"></ul>
	</div>
	<script src="//code.jquery.com/jquery-1.11.1.js"></script>
	<script>
		$(document).ready(() => {
			$.ajax({
				url: '/chat',
				type: 'get',
			}).done((data) => {
				result = ''
				data.rooms.forEach(element => {
					element = element.split('.json')[0]
					result += `<li><a href="/chat/${element}">${element}</a></li>`
				});
				$('#roomList').html(result);
			});
		});

		function enterOrCreate() {
			var inputRoom = $('#inputRoom').val();
			if(inputRoom.length != 0) {
				location.href = '/chat/' + inputRoom;
			}
		}
	</script>
</body>
<%@ include file="../includes/middle.jsp"%>
<%@ include file="../includes/footer.jsp"%>
