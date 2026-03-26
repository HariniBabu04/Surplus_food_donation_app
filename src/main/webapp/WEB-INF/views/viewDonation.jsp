<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/header.jsp" %>

	<div class="container-fluid">
		<div class="row">

		
			<%@ include file="/WEB-INF/common/sidebar-ngo.jsp" %>

				<!-- Content -->
				<div class="col-md-9 p-4">

					<h3>View Donations</h3>

					<div class="row mb-3 mt-4">

						<div class="col-md-3">
							<select class="form-select" id="filterType">
								<option value="">All Food</option>
								<option value="veg">Veg Food</option>
								<option value="non veg">Non Veg Food</option>
								<option value="snack">Snacks</option>
								<option value="fruit">Fruits</option>
							</select>
						</div>

						<div class="col-md-3">
							<select class="form-select" id="expiryTime">
								<option value="">All Expiry Times</option>
								<option value="soon">Soon</option>
								<option value="later">Later</option>
							</select>
						</div>

						<div class="col-md-3">
							<select class="form-select" id="filterQuantity">
								<option value="">All Quantity</option>
								<option value="small">Small</option>
								<option value="medium">Medium</option>
								<option value="large">Large</option>
							</select>
						</div>

						<div class="col-md-3">
							<input type="text" class="form-control" placeholder="Search by food or location"
								id="searchBox">
						</div>

					</div>

					<div class="card shadow-sm">
						<div class="card-body">

							<table class="table table-bordered">
								<thead class="table-success">
									<tr>
										<th>Donation ID</th>
										<th>Food Name</th>
										<th>Category</th>
										<th>Quantity</th>
										<th>Location</th>
										<th>Expiry Time</th>
										<th>Donor Organization Name</th>
										<th>Status</th>
										<th>Action</th>
										
									</tr>
								</thead>

								<tbody id="donationTable">

									<c:forEach items="${donations}" var="donation">
										<tr>
											<td>${donation.donationId}</td>
											<td>${donation.foodName}</td>
											<td>${donation.foodType}</td>
											<td>${donation.quantity}</td>
											<td>
											    ${donation.pickupAddress}
											    <a href="https://www.google.com/maps/search/?api=1&query=${donation.pickupAddress}" 
											       target="_blank">
											        <i class="bi bi-geo-alt-fill text-success ms-2"></i>
											    </a>
											</td>
											<td>${donation.expiryTime}</td>
											<td>${donation.donor.organizationName}</td>
											<td><span class="badge bg-success">${donation.status}</span></td>
											<td>
											    <div class="d-flex gap-2">

											        <!-- CREATED → Enable Accept -->
											        <c:if test="${donation.status == 'CREATED'}">
											            <a href="/acceptDonation/${donation.donationId}" 
											               class="btn btn-sm btn-success">
											               Accept
											            </a>
											        </c:if>

											        <!-- ACCEPTED → Disabled Accept + Pickup -->
											        <c:if test="${donation.status == 'ACCEPTED'}">
											            <button class="btn btn-sm btn-success" disabled>
											                Accepted
											            </button>

											            <a href="/pickup/${donation.donationId}" 
											               class="btn btn-sm btn-primary">
											               Pickup
											            </a>
											        </c:if>

											    </div>
											</td>
										</tr>
									</c:forEach>

									<c:if test="${empty donations}">
										<tr class="no-data-row">
											<td colspan="9" class="text-center text-danger">
												No donations available at the moment.
											</td>
										</tr>
									</c:if>

								</tbody>

								

							</table>

						</div>
					</div>

				</div>

		</div>
		

	</div>

	<%@ include file="/WEB-INF/common/footer.jsp" %>