<%@ include file="/WEB-INF/common/header.jsp" %>

	<div class="container-fluid">
		<div class="row">

			<%@ include file="/WEB-INF/common/sidebar-ngo.jsp" %>

			<!-- Content -->
			<div class="col-md-10 p-4">
				<h3>Welcome, NGO</h3>

				<div class="row mt-4">

					<div class="col-md-3">
						<div class="card text-bg-primary">
							<div class="card-body">
								<h5>Total Donations</h5>
								<h3>25</h3>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card text-bg-success">
							<div class="card-body">
								<h5>Accepted</h5>
								<h3>12</h3>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card text-bg-warning">
							<div class="card-body">
								<h5>Pending</h5>
								<h3>8</h3>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card text-bg-danger">
							<div class="card-body">
								<h5>Expired</h5>
								<h3>5</h3>
							</div>
						</div>
					</div>

				</div>

				<h5 class="mt-5">Recent Donations</h5>
				<table class="table table-bordered mt-3">
					<thead class="table-dark">
						<tr>
							<th>Donor</th>
							<th>Food</th>
							<th>Location</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Hotel ABC</td>
							<td>Rice Meals</td>
							<td>Chennai</td>
							<td><span class="badge bg-success">Available</span></td>
						</tr>
						<tr>
							<td>Wedding Hall</td>
							<td>Veg Meals</td>
							<td>Madurai</td>
							<td><span class="badge bg-warning">Pending</span></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>

	
	<%@ include file="/WEB-INF/common/footer.jsp" %>