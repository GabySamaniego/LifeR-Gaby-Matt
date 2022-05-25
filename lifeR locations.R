# Trying lifeR for birdwatching
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
list_file <- "data/ebird_na_life_list.csv"

# Read the list of species into memory
user_list <- read.csv(file = list_file)

# Extract the common names of species from your list
my_species <- SplitNames(x = user_list$Species)$Common

# Read in eBird API key from a text file; replace the argument to file with 
# the actual location of your eBird key file
key <- scan(file = "API.txt", what = "character")

# A single center requires vector of coordinates
locs <- c(32, -110)
SitesReport(centers = locs, 
            ebird_key = key, 
            species_seen = my_species)
