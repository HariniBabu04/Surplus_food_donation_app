<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Jarvis AI Assistant</title>

<style>
body{
font-family: Arial;
}

#chat-container{
width:400px;
margin:50px auto;
border:1px solid #ccc;
border-radius:10px;
padding:10px;
}

#chat-box{
height:300px;
overflow-y:auto;
border:1px solid #ddd;
padding:10px;
margin-bottom:10px;
}

.user{
color:blue;
margin:5px 0;
}

.bot{
color:green;
margin:5px 0;
}

#message{
width:75%;
padding:8px;
}

button{
padding:8px 15px;
cursor:pointer;
}
</style>

</head>

<body>

<div id="chat-container">

<h3>Jarvis AI Assistant</h3>

<div id="chat-box"></div>

<input type="text" id="message" placeholder="Ask Jarvis..." />
<button onclick="sendMessage()">Send</button>

</div>

<script>

function sendMessage(){

let message=document.getElementById("message").value;

if(message.trim()=="") return;

let chatBox=document.getElementById("chat-box");

chatBox.innerHTML += "<div class='user'><b>You:</b> "+message+"</div>";

fetch("/ask-jarvis",{
method:"POST",
headers:{
"Content-Type":"application/json"
},
body:JSON.stringify({message:message})
})

.then(response=>response.text())

.then(data=>{

chatBox.innerHTML += "<div class='bot'><b>Jarvis:</b> "+data+"</div>";

chatBox.scrollTop=chatBox.scrollHeight;

});

document.getElementById("message").value="";

}

</script>

</body>
</html>