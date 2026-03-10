<%@ include file="/WEB-INF/common/header.jsp" %>

	<%@ include file="/WEB-INF/common/sidebar-admin.jsp" %>



		<div class="container mt-4">
			<h3 class="mb-4">Manage Users</h3>

			<div class="row mb-3">
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="Search by name, email, phone" id="searchBox">
				</div>
				<div class="col-md-3">
					<select class="form-select" id="filterRole">
						<option value="">Filter by Role</option>
						<option>Donor</option>
						<option>NGO</option>
						<option>Volunteer</option>
						<option>Admin</option>
					</select>
				</div>
				<div class="col-md-3">
					<select class="form-select" id="filterStatus">
						<option value="">Filter by Status</option>
						<option>Active</option>
						<option>Inactive</option>
						<option>Blocked</option>
					</select>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<thead class="table-light">
						<tr>
							<th>User ID</th>
							<th>User Name</th>
							<th>Role</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Organization</th>
							<th>Registered On</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>U001</td>
							<td>John Doe</td>
							<td>Donor</td>
							<td>john@example.com</td>
							<td>9876543210</td>
							<td>-</td>
							<td>2024-01-10</td>
							<td>Active</td>
							<td>
								<a href="${pageContext.request.contextPath}/viewUser?id=U001" class="btn btn-sm btn-outline-info">View</a>
								<a href="editUser?id=U001" class="btn btn-sm btn-outline-warning">Edit</a>
								<button class="btn btn-sm btn-outline-danger block-btn">Block</button>
							</td>
						</tr>
						<tr>
							<td>U002</td>
							<td>Lucas</td>
							<td>NGO</td>
							<td>lucas@example.com</td>
							<td>6754396754</td>
							<td>Helping Hands</td>
							<td>2023-08-12</td>
							<td>Active</td>
							<td>
								<a href="${pageContext.request.contextPath}/viewUser?id=U002" class="btn btn-sm btn-outline-info">View</a>
								<a href="editUser?id=U002" class="btn btn-sm btn-outline-warning">Edit</a>
								<button class="btn btn-sm btn-outline-danger block-btn">Block</button>
							</td>
						</tr>
						<tr class="no-data-row" style="display: none;">
							<td colspan="9" class="text-center text-danger">No data found</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<%@ include file="/WEB-INF/common/footer.jsp" %>