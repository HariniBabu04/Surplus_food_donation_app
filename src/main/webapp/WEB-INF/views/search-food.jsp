<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%@ include file="/WEB-INF/common/header.jsp" %>

			<div class="container-fluid">
				<div class="row">

					
					<%@ include file="/WEB-INF/common/sidebar-ngo.jsp" %>

						<div class="col-md-10 p-4">

							<h3>Search Food by Location</h3>

							<div class="card mt-3">
								<div class="card-body">

									<form action="/search-food" method="get">
										<div class="row">

											<div class="col-md-4">
												<label>City</label>
												<input type="text" name="city" class="form-control"
													placeholder="Enter city" value="${param.city}">
											</div>

											<div class="col-md-4">
												<label>Food Type</label>
												<select name="foodType" class="form-select">
													<option value="">All</option>

													<!-- ✅ Values matched with DB -->
													<option value="veg" ${param.foodType=='veg' ? 'selected' : '' }>Veg
													</option>
													<option value="non veg" ${param.foodType=='non veg' ? 'selected'
														: '' }>Non-Veg</option>
													<option value="fruits" ${param.foodType=='fruits' ? 'selected' : '' }>
														Fruits</option>
													<option value="snack" ${param.foodType=='snack' ? 'selected' : '' }>
														Snacks</option>
												</select>
											</div>

										</div>

										<button type="submit" class="btn btn-primary mt-3">Search</button>
									</form>

								</div>
							</div>

							<table class="table table-bordered mt-4">
								<thead class="table-dark">
									<tr>
										<th>Donor</th>
										<th>Food</th>
										<th>Food Type</th>
										<th>Qty</th>
										<th>Location</th>
										<th>Expiry</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="donation" items="${donations}">

										<tr>
											<td>${donation.donor.organizationName}</td>
											<td>${donation.foodName}</td>
											<td>${donation.foodType}</td>
											<td>${donation.quantity}</td>
											<td>${donation.pickupAddress}</td>
											<td>${donation.expiryTime}</td>

											<!-- ✅ Status Column -->
											<td>
												<c:choose>
													<c:when test="${donation.status == 'CREATED'}">
														<span class="badge bg-primary">Available</span>
													</c:when>

													<c:when test="${donation.status == 'ACCEPTED'}">
														<span class="badge bg-success">Accepted</span>
													</c:when>

													<c:when test="${donation.status == 'CANCELLED'}">
														<span class="badge bg-danger">Cancelled</span>
													</c:when>

													<c:when test="${donation.status == 'EXPIRED'}">
														<span class="badge bg-secondary">Expired</span>
													</c:when>

													<c:otherwise>
														<span class="badge bg-dark">${donation.status}</span>
													</c:otherwise>
												</c:choose>
											</td>

											<!-- ✅ Action Column -->
											<td>
												<c:choose>

													<c:when test="${donation.status == 'CREATED'}">
														<a href="/acceptDonation/${donation.donationId}"
															class="btn btn-success btn-sm">Accept</a>
													</c:when>

													
													<c:when test="${donation.status == 'ACCEPTED'}">
														<button class="btn btn-secondary btn-sm" disabled>
															Accepted
														</button>
													</c:when>

												
													<c:when test="${donation.status == 'CANCELLED'}">
														<button class="btn btn-danger btn-sm" disabled>
															Cancelled
														</button>
													</c:when>

												
													<c:when test="${donation.status == 'EXPIRED'}">
														<button class="btn btn-dark btn-sm" disabled>
															Expired
														</button>
													</c:when>

													<c:otherwise>
														<button class="btn btn-secondary btn-sm" disabled>
															Not Available
														</button>
													</c:otherwise>

												</c:choose>
											</td>
										</tr>

									</c:forEach>

									<c:if test="${empty donations}">
										<tr>
											<td colspan="8" class="text-center text-muted">
												No food donations found
											</td>
										</tr>
									</c:if>

								</tbody>
							</table>

						</div>
				</div>
			

			</div>

			<%@ include file="/WEB-INF/common/footer.jsp" %>