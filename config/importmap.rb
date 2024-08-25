# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "autocomplete", to: "autocomplete.js"
pin "bootstrap" # @5.3.3
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript"
