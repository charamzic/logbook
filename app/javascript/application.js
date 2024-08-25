// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import { initializeAutocomplete } from "autocomplete";

document.addEventListener("turbo:load", function () {
  initializeAutocomplete("autocomplete_origin");
  initializeAutocomplete("autocomplete_destination");
});

// tooltips refresh
document.addEventListener("turbo:load", function () {
  const tooltipTriggerList = document.querySelectorAll(
    '[data-bs-toggle="tooltip"]',
  );
  const tooltipList = [...tooltipTriggerList].map(
    (tooltipTriggerEl) => new bootstrap.Tooltip(tooltipTriggerEl),
  );
});

// distance value update
document.addEventListener("turbo:load", function () {
  const roundTripCheckbox = document.getElementById("round_trip_checkbox");
  const distanceField = document.getElementById("distance_result");

  if (roundTripCheckbox && distanceField) {
    roundTripCheckbox.addEventListener("change", function () {
      let distance = parseFloat(distanceField.value) || 0;

      if (roundTripCheckbox.checked) {
        distance *= 2;
      } else {
        distance /= 2;
      }

      distanceField.value = distance + " km";
    });
  }
});
