/* =========================
   GLOBAL GOOGLE MAP CALLBACK
========================= */
function initMap() {
    const mapDiv = document.getElementById("map");
    if (!mapDiv) return;

    const map = new google.maps.Map(mapDiv, {
        zoom: 10,
        center: { lat: 13.0827, lng: 80.2707 }
    });

    new google.maps.Marker({
        position: { lat: 13.0827, lng: 80.2707 },
        map: map
    });
}

console.log("script loaded");

/* =========================
   ROLE SELECTION
========================= */
function selectRole() {
    const roleElem = document.getElementById("role");
    if (!roleElem) return;

    const role = roleElem.value;
    const donorInfo = document.getElementById("donor");
    const ngoInfo = document.getElementById("ngo");
    // Admin doesn't have extra registration fields in this UI, but we clear others

    if (donorInfo) donorInfo.style.display = "none";
    if (ngoInfo) ngoInfo.style.display = "none";

    if (role === "donor" && donorInfo) {
        donorInfo.style.display = "block";
    }
    else if (role === "ngo" && ngoInfo) {
        ngoInfo.style.display = "block";
    }
}

document.addEventListener("DOMContentLoaded", selectRole);


// ================================
// NGO VIEW DONATIONS PAGE SCRIPT
// ================================
document.addEventListener("DOMContentLoaded", function () {

    const filterType = document.getElementById("filterType");
    const filterQuantity = document.getElementById("filterQuantity");
    const expiryTime = document.getElementById("expiryTime");
    const searchBox = document.getElementById("searchBox");
    const donationTable = document.getElementById("donationTable");

    if (!donationTable) return;

    const rows = donationTable.querySelectorAll("tbody tr");
    const noData = document.querySelector(".no-data-row");

    // ============================
    // Quantity Category Function
    // ============================
    function getQuantitySize(text) {
        let value = parseFloat(text);
        if (value < 5) return "small";
        if (value <= 10) return "medium";
        return "large";
    }

    // ============================
    // Expiry Time Filter Function
    // ============================
    function isExpiryMatch(time, filter) {
        if (!filter) return true;

        let now = new Date();
        let expiry = new Date();

        // Handle both formats: "14:30" and "2:30 PM"
        if (time.includes("AM") || time.includes("PM")) {
            let parts = time.split(" ");
            let [h, m] = parts[0].split(":");
            let period = parts[1];

            h = parseInt(h);
            m = parseInt(m);

            if (period === "PM" && h !== 12) h += 12;
            if (period === "AM" && h === 12) h = 0;

            expiry.setHours(h, m, 0, 0);
        } else {
            let [h, m] = time.split(":");
            expiry.setHours(parseInt(h), parseInt(m), 0, 0);
        }

        let diff = (expiry - now) / (1000 * 60); // minutes

        // Ignore already expired food
        if (diff < 0) return false;

        if (filter === "soon") return diff <= 120;
        if (filter === "later") return diff > 120;

        return true;
    }

    // ============================
    // Filter Function
    // ============================
    function filterTable() {

        let visible = false;

        rows.forEach(row => {

            if (row.classList.contains("no-data-row")) return;

            let food = row.cells[1].innerText.toLowerCase();
            let category = row.cells[2].innerText.toLowerCase().trim();
            let quantity = row.cells[3].innerText;
            let location = row.cells[4].innerText.toLowerCase();
            let expiry = row.cells[5].innerText.trim();

            // FIXED: using includes instead of strict match
            let typeMatch = !filterType.value ||
                category.includes(filterType.value.toLowerCase());

            let quantityMatch = !filterQuantity.value ||
                getQuantitySize(quantity) === filterQuantity.value;

            let expiryMatch = isExpiryMatch(expiry, expiryTime.value);

            let searchMatch = !searchBox.value ||
                food.includes(searchBox.value.toLowerCase()) ||
                location.includes(searchBox.value.toLowerCase());

            if (typeMatch && quantityMatch && expiryMatch && searchMatch) {
                row.style.display = "";
                visible = true;
            } else {
                row.style.display = "none";
            }

        });

        if (noData) {
            noData.style.display = visible ? "none" : "";
        }
    }

    // ============================
    // Event Listeners
    // ============================
    if (filterType) filterType.onchange = filterTable;
    if (filterQuantity) filterQuantity.onchange = filterTable;
    if (expiryTime) expiryTime.onchange = filterTable;
    if (searchBox) searchBox.onkeyup = filterTable;

    // ============================
    // VIEW BUTTON CLICK HANDLER
    // ============================
    document.addEventListener("click", function (e) {

        if (!e.target.classList.contains("View-btn")) return;

        let row = e.target.closest("tr");

        let status = row.cells[7].innerText.trim().toLowerCase();

        if (status === "picked up") {
            alert("This food has already been picked up");
            return;
        }

        if (status === "completed") {
            alert("This order is already completed");
            return;
        }

        if (status === "cancelled") {
            alert("This donation has been cancelled");
            return;
        }

        const donorContacts = {
            "1": "9876543210",
            "2": "9123456780",
            "3": "9988776655",
            "4": "9012345678",
            "5": "9090909090"
        };

        let id = row.cells[0].innerText;

        let data = {
            id: id,
            food: row.cells[1].innerText,
            category: row.cells[2].innerText,
            quantity: row.cells[3].innerText,
            location: row.cells[4].innerText,
            expiry: row.cells[5].innerText,
            donor: row.cells[6].innerText,
            status: status,
            phone: donorContacts[id] || ""
        };

        localStorage.setItem("selectedDonation", JSON.stringify(data));

        window.location.href = "acceptDonation";
    });

});
/* =========================
   GLOBAL BUTTON HANDLER
========================= */
document.addEventListener("click", function(e) {

    /* VIEW BUTTON */
    if (e.target.classList.contains("View-btn")) {

        const row = e.target.closest("tr");
        if (!row) return;

        const status = row.cells[7].innerText.trim();

        if (status === "Picked Up") {
            alert("Food already picked up");
            return;
        }

        const data = {
            id: row.cells[0].innerText,
            food: row.cells[1].innerText,
            category: row.cells[2].innerText,
            quantity: row.cells[3].innerText,
            location: row.cells[4].innerText,
            expiry: row.cells[5].innerText,
            donor: row.cells[6].innerText,
            status: status
        };

        localStorage.setItem("selectedDonation", JSON.stringify(data));
        window.location.href = "acceptDonation";
    }

    /* BLOCK BUTTON */
    if (e.target.classList.contains("block-btn")) {

        const row = e.target.closest("tr");
        const userName = row.cells[1].innerText;
        const statusCell = row.cells[7];

        if (confirm("Block " + userName + "?")) {

            statusCell.innerText = "Blocked";
            statusCell.classList.add("text-danger");

            e.target.disabled = true;
            e.target.innerText = "Blocked";
        }
    }

});


