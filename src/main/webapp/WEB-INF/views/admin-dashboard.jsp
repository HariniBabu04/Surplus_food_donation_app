<%@ include file="/WEB-INF/common/header.jsp" %>

<%@ include file="/WEB-INF/common/sidebar-admin.jsp" %>

			<!-- MAIN CONTENT -->
			<div class="col-md-10 p-4 bg-light">

				<h3 class="mb-4">Admin Dashboard</h3>

				<!-- SUMMARY CARDS -->
				<div class="row g-4">

					<div class="col-md-3">
						<div class="card shadow-sm">
							<div class="card-body text-center">
								<h5>Total Users</h5>
								<h2 class="text-primary">50</h2>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow-sm">
							<div class="card-body text-center">
								<h5>Total Donations</h5>
								<h2 class="text-success">120</h2>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow-sm">
							<div class="card-body text-center">
								<h5>Active NGOs</h5>
								<h2 class="text-warning">18</h2>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow-sm">
							<div class="card-body text-center">
								<h5>Pending Requests</h5>
								<h2 class="text-danger">9</h2>
							</div>
						</div>
					</div>

				</div>

				<!-- RECENT DONATIONS TABLE -->
				<div class="card mt-5 shadow-sm">
					<div class="card-header bg-success text-white">
						Recent Donations
					</div>

					<div class="card-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead class="table-light">
								<tr>
									<th>ID</th>
									<th>Donor</th>
									<th>Food</th>
									<th>Quantity</th>
									<th>Status</th>
									<th>Date</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>1</td>
									<td>ABC Hotel</td>
									<td>Rice</td>
									<td>50 kg</td>
									<td><span class="badge bg-warning">Pending</span></td>
									<td>10 Feb 2026</td>
								</tr>

								<tr>
									<td>2</td>
									<td>XYZ Company</td>
									<td>Biryani</td>
									<td>30 kg</td>
									<td><span class="badge bg-success">Accepted</span></td>
									<td>9 Feb 2026</td>
								</tr>

								<tr>
									<td>3</td>
									<td>College Hostel</td>
									<td>Chapati</td>
									<td>20 kg</td>
									<td><span class="badge bg-primary">Picked</span></td>
									<td>8 Feb 2026</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- RECENT ACTIVITY -->
				<div class="card mt-4 shadow-sm">
					<div class="card-header bg-dark text-white">
						Recent Activity
					</div>

					<div class="card-body">
						<ul>
							<li>New donor registered</li>
							<li>Donation accepted by NGO</li>
							<li>Food expired automatically</li>
							<li>Pickup completed successfully</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/common/footer.jsp" %>