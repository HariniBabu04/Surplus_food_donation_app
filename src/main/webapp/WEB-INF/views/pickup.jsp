<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Users</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Surplus Food Donation</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto align-items-center">
        <li class="nav-item"><a class="nav-link" href="home  ">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="adminDashboard  ">Admin Dashboard</a></li>
        <li class="nav-item"><a class="nav-link" href="manageDonation-admin  ">Manage Donations</a></li>
        <li class="nav-item"><a class="nav-link" href="login  ">Logout</a></li>
        <li class="nav-item">
          <a class="nav-link" href="profile  "><i class="bi bi-person-circle" style="font-size: 1.5rem;"></i></a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <h3 class="mb-4">Manage Users</h3>

  <div class="row mb-3">
    <div class="col-md-4">
      <input type="text" class="form-control" placeholder="Search by name, email, phone" id="searchBox">
    </div>
    <div class="col-md-3">
      <select class="form-select" id="roleFilter">
        <option value="">Filter by Role</option>
        <option>Donor</option>
        <option>NGO</option>
        <option>Volunteer</option>
        <option>Admin</option>
      </select>
    </div>
    <div class="col-md-3">
      <select class="form-select" id="statusFilter">
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
            <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal" data-bs-target="#viewModal">View</button>
            <button class="btn btn-sm btn-outline-warning" data-bs-toggle="modal" data-bs-target="#editModal">Edit</button>
            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#blockModal">Block</button>
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
            <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal" data-bs-target="#viewModal">View</button>
            <button class="btn btn-sm btn-outline-warning" data-bs-toggle="modal" data-bs-target="#editModal">Edit</button>
            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#blockModal">Block</button>
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
        <h5 class="modal-title">View User</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p><strong>User ID:</strong> U001</p>
        <p><strong>Name:</strong> John Doe</p>
        <p><strong>Role:</strong> Donor</p>
        <p><strong>Email:</strong> john@example.com</p>
        <p><strong>Phone:</strong> 9876543210</p>
        <p><strong>Organization:</strong> -</p>
        <p><strong>Registered On:</strong> 2024-01-10</p>
        <p><strong>Status:</strong> Active</p>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit User</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" value="John Doe">
          </div>
          <div class="mb-3">
            <label class="form-label">Role</label>
            <select class="form-select">
              <option selected>Donor</option>
              <option>NGO</option>
              <option>Volunteer</option>
              <option>Admin</option>
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" value="john@example.com">
          </div>
          <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" class="form-control" value="9876543210">
          </div>
          <div class="mb-3">
            <label class="form-label">Organization</label>
            <input type="text" class="form-control" value="-">
          </div>
          <div class="mb-3">
            <label class="form-label">Status</label>
            <select class="form-select">
              <option selected>Active</option>
              <option>Inactive</option>
              <option>Blocked</option>
            </select>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary">Save Changes</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="blockModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Block User</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        Are you sure you want to block this user?
      </div>
      <div class="modal-footer">
        <button class="btn btn-danger">Yes, Block</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
const searchBox = document.getElementById("searchBox");
const roleFilter = document.getElementById("roleFilter");
const statusFilter = document.getElementById("statusFilter");
const tableRows = document.querySelectorAll("tbody tr");

function filterTable() {
  const searchText = searchBox.value.toLowerCase();
  const selectedRole = roleFilter.value.toLowerCase();
  const selectedStatus = statusFilter.value.toLowerCase();

  tableRows.forEach(row => {
    const name = row.cells[1].innerText.toLowerCase();
    const role = row.cells[2].innerText.toLowerCase();
    const email = row.cells[3].innerText.toLowerCase();
    const phone = row.cells[4].innerText.toLowerCase();
    const status = row.cells[7].innerText.toLowerCase();

    const matchesSearch = name.includes(searchText) || email.includes(searchText) || phone.includes(searchText);
    const matchesRole = selectedRole === "" || role === selectedRole;
    const matchesStatus = selectedStatus === "" || status === selectedStatus;

    row.style.display = matchesSearch && matchesRole && matchesStatus ? "" : "none";
  });
}

searchBox.addEventListener("keyup", filterTable);
roleFilter.addEventListener("change", filterTable);
statusFilter.addEventListener("change", filterTable);
</script>
</body>
</html>
