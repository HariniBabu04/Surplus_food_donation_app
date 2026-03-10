<%@ include file="/WEB-INF/common/header.jsp" %>

<div class="container-fluid">
	<div class="row min-vh-100">

		
			<%@ include file="/WEB-INF/common/sidebar-donor.jsp" %>
		

		<!-- Main Content -->
		<div class="col-md-10 p-4">

			<h4 class="mb-4">Manage Donations</h4>

			<!-- Filters -->
			<div class="row mb-3">
				<div class="col-md-3">
					<select class="form-select" id="filterStatus">
						<option value="">All Status</option>
						<option value="completed">Completed</option>
						<option value="accepted">Accepted</option>
						<option value="pending">Pending</option>
						<option value="expired">Expired</option>
					</select>
				</div>

				<div class="col-md-3">
					<select class="form-select" id="filterDate">
						<option value="">All Dates</option>
						<option value="today">Today</option>
						<option value="thisWeek">This Week</option>
					</select>
				</div>

				<div class="col-md-3">
					<select class="form-select" id="filterType">
						<option value="">All Food</option>
						<option value="veg">Veg Food</option>
						<option value="nonveg">Non Veg Food</option>
						<option value="packed">Packed Food</option>
						<option value="snack">Snacks</option>
						<option value="fruit">Fruits</option>
						<option value="beverage">Beverages</option>
					</select>
				</div>

				<div class="col-md-3">
					<input type="text" class="form-control"
						placeholder="Search by food or location" id="searchBox">
				</div>
			</div>

			<!-- Table -->
			<div class="card shadow-sm">
				<div class="card-body">

					<div class="table-responsive">
						<table class="table table-bordered table-hover">

							<thead class="table-success">
								<tr>
									<th>Donation ID</th>
									<th>Food Name</th>
									<th>Quantity</th>
									<th>Location</th>
									<th>Expiry Time</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>

							<tbody>

								<tr>
									<td>1</td>
									<td>Chicken Biriyani</td>
									<td>3 kg</td>
									<td>Taramani, Chennai</td>
									<td>23:00</td>
									<td>Accepted</td>
									<td>
										<button class="btn btn-sm btn-outline-primary">View</button>
										<button class="btn btn-sm btn-outline-warning">Edit</button>
										<button class="btn btn-sm btn-outline-danger">Delete</button>
									</td>
								</tr>

								<tr>
									<td>2</td>
									<td>Vegetable Curry</td>
									<td>9 kg</td>
									<td>T Nagar, Chennai</td>
									<td>20:30</td>
									<td>Pending</td>
									<td>
										<button class="btn btn-sm btn-outline-primary">View</button>
										<button class="btn btn-sm btn-outline-warning">Edit</button>
										<button class="btn btn-sm btn-outline-danger">Delete</button>
									</td>
								</tr>

								<tr>
									<td>3</td>
									<td>Bread</td>
									<td>25 packets</td>
									<td>Anna Nagar, Chennai</td>
									<td>11:30</td>
									<td>Completed</td>
									<td>
										<button class="btn btn-sm btn-outline-primary">View</button>
										<button class="btn btn-sm btn-outline-warning">Edit</button>
										<button class="btn btn-sm btn-outline-danger">Delete</button>
									</td>
								</tr>

								<tr class="no-data-row" style="display:none;">
									<td colspan="7" class="text-center text-danger">
										No data found
									</td>
								</tr>

							</tbody>

						</table>
					</div>

				</div>
			</div>

		</div>

	</div>
</div>

<%@ include file="/WEB-INF/common/footer.jsp" %>