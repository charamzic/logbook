# Exploring Ruby on Rails

This is my first experience with Ruby and Rails. The application uses SQLite for local development and PostgreSQL in production.

## Purpose

This project is a simple logbook app designed to track trips.

### Application Workflow

Create vehicles used for trips.
Define fuel types to be used.
Log trips as either single or round trips.
The application integrates with the Google API to fetch distances between locations and calculates trip expenses. Note that amortization is not factored into these calculations.

### Fuel Pricing

When logging a trip, you can either override the fuel price or use the default price assigned to the specific vehicle.

### Future Enhancements

Planned features include:

* Monthly and yearly expense tracking for each vehicle and in total.
* Amortization calculations.
* Data export functionality.
* Comprehensive user validation flows, including email confirmations.
* Possible map visualizations.
* Notes and potentially pictures for each trip.

## Demo

[Application Demo is deployed here](https://logbook-production-558d.up.railway.app/)
Populated dummy data with: `admin@admin.novalid` / `admin123` credentials.
