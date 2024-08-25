export function initializeAutocomplete(inputId) {
  var input = document.getElementById(inputId);

  if (input) {
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.setComponentRestrictions({ country: ["CZ"] });

    autocomplete.addListener("place_changed", function () {
      var place = autocomplete.getPlace();

      if (!place.geometry) {
        window.alert("No details available for input: '" + place.name + "'");
        return;
      }

      window[inputId + "Place"] = place;
      calculateDistance();
    });
  } else {
    console.log(
      "Autocomplete input with ID '" +
        inputId +
        "' not found, skipping initialization.",
    );
  }
}

function calculateDistance() {
  var originPlace = window["autocomplete_originPlace"];
  var destinationPlace = window["autocomplete_destinationPlace"];

  if (originPlace && destinationPlace) {
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix(
      {
        origins: [originPlace.formatted_address],
        destinations: [destinationPlace.formatted_address],
        travelMode: "DRIVING",
        unitSystem: google.maps.UnitSystem.METRIC,
      },
      function (response, status) {
        if (status === "OK") {
          var results = response.rows[0].elements;
          var distance = results[0].distance.text;
          var duration = results[0].duration.text;

          var distanceField = document.getElementById("distance_result");
          if (distanceField) {
            distanceField.value = distance;
          }
        } else {
          console.error("Error fetching distance matrix: " + status);
        }
      },
    );
  }
}
