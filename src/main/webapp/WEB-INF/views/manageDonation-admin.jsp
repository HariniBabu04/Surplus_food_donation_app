<%@ include file="/WEB-INF/common/header.jsp" %>

	<%@ include file="/WEB-INF/common/sidebar-admin.jsp" %>


		<div class="container mt-4">
			<h3 class="mb-4">Manage Donations</h3>

			<div id="cancelAlert" class="alert alert-success alert-dismissible fade d-none" role="alert">
				Donation canceled successfully.
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>

			<div class="row mb-3">
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="Search by food name, donor, NGO"
						id="searchBox">
				</div>
				<div class="col-md-3">
					<select class="form-select" id="statusFilter">
						<option value="">Filter by Status</option>
						<option>Available</option>
						<option>Accepted</option>
						<option>Picked Up</option>
						<option>Completed</option>
						<option>Expired</option>
						<option>Cancelled</option>
					</select>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<thead class="table-light">
						<tr>
							<th>Donation ID</th>
							<th>Food Name</th>
							<th>Donor Name</th>
							<th>NGO Name</th>
							<th>Quantity</th>
							<th>Location</th>
							<th>Posted Date</th>
							<th>Expiry Time</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-nowrap">
							<td>D001</td>
							<td>Chicken Biriyani</td>
							<td>John Doe</td>
							<td>-</td>
							<td>10 kg</td>
							<td>Taramani, Chennai</td>
							<td>2024-02-01</td>
							<td>2024-02-05</td>
							<td class="status-cell"><span>Available</span></td>
							<td>
								<button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
									data-bs-target="#viewModal">View</button>
								<button class="btn btn-sm btn-outline-warning"
									onclick="window.location.href='editDonation'">Edit</button>
								<button class="btn btn-sm btn-outline-danger cancel-btn" data-bs-toggle="modal"
									data-bs-target="#cancelModal">Cancel</button>
							</td>
						</tr>
						<tr class="text-nowrap">
							<td>D002</td>
							<td>Vegetable Curry</td>
							<td>Lucas</td>
							<td>Helping Hands</td>
							<td>20 kg</td>
							<td>North Zone</td>
							<td>2024-01-28</td>
							<td>2024-02-03</td>
							<td class="status-cell"><span>Accepted</span></td>
							<td>
								<button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
									data-bs-target="#viewModal">View</button>
								<button class="btn btn-sm btn-outline-warning"
									onclick="window.location.href='editDonation'">Edit</button>
								<button class="btn btn-sm btn-outline-danger cancel-btn" data-bs-toggle="modal"
									data-bs-target="#cancelModal">Cancel</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="modal fade" id="viewModal" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">View Donation</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<p><strong>Donation ID:</strong> D001</p>
						<p><strong>Food Name:</strong> Chicken Biriyani</p>
						<p><strong>Donor Name:</strong> John Doe</p>
						<p><strong>NGO Name:</strong> -</p>
						<p><strong>Quantity:</strong> 10 kg</p>
						<p><strong>Location:</strong> Taramani, Chennai</p>
						<p><strong>Posted Date:</strong> 2024-02-01</p>
						<p><strong>Expiry Time:</strong> 2024-02-05</p>
						<p><strong>Status:</strong> Available</p>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="cancelModal" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Cancel Donation</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						Are you sure you want to cancel this donation?
					</div>
					<div class="modal-footer">
						<button class="btn btn-danger" id="confirmCancel">Yes, Cancel</button>
						<button class="btn btn-secondary" data-bs-dismiss="modal">No</button>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/common/footer.jsp" %>