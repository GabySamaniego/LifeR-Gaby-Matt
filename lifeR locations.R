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
list_file <- "data/ebird_world_year_list_GS.csv"

# Read the list of species into memory
user_list <- read.csv(file = list_file)

# Extract the common names of species from your list
my_species <- user_list$Common.Name

# Read in eBird API key from a text file; replace the argument to file with 
# the actual location of your eBird key file
key <- scan(file = "API.txt", what = "character")

# A single center requires vector of coordinates
locs <- c(31.543256, -110.747681)
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
locs_23 <- c(32.1629015, -110.7417044)
SitesReport(centers = locs_23, 
            ebird_key = key, 
            species_seen = my_species_23)

# Find different species in Matt's and Gaby's life lists

# Load data
gaby <- read.csv('data/ebird_world_life_list_GS.csv')
matt <- read.csv('data/ebird_world_life_list_MF.csv')

# Prep data
gaby <- gaby %>% 
  select(Common.Name)

matt <- matt %>% 
  select(Common.Name)

# Different species in Gaby's list
dplyr::setdiff(gaby,matt)

# Different species in Matt's list 
dplyr::setdiff(matt,gaby)
