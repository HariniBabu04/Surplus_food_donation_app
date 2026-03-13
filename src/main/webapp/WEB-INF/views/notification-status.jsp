<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Notification Status</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f9;
        }
        .page-title {
            font-weight: 600;
            color: #333;
        }
        .status-badge {
            font-size: 0.85rem;
        }
        .card {
            border-radius: 12px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-success">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1">Surplus Food Donation System</span>
        <span class="text-white">Notification Status</span>
    </div>
</nav>

<div class="container mt-4">

    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="page-title">Notification Logs</h3>
        <button class="btn btn-success">Refresh</button>
    </div>

    <!-- Notification Table -->
    <div class="card shadow-sm">
        <div class="card-body">

            <table class="table table-bordered table-hover align-middle">
                <thead class="table-success">
                    <tr>
                        <th>#</th>
                        <th>User</th>
                        <th>Message</th>
                        <th>Type</th>
                        <th>Sent Time</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>1</td>
                        <td>ABC NGO</td>
                        <td>New food donation available near you</td>
                        <td>Email</td>
                        <td>14 Feb 2026, 10:30 AM</td>
                        <td><span class="badge bg-success status-badge">Delivered</span></td>
                    </tr>

                    <tr>
                        <td>2</td>
                        <td>XYZ Organization</td>
                        <td>Pickup confirmed successfully</td>
                        <td>SMS</td>
                        <td>14 Feb 2026, 09:50 AM</td>
                        <td><span class="badge bg-warning text-dark status-badge">Pending</span></td>
                    </tr>

                    <tr>
                        <td>3</td>
                        <td>Helping Hands NGO</td>
                        <td>Food expired and removed</td>
                        <td>Email</td>
                        <td>13 Feb 2026, 08:15 PM</td>
                        <td><span class="badge bg-danger status-badge">Failed</span></td>
                    </tr>

                </tbody>
            </table>

        </div>
    </div>

</div>

<!-- Footer -->
<footer class="text-center mt-4 mb-3 text-muted">
    © 2026 Surplus Food Donation System
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
