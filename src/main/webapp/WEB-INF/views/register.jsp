<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background-color:#e6f4ea;
font-family:"Segoe UI",Tahoma,Geneva,Verdana,sans-serif;
}

h1{
text-align:center;
font-weight:700;
color:#2e7d32;
margin-top:20px;
margin-bottom:10px;
}

h3{
font-weight:600;
color:#1b5e20;
}

.container{
max-width:1100px;
}

.card{
border-radius:12px;
border:none;
background-color:#ffffff;
}

.card-body{
padding:2.5rem;
}

.col-form-label{
font-weight:500;
white-space:normal;
}

.form-control,
.form-select{
border-radius:8px;
padding:0.6rem 0.75rem;
}

.form-control:focus,
.form-select:focus{
box-shadow:0 0 0 0.15rem rgba(46,125,50,0.25);
}

p{
margin-top:10px;
}

a{
text-decoration:none;
}

a:hover{
text-decoration:underline;
}

</style>
</head>

<body>

<h1>Surplus Food Donation</h1>

<div class="container py-5">
<div class="row justify-content-center">
<div class="col-lg-10">

<div class="card shadow-sm">
<div class="card-body p-4">

<div class="mb-4 text-center">
<h3>User Registration</h3>
</div>

<form action="register" method="post">

<!-- USERNAME -->
<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">Username:</label>
<div class="col-sm-5">
<input type="text" class="form-control" name="name" placeholder="Enter username">
</div>
</div>

<!-- EMAIL -->
<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">Email:</label>
<div class="col-sm-5">
<input type="email" class="form-control" name="email" placeholder="Enter email">
</div>
</div>

<!-- PHONE -->
<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">Phone number:</label>
<div class="col-sm-5">
<input type="tel" class="form-control" name="phone" placeholder="Enter phone number">
</div>
</div>

<!-- PASSWORD -->
<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">Password:</label>
<div class="col-sm-5">
<input type="password" class="form-control" name="password" placeholder="Enter password">
</div>
</div>

<!-- CONFIRM PASSWORD -->
<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">Confirm Password:</label>
<div class="col-sm-5">
<input type="password" class="form-control" placeholder="Confirm password">
</div>
</div>

<!-- ROLE -->
<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">Select Role:</label>
<div class="col-sm-5">
<select class="form-select" name="role" id="role" onchange="selectRole()">
<option value="">Select role...</option>
<option value="Donor">Donor (Organization / Industry / Hotel)</option>
<option value="NGO">NGO</option>
</select>
</div>
</div>

<!-- DONOR DETAILS -->
<div id="donor" style="display:none;">

<h5 class="mt-4 text-center">Donor Details</h5>

<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">Organization Name:</label>
<div class="col-sm-5">
<input type="text" class="form-control" name="organization_name" placeholder="Organization Name">
</div>
</div>

<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">Organization Address:</label>
<div class="col-sm-5">
<input type="text" class="form-control" name="address" placeholder="Organization Address">
</div>
</div>

</div>

<!-- NGO DETAILS -->
<div id="ngo" style="display:none;">

<h5 class="mt-4 text-center">NGO Details</h5>

<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">NGO Name:</label>
<div class="col-sm-5">
<input type="text" class="form-control" name="organization_name" placeholder="NGO Name">
</div>
</div>

<div class="row mb-3 align-items-center justify-content-center">
<label class="col-sm-3 col-form-label">NGO Address:</label>
<div class="col-sm-5">
<input type="text" class="form-control" name="address" placeholder="NGO Address">
</div>
</div>

</div>



<!-- OTP -->
<div class="row mb-3 align-items-start justify-content-center">
<label class="col-sm-3 col-form-label">OTP:</label>
<div class="col-sm-5">
<input type="text" class="form-control mb-2" placeholder="Enter OTP">

<div class="d-flex gap-2">
<button type="button" class="btn btn-outline-primary flex-fill">Send OTP</button>
<button type="button" class="btn btn-outline-success flex-fill">Verify OTP</button>
</div>

</div>
</div>

<!-- REGISTER BUTTON -->
<div class="row mb-3 align-items-center justify-content-center">
<div class="col-sm-6">
<button type="submit" class="btn btn-outline-success w-100">Register</button>
</div>
</div>

<div class="text-center mt-3">
<p>Already have an account? <a href="login">Login</a></p>
</div>

</form>

</div>
</div>
</div>
</div>
</div>

<script>

function selectRole(){

const role=document.getElementById("role").value;
const donor=document.getElementById("donor");
const ngo=document.getElementById("ngo");

const donorInputs = donor.querySelectorAll("input");
const ngoInputs = ngo.querySelectorAll("input");

donor.style.display="none";
ngo.style.display="none";

donorInputs.forEach(i => i.disabled = true);
ngoInputs.forEach(i => i.disabled = true);

if(role==="Donor"){
donor.style.display="block";
donorInputs.forEach(i => i.disabled = false);
}

if(role==="NGO"){
ngo.style.display="block";
ngoInputs.forEach(i => i.disabled = false);
}

}

</script>

</body>
</html>