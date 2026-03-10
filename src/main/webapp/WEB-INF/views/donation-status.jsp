<%@ include file="/WEB-INF/common/header.jsp" %>







	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/common/sidebar-donor.jsp" %>



				<!-- Main Content -->
				<div class="col-md-10 p-4">

					<!-- Page Header -->
					<div class="mb-4">
						<h3>Donation Status</h3>
						<p class="text-muted">
							Track the current status of your donated food items.
						</p>
					</div>

					<!-- Status Table -->
					<div class="card shadow-sm">
						<div class="card-header bg-white">
							<h5 class="mb-0">Donation Tracking</h5>
						</div>

						<div class="card-body table-responsive">
							<table class="table table-bordered table-hover align-middle">
								<thead class="table-light">
									<tr>
										<th>S.No</th>
										<th>Food Type</th>
										<th>Quantity</th>
										<th>NGO / Volunteer</th>
										<th>Pickup Time</th>
										<th>Status</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>1</td>
										<td>Cooked Rice</td>
										<td>20 Kg</td>
										<td>Helping Hands NGO</td>
										<td>Not Allotted</td>
										<td>
											<span class="status-badge pending">Pending</span>
										</td>
									</tr>

									<tr>
										<td>2</td>
										<td>Bread</td>
										<td>50 Packs</td>
										<td>Food For All Trust</td>
										<td>04 Feb 2026, 06:30 PM</td>
										<td>
											<span class="status-badge accepted">Accepted</span>
										</td>
									</tr>

									<tr>
										<td>3</td>
										<td>Vegetable Curry</td>
										<td>15 Kg</td>
										<td>Not Allotted</td>
										<td>03 Feb 2026, 02:00 PM</td>
										<td>
											<span class="status-badge expired">Expired</span>
										</td>
									</tr>

									<tr>
										<td>4</td>
										<td>Fruits</td>
										<td>10 Kg</td>
										<td>Green Hope NGO</td>
										<td>04 Feb 2026, 05:45 PM</td>
										<td>
											<span class="status-badge picked">Picked Up</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/common/footer.jsp" %>