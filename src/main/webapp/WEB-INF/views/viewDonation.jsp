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
								<option value="packed">Packed Food</option>
								<option value="snack">Snacks</option>
								<option value="fruit">Fruits</option>
								<option value="beverage">Beverages</option>
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

									<tr>
										<td>1</td>
										<td>Chicken Biriyani</td>
										<td>Non Veg</td>
										<td>3 kg</td>
										<td>Taramani, Chennai
											<i class="bi bi-geo-alt-fill text-success ms-2 View-btn"
												data-location="Taramani, Chennai"></i>
										</td>
										<td>23:00</td>
										<td>KMS Hakkim</td>
										<td>Available</td>
										<td>
											<button class="btn btn-sm btn-success View-btn">View</button>
										</td>
									</tr>

									<tr>
										<td>2</td>
										<td>Vegetable Curry</td>
										<td>Veg</td>
										<td>9 kg</td>
										<td>T Nagar, Chennai
											<i class="bi bi-geo-alt-fill text-success ms-2 View-btn"
												data-location="T Nagar, Chennai"></i>
										</td>
										<td>20:30</td>
										<td>Saravana Bhavan</td>
										<td>Available</td>
										<td>
											<button class="btn btn-sm btn-success View-btn">View</button>
										</td>
									</tr>

									<tr>
										<td>3</td>
										<td>Bread</td>
										<td>Packed</td>
										<td>25 packets</td>
										<td>Anna Nagar, Chennai
											<i class="bi bi-geo-alt-fill text-success ms-2 View-btn"
												data-location="Anna Nagar, Chennai"></i>
										</td>
										<td>11:30</td>
										<td>A2B</td>
										<td>Completed</td>
										<td>
											<button class="btn btn-sm btn-success View-btn">View</button>
										</td>
									</tr>

									<tr>
										<td>4</td>
										<td>Mutton Gravy</td>
										<td>Non Veg</td>
										<td>3 kg</td>
										<td>Egmore, Chennai
											<i class="bi bi-geo-alt-fill text-success ms-2 View-btn"
												data-location="Egmore, Chennai"></i>
										</td>
										<td>23:00</td>
										<td>Buhari</td>
										<td>Picked Up</td>
										<td>
											<button class="btn btn-sm btn-success View-btn">View</button>
										</td>
									</tr>

									<tr>
										<td>5</td>
										<td>Noodles</td>
										<td>Veg</td>
										<td>12 packets</td>
										<td>Thillai Nagar, Trichy
											<i class="bi bi-geo-alt-fill text-success ms-2 View-btn"
												data-location="Thillai Nagar, Trichy"></i>
										</td>
										<td>23:00</td>
										<td>Thoppi Vappa</td>
										<td>Cancelled</td>
										<td>
											<button class="btn btn-sm btn-success View-btn">View</button>
										</td>
									</tr>

									<tr class="no-data-row" style="display:none;">
										<td colspan="9" class="text-center text-danger">
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

	<%@ include file="/WEB-INF/common/footer.jsp" %>