/* =========================
   ACCEPT DONATION PAGE
========================= */
document.addEventListener("DOMContentLoaded", () => {

    const storedData = localStorage.getItem("selectedDonation");

    if (storedData) {

        const data = JSON.parse(storedData);

        if (document.getElementById("foodName")) {

            document.getElementById("foodName").value = data.food;
            document.getElementById("foodType").value = data.category;
            document.getElementById("quantity").value = data.quantity;
            document.getElementById("location").value = data.location;
            document.getElementById("expiry").value = data.expiry;
            document.getElementById("donor").value = data.donor;

        }
    }

});

// ==============================
// PICKUP PAGE SCRIPT (UPDATED)
// ==============================
document.addEventListener("DOMContentLoaded", function () {

    // check if pickup page exists
    const donationIdElement = document.getElementById("donationId");
    if (!donationIdElement) return;

    // ==============================
    // VERIFY OTP (Backend Call)
    // ==============================
    const verifyBtn = document.getElementById("verifyOTP");

    if (verifyBtn) {
        verifyBtn.onclick = function () {

            let donationId = donationIdElement.value;
            let otp = document.getElementById("pickupOTP").value;

            fetch("/ngo/verify-otp", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: "donationId=" + donationId + "&otp=" + otp
            })
            .then(res => res.text())
            .then(data => {
                if (data === "SUCCESS") {
                    alert("✅ OTP Verified Successfully");
                } else {
                    alert("❌ Invalid OTP");
                }
            })
            .catch(err => {
                console.error(err);
                alert("Error verifying OTP");
            });

        };
    }

    // ==============================
    // CONFIRM PICKUP (Backend Submit)
    // ==============================
    const confirmBtn = document.getElementById("confirmPickup");

    if (confirmBtn) {
        confirmBtn.onclick = function () {

            let pickupTime = document.getElementById("actualPickupTime").value;
            let volunteer = document.getElementById("volunteerName").value;

            if (!pickupTime || !volunteer) {
                alert("Please fill required fields");
                return;
            }

            const form = document.getElementById("pickupForm");

            // ✅ FORCE correct URL
            form.action = "/confirm-pickup";

            form.submit();
        };
    }

}); // ✅ THIS WAS MISSING
/* =========================
   DASHBOARD CHARTS
========================= */
document.addEventListener("DOMContentLoaded", () => {

    const months = window.months || [];
    const counts = window.counts || [];

    const statusLabels = window.statusLabels || [];
    const statusCounts = window.statusCounts || [];

    console.log("Months:", months);
    console.log("Counts:", counts);
    console.log("Status:", statusLabels, statusCounts);

    // 📊 BAR CHART
    if (document.getElementById("donationChart") && months.length > 0) {

        new Chart(document.getElementById("donationChart"), {
            type: "bar",
            data: {
                labels: months,
                datasets: [{
                    label: "Donations",
                    data: counts,
                    backgroundColor: "#198754"
                }]
            }
        });

    }

    // 🥧 PIE CHART
    if (document.getElementById("statusChart") && statusLabels.length > 0) {

        new Chart(document.getElementById("statusChart"), {
            type: "pie",
            data: {
                labels: statusLabels,
                datasets: [{
                    data: statusCounts,
                    backgroundColor: ["#ffc107", "#0d6efd", "#198754", "#dc3545"]
                }]
            }
        });

    }

});


// ================================
// DONOR - MANAGE DONATIONS FILTER
document.addEventListener("DOMContentLoaded", function () {

    const table = document.getElementById("donationTable");
    if (!table) return;

    const statusFilter = document.getElementById("filterStatus");
    const typeFilter = document.getElementById("filterType");
    const dateFilter = document.getElementById("filterDate");
    const searchBox = document.getElementById("searchBox");

    const rows = table.querySelectorAll("tbody tr");

    // ✅ Normalize text (handles spaces + underscores)
    function normalize(text) {
        return text.toLowerCase().replace(/\s|_/g, '');
    }

    function filterTable() {

        const statusValue = normalize(statusFilter.value);
        const typeValue = normalize(typeFilter.value);
        const dateValue = dateFilter.value;
        const searchValue = searchBox.value.toLowerCase();

        const today = new Date();
        const startOfWeek = new Date(today);
        startOfWeek.setDate(today.getDate() - today.getDay());

        let visible = 0;

        rows.forEach(row => {

            if (row.classList.contains("no-data-row")) return;

            const food = row.cells[1].innerText.toLowerCase();
            const category = normalize(row.cells[2].innerText);
            const location = row.cells[4].innerText.toLowerCase();
            const status = normalize(row.cells[6].innerText);

            const preparedDate = new Date(row.dataset.preparedDate);

            // ---------- CATEGORY FILTER (FIXED) ----------
            let typeMatch = true;
            if (typeValue) {
                typeMatch = category === typeValue;  // ✅ exact match (no veg/non-veg mix)
            }

            // ---------- STATUS FILTER (FIXED) ----------
            const statusMatch = !statusValue || status === statusValue;

            // ---------- SEARCH FILTER ----------
            const searchMatch =
                !searchValue ||
                food.includes(searchValue) ||
                location.includes(searchValue);

            // ---------- DATE FILTER ----------
            let dateMatch = true;

            if (dateValue === "today") {
                dateMatch = preparedDate.toDateString() === today.toDateString();
            }

            if (dateValue === "thisWeek") {
                dateMatch = preparedDate >= startOfWeek && preparedDate <= today;
            }

            // ---------- FINAL CHECK ----------
            if (typeMatch && statusMatch && searchMatch && dateMatch) {
                row.style.display = "";
                visible++;
            } else {
                row.style.display = "none";
            }

        });

        // ---------- NO DATA ROW ----------
        const noDataRow = document.querySelector(".no-data-row");
        if (noDataRow) {
            noDataRow.style.display = visible === 0 ? "" : "none";
        }
    }

    // ---------- EVENT LISTENERS ----------
    statusFilter.addEventListener("change", filterTable);
    typeFilter.addEventListener("change", filterTable);
    dateFilter.addEventListener("change", filterTable);
    searchBox.addEventListener("keyup", filterTable);

});



