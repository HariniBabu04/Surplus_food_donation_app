<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>
	<h1>Surplus Food Donation</h1>
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="card shadow-sm">
					<div class="card-body p-4">

						<div class="mb-4 text-center">
							<h3>User Registration</h3>
						</div>

						<form>
							<div class="row mb-3 align-items-center justify-content-center">
								<label for="username" class="col-sm-2 col-form-label">Username:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="username" placeholder="Enter username">
								</div>
							</div>

							<div class="row mb-3 align-items-center justify-content-center">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Email:</label>
								<div class="col-sm-6">
									<input type="email" class="form-control" id="inputEmail3" placeholder="Enter email">
								</div>
							</div>

							<div class="row mb-3 align-items-center justify-content-center">
								<label for="phone" class="col-sm-2 col-form-label">Phone number:</label>
								<div class="col-sm-6">
									<input type="tel" class="form-control" id="phone" placeholder="Enter phone number">
								</div>
							</div>

							<div class="row mb-3 align-items-center justify-content-center">
								<label for="inputPassword" class="col-sm-2 col-form-label">Password:</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="inputPassword"
										placeholder="Enter password">
								</div>
							</div>

							<div class="row mb-3 align-items-center justify-content-center">
								<label for="confirmPassword" class="col-sm-2 col-form-label">Confirm Password:</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="confirmPassword"
										placeholder="Confirm password">
								</div>
							</div>

							<div class="row mb-3 align-items-center justify-content-center">
								<label class="col-sm-2 col-form-label">Select Role:</label>
								<div class="col-sm-6">
									<select class="form-select" id="role" onchange="selectRole()">
										<option value="">Select role...</option>
										<option value="donor">Donor (Organization / Industry / Hotel)</option>
										<option value="ngo">NGO</option>
									</select>
								</div>
							</div>

							<div id="donor" style="display: none;">
								<h5 class="mt-4 text-center">Donor Details</h5>

								<div class="row mb-3 align-items-center justify-content-center">
									<label for="donorName" class="col-sm-2 col-form-label">Name:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="donorName"
											placeholder="Organization Name">
									</div>
								</div>

								<div class="row mb-3 align-items-center justify-content-center">
									<label for="donorAddress" class="col-sm-2 col-form-label">Address:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="donorAddress"
											placeholder="Organization Address">
									</div>
								</div>

								<div class="row mb-3 align-items-center justify-content-center">
									<label for="contactPerson" class="col-sm-2 col-form-label">Contact Person:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="contactPerson"
											placeholder="Contact Person Name">
									</div>
								</div>
							</div>

							<div id="ngo" style="display: none;">
								<h5 class="mt-4 text-center">NGO Details</h5>

								<div class="row mb-3 align-items-center justify-content-center">
									<label for="ngoName" class="col-sm-2 col-form-label">NGO Name:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="ngoName" placeholder="NGO Name">
									</div>
								</div>

								<div class="row mb-3 align-items-center justify-content-center">
									<label for="ngoAddress" class="col-sm-2 col-form-label">NGO Address:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="ngoAddress"
											placeholder="NGO Address">
									</div>
								</div>
							</div>

							<div class="row mb-3 align-items-center justify-content-center">
								<label for="otp" class="col-sm-2 col-form-label">OTP:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control mb-2" id="otp" placeholder="Enter OTP">
								</div>
							</div>
							<div class="row mb-3 align-items-center justify-content-center">
								<div class="col-sm-4">
									<div class="d-flex gap-2 mb-3">
										<button type="button" class="btn btn-outline-primary flex-fill">Send
											OTP</button>
										<button type="button" class="btn btn-outline-success flex-fill">Verify
											OTP</button>
									</div>
								</div>
							</div>
							<div class="row mb-3 align-items-center justify-content-center">

								<div class="col-sm-6">
									<button type="submit" class="btn btn-outline-success w-100">Register</button>
								</div>
							</div>


							<div class="text-center mt-3">
								<p>Already have an account? <a href="login">Login</a></p>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="../common/footer.jsp" %>