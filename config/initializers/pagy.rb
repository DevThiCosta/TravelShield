# Optionally override some pagy default with your own in the pagy initializer
Pagy::DEFAULT[:items] = 10 # items per page
Pagy::DEFAULT[:size]  = [1, 4, 4, 1] # nav bar links
# Better user experience handled automatically
require 'pagy/extras/overflow'
# Require a CSS framework extra in the pagy initializer (e.g. bootstrap)
require 'pagy/extras/bootstrap'
Pagy::DEFAULT[:overflow] = :last_page
