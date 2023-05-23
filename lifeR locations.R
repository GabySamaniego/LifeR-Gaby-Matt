# Trying lifeR for bird watching
# Gaby and Matt
# gaby@savehummingbirds,org
# 2022-05-24

# Install package 
install.packages("remotes")
remotes::install_github(repo = "jcoliver/lifeR", build_vignettes = TRUE)

# Load package 
library("lifeR")

vignette(topic = "lifer-intro", package = "lifeR")

# Location of the file with your year list
list_file <- "data/ebird_world_life_list.csv"

# Read the list of species into memory
user_list <- read.csv(file = list_file)

# Extract the common names of species from your list
my_species <- user_list$Common.Name

# Read in eBird API key from a text file; replace the argument to file with 
# the actual location of your eBird key file
key <- scan(file = "API.txt", what = "character")

# A single center requires vector of coordinates
locs <- c(32.470388, -111.474568)
SitesReport(centers = locs, 
            ebird_key = key, 
            species_seen = my_species)

##### Year list 2023

# Location of the file with your year list
list_file_23 <- "data/ebird_world_year_2023_list.csv"

# Read the list of species into memory
user_list_23 <- read.csv(file = list_file_23)

# Extract the common names of species from your list
my_species_23 <- user_list$Common.Name

# Read in eBird API key from a text file; replace the argument to file with 
# the actual location of your eBird key file
key <- scan(file = "API.txt", what = "character")

# A single center requires vector of coordinates
# Change these, unless you really want to go birding near McCall, Idaho
locs_23 <- c(32.470388, -111.474568)
SitesReport(centers = locs_23, 
            ebird_key = key, 
            species_seen = my_species_23)

