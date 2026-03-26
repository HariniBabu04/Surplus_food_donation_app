<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%@ include file="/WEB-INF/common/header.jsp" %>

			<div class="container mt-4">
				<h3>Pickup Confirmation</h3>

			
				<div class="card mt-3">
					<div class="card-body">

						<!-- Donation Details -->
						<h5>Donation Details</h5>
						<p><strong>Food:</strong> ${donation.foodName}</p>
						<p><strong>Type:</strong> ${donation.foodType}</p>
						<p><strong>Quantity:</strong> ${donation.quantity}</p>
						<p><strong>Location:</strong> ${donation.pickupAddress}</p>
						<p><strong>Expiry:</strong> ${donation.expiryTime}</p>

						<hr>

						<!-- Pickup Form -->
						<form id="pickupForm" action="/confirm-pickup" method="post">

						    <input type="hidden" id="donationId" name="donationId" value="${donation.donationId}" />

						    <div class="row">
						        <div class="col-md-6">
						            <label>Actual Pickup Time</label>
						            <input type="datetime-local" id="actualPickupTime" name="actualPickupTime" class="form-control" required>
						        </div>

						        <div class="col-md-6">
						            <label>Volunteer Name</label>
						            <input type="text" id="volunteerName" name="volunteerName" class="form-control" required>
						        </div>
						    </div>

						    <div class="row mt-3">
								<div class="col-md-4">
								    <label class="form-label">Vehicle Type</label>
								    <select class="form-select" id="vehicleType">
								        <option value="">Select</option>
								        <option value="Bike">Bike</option>
										<option value="car">Car</option>
								        <option value="Auto">Auto</option>
								        <option value="Van">Van</option>
								        <option value="Truck">Truck</option>
								    </select>
								</div>
						        <div class="col-md-6">
						            <label>Vehicle Number</label>
						            <input type="text" name="vehicleNumber" class="form-control" required>
						        </div>

						        
						    </div>
							<h5 class="text-success mt-4 mb-3">OTP Verification</h5>
							<div class="col-md-4">
							<label class="form-label">Enter Pickup OTP</label>
							<input type="text" class="form-control" id="pickupOTP">
							</div>
							<div class="col-md-2 d-flex align-items-end">
							<button type="button" class="btn btn-primary w-100" id="verifyOTP">Verify OTP</button>
							</div>

							

						    <div class="mt-3">
						        <label>Pickup Remarks</label>
						        <textarea name="pickupRemarks" class="form-control"></textarea>
						    </div>

						    <div class="mt-4">
						        <!-- IMPORTANT: add id -->
						        <button type="button" id="confirmPickup" class="btn btn-success">
						            Confirm Pickup
						        </button>

						        <a href="/viewDonation" class="btn btn-secondary">
						            Cancel
						        </a>
						    </div>

						</form>
					</div>
				</div>
			

			</div>

			<%@ include file="/WEB-INF/common/footer.jsp" %>