// ===============================
// ADMIN - MANAGE  DONATIONS
// ===============================
document.addEventListener("DOMContentLoaded", function() {

    const searchBox = document.getElementById("searchBox");
    const statusFilter = document.getElementById("statusFilter");
    const cancelModal = document.getElementById("cancelModal");

    // stop script if this page doesn't have the table
    if (!searchBox || !statusFilter) return;

    const tableRows = document.querySelectorAll("tbody tr");
    const cancelButtons = document.querySelectorAll(".cancel-btn");
    const confirmCancel = document.getElementById("confirmCancel");
    const cancelAlert = document.getElementById("cancelAlert");

    let selectedRow = null;

    // ===============================
    // CANCEL BUTTON CLICK
    // ===============================
    cancelButtons.forEach(button => {

        button.addEventListener("click", function() {

            selectedRow = this.closest("tr");

        });

    });

    // ===============================
    // CONFIRM CANCEL
    // ===============================
    if (confirmCancel) {

        confirmCancel.addEventListener("click", function() {

            if (selectedRow) {

                const statusCell = selectedRow.querySelector(".status-cell span");

                if (statusCell) {
                    statusCell.innerText = "Cancelled";
                }

            }

            if (cancelModal) {
                const modal = bootstrap.Modal.getInstance(cancelModal);
                if (modal) modal.hide();
            }

            if (cancelAlert) {
                cancelAlert.classList.remove("d-none");
                cancelAlert.classList.add("show");
            }

        });

    }

    // ===============================
    // TABLE FILTER FUNCTION
    // ===============================
    function filterTable() {

        const searchText = searchBox.value.toLowerCase();
        const selectedStatus = statusFilter.value.toLowerCase();

        tableRows.forEach(row => {

            const food = row.cells[1].innerText.toLowerCase();
            const donor = row.cells[2].innerText.toLowerCase();
            const ngo = row.cells[3].innerText.toLowerCase();
            const status = row.cells[8].innerText.toLowerCase();

            const matchesSearch =
                food.includes(searchText) ||
                donor.includes(searchText) ||
                ngo.includes(searchText);

            const matchesStatus =
                selectedStatus === "" || status === selectedStatus;

            row.style.display = (matchesSearch && matchesStatus) ? "" : "none";

        });

    }

    // ===============================
    // FILTER EVENTS
    // ===============================
    searchBox.addEventListener("keyup", filterTable);
    statusFilter.addEventListener("change", filterTable);

});


