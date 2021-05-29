import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import 'flatpickr/dist/themes/material_blue.css';


const initFlatpickr = () => {
  flatpickr(".datepicker", {});
}

export { initFlatpickr };

const startDateInput = document.getElementById('booking_start_date');
const endDateInput = document.getElementById('booking_end_date');

// Check that the query selector id matches the one you put around your form.
if (startDateInput) {
const unavailableDates = JSON.parse(document.querySelector('#personalized_trainer-booking-dates').dataset.unavailable)
endDateInput.disabled = true

flatpickr(startDateInput, {
  minDate: "today",
  disable: unavailableDates,
  dateFormat: "Y-m-d",
});

console.log('im in the file')

startDateInput.addEventListener("change", (e) => {
  if (startDateInput != "") {
    endDateInput.disabled = false
  }
  flatpickr(endDateInput, {
    minDate: e.target.value,
    disable: unavailableDates,
    dateFormat: "Y-m-d"
    });
  })
};