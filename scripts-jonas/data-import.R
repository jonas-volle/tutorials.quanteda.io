require(quanteda)
require(readtext)


# PRE-FORMATTED FILES ----

path_data <- system.file("extdata/", package = "readtext")

dat_inaug <- read.csv(paste0(path_data, "/csv/inaugCorpus.csv"))

dat_dail <- readtext(paste0(path_data, "/tsv/dailsample.tsv"), text_field = "speech")


# MULTIPLE TEXT FILES ----

dat_udhr <- readtext(paste0(path_data, "/txt/UDHR/*"))


dat_eu <- readtext(paste0(path_data, "/txt/EU_manifestos/*.txt"),
                   docvarsfrom = "filenames", 
                   docvarnames = c("unit", "context", "year", "language", "party"),
                   dvsep = "_", 
                   encoding = "ISO-8859-1")
str(dat_eu)

# sub directories
dat_reviews <- readtext(paste0(path_data, "/txt/movie_reviews/*"), 
                        docvarsfrom = "filenames", dvsep = "_")

# json
dat_twitter <- readtext("content/data/twitter.json", source = "twitter")
head(names(dat_twitter))

# pdf
dat_udhr <- readtext(paste0(path_data, "/pdf/UDHR/*.pdf"), 
                     docvarsfrom = "filenames", 
                     docvarnames = c("document", "language"),
                     sep = "_")

# microsoft word
dat_word <- readtext(paste0(path_data, "/word/*.docx"))


# DIFFERENT ENCODINGS ----

path_temp <- tempdir()
unzip(system.file("extdata", "data_files_encodedtexts.zip", package = "readtext"), exdir = path_temp)

filename <- list.files(path_temp, "^(Indian|UDHR_).*\\.txt$")
head(filename)

# encodings
filename <- gsub(".txt$", "", filename)
encoding <- sapply(strsplit(filename, "_"), "[", 3)
head(encoding)

setdiff(encoding, iconvlist())

path_data <- system.file("extdata/", package = "readtext")
dat_txt <- readtext(paste0(path_data, "/data_files_encodedtexts.zip"), 
                    encoding = encoding,
                    docvarsfrom = "filenames", 
                    docvarnames = c("document", "language", "input_encoding"))
print(dat_txt, n = 50)