// ===============================
// ADMIN MANAGE USERS SCRIPT
// ===============================
document.addEventListener("DOMContentLoaded", function() {

    const searchBox = document.getElementById("searchBox");
    const roleFilter = document.getElementById("filterRole");
    const statusFilter = document.getElementById("filterStatus");

    // Stop script if not on Manage Users page
    if (!searchBox || !roleFilter || !statusFilter) return;

    const tableRows = document.querySelectorAll("tbody tr:not(.no-data-row)");
    const noDataRow = document.querySelector(".no-data-row");
    const blockButtons = document.querySelectorAll(".block-btn");

    // FILTER TABLE FUNCTION
 
    function filterTable() {

        const searchText = searchBox.value.toLowerCase();
        const selectedRole = roleFilter.value.toLowerCase();
        const selectedStatus = statusFilter.value.toLowerCase();

        let visibleCount = 0;

        tableRows.forEach(row => {

            const name = row.cells[1]?.innerText.toLowerCase() || "";
            const role = row.cells[2]?.innerText.toLowerCase() || "";
            const email = row.cells[3]?.innerText.toLowerCase() || "";
            const phone = row.cells[4]?.innerText.toLowerCase() || "";
            const status = row.cells[7]?.innerText.toLowerCase() || "";

            const matchesSearch =
                name.includes(searchText) ||
                email.includes(searchText) ||
                phone.includes(searchText);

            const matchesRole =
                selectedRole === "" || role === selectedRole;

            const matchesStatus =
                selectedStatus === "" || status === selectedStatus;

            if (matchesSearch && matchesRole && matchesStatus) {
                row.style.display = "";
                visibleCount++;
            } else {
                row.style.display = "none";
            }

        });

        // Show "No Data Found" row
        if (noDataRow) {
            noDataRow.style.display = visibleCount === 0 ? "" : "none";
        }

    }

   
    // FILTER EVENTS
   
    searchBox.addEventListener("keyup", filterTable);
    roleFilter.addEventListener("change", filterTable);
    statusFilter.addEventListener("change", filterTable);


    
    // BLOCK USER FUNCTION
	
    blockButtons.forEach(button => {

        button.addEventListener("click", function() {

            const row = this.closest("tr");

            if (!row) return;

            const userName = row.cells[1]?.innerText || "User";
            const userStatusCell = row.cells[7];

            if (confirm(`Are you sure you want to block ${userName}?`)) {

                if (userStatusCell) {
                    userStatusCell.innerText = "Blocked";
                    userStatusCell.classList.add("text-danger");
                }

                this.disabled = true;
                this.innerText = "Blocked";

                this.classList.remove("btn-outline-danger");
                this.classList.add("btn-secondary");

            }

        });

    });

});

// ================= PROFILE PAGE SCRIPT =================
document.addEventListener("DOMContentLoaded", function() {

    const editBtn = document.getElementById("editBtn");
    const saveBtn = document.getElementById("saveBtn");
    const cancelBtn = document.getElementById("cancelBtn");
    const editableFields = document.querySelectorAll(".editable");
    const form = document.getElementById("profileForm");

    // ✅ Prevent errors if elements are not present on other pages
    if (!editBtn || !saveBtn || !cancelBtn || !form) return;

    let originalValues = [];

    // EDIT BUTTON
    editBtn.addEventListener("click", function() {
        originalValues = [];

        editableFields.forEach((field, index) => {
            originalValues[index] = field.value;
            field.removeAttribute("readonly");
        });

        editBtn.classList.add("d-none");
        saveBtn.classList.remove("d-none");
        cancelBtn.classList.remove("d-none");
    });

    // CANCEL BUTTON
    cancelBtn.addEventListener("click", function() {

        editableFields.forEach((field, index) => {
            field.value = originalValues[index];
            field.setAttribute("readonly", true);
        });

        editBtn.classList.remove("d-none");
        saveBtn.classList.add("d-none");
        cancelBtn.classList.add("d-none");
    });

    // FORM SUBMIT
    form.addEventListener("submit", function() {

        editableFields.forEach(field => {
            field.setAttribute("readonly", true);
        });

        editBtn.classList.remove("d-none");
        saveBtn.classList.add("d-none");
        cancelBtn.classList.add("d-none");
    });

});