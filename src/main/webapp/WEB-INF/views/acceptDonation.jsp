<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/header.jsp" %>

<div class="container-fluid">
<div class="row">

<%@ include file="/WEB-INF/common/sidebar-ngo.jsp" %>

<div class="col-md-9 p-4">

<div class="card shadow">
<div class="card-body">

<h5 class="text-success mb-3">Accept Food Donation</h5>

<form class="row g-3" action="/acceptDonation" method="post">

<input type="hidden" name="donationId" value="${donation.donationId}">

<div class="col-12">
<h6 class="text-secondary">Food Information</h6>
</div>

<div class="col-md-6">
<label class="form-label">Food Name</label>
<input type="text"
class="form-control"
name="foodName"
value="${donation.foodName}"
readonly>
</div>

<div class="col-md-6">
<label class="form-label">Food Type</label>
<input type="text"
class="form-control"
name="foodType"
value="${donation.foodType}"
readonly>
</div>

<div class="col-md-4">
<label class="form-label">Quantity</label>
<input type="text"
class="form-control"
name="quantity"
value="${donation.quantity}"
readonly>
</div>

<div class="col-md-4">
<label class="form-label">Expiry Time</label>
<input type="text"
class="form-control"
value="${donation.expiryTime}"
readonly>
</div>

<div class="col-12 mt-3">
<h6 class="text-secondary">Location Information</h6>
</div>

<div class="col-12">
<label class="form-label">Pickup Address</label>

<div class="input-group">

<input type="text"
class="form-control"
name="pickupAddress"
value="${donation.pickupAddress}"
readonly>

<a href="https://www.google.com/maps/search/?api=1&query=${donation.pickupAddress}"
class="btn btn-outline-secondary"
target="_blank"> <i class="bi bi-geo-alt-fill"></i> </a>

</div>

</div>

<div class="col-12 mt-3">
<h6 class="text-secondary">Donor Information</h6>
</div>

<div class="col-md-6">
<label class="form-label">Donor / Organization Name</label>
<input type="text"
class="form-control"
value="${donation.donor.organizationName}"
readonly>
</div>

<div class="col-md-6">
<label class="form-label">Contact Number</label>
<input type="text"
class="form-control"
value="${donation.contactNumber}"
readonly>
</div>

<div class="col-12 mt-3">
<h6 class="text-secondary">NGO / Volunteer Information</h6>
</div>

<div class="col-md-4">
    <label class="form-label">NGO Name</label>
    <input type="text" 
           class="form-control" 
           value="${sessionScope.loggedUser.organizationName}" 
           readonly>
</div>

<div class="col-md-4">
    <label class="form-label">Volunteer Name</label>
    <input type="text" 
           class="form-control" 
           value="${sessionScope.loggedUser.name}" 
           readonly>
</div>

<div class="col-md-4">
    <label class="form-label">Contact Number</label>
    <input type="text" 
           class="form-control" 
           value="${sessionScope.loggedUser.phone}" 
           readonly>
</div>

<div class="col-12 mt-3">
<h6 class="text-secondary">Pickup Planning</h6>
</div>

<div class="col-md-4">
<label class="form-label">Expected Pickup Time</label>
<input type="datetime-local"
name="pickupTime"
class="form-control">
</div>

<div class="col-md-4">
<label class="form-label">Number of Volunteers</label>
<input type="number"
name="volunteerCount"
class="form-control">
</div>

<div class="col-md-4">
<label class="form-label">Vehicle Type</label>

<select class="form-select"
name="vehicleType">

<option>Bike</option>
<option>Van</option>
<option>Truck</option>

</select>

</div>

<div class="col-md-12">
<label class="form-label">Remarks</label>

<textarea class="form-control"
name="remarks"
rows="2"></textarea>

</div>

<div class="col-12 d-flex justify-content-end gap-2 mt-4">

<button type="submit"
class="btn btn-success">
Accept Donation </button>

<button type="button"
class="btn btn-outline-danger"
onclick="window.location.href='/viewDonation'">
Cancel </button>

</div>

</form>

</div>
</div>

</div>
</div>
</div>

<%@ include file="/WEB-INF/common/footer.jsp" %>
