
# c("donaldtrump",  "tyranny",  "usa", "pray","conspiracy", "widerstand", "lies", "fearmongering", 
#   "love","health", "2020", "blm", "government",  "demonstration", "govenmentcorruption", "cdc","pandemie","masks",  "conspiracytheory", 
#   "socialdistancing", "grundgesetz", "woke", "facts", "impfpflicht", "who","covidiots","berlin","deutschland", "rockafeller", "maga", "trump", "freiheit","coronamemes", "virus", "vaccine", "pandemic", "hoax", "propaganda", "repost","humanrights", "grundrechte", "freedom","coronavirus", "covid19", "covid_19", "covid","corona", "truth", "vaccines", "lockdown", "5g", "maskenpflicht", "trump2020",  "wakeup")


library(reticulate)
library(instaloadeR)

reticulate::use_python(py_config()$python)

# py_install("instaloader", pip = T, envname = NULL)


# reticulate::source_python("https://raw.githubusercontent.com/favstats/instaloadeR/master/script.py")
# message("instaloader initialized")
# 
# insta_posts <- function(query, scope, max_posts, scrape_comments, save_path = "", since = "", until = "") {
#   
#   py$insta_posts_py(query, scope, max_posts, scrape_comments, save_path, since, until) 
# }

instaloadeR::init_instaloadeR()

instaloadeR::insta_login(save = T)

instaloadeR::insta_login(load = T)


if(!file.exists("latest_hashtag.txt")){
  cat("stopptdenwahnsinn", file = "latest_hashtag.txt", append = T, sep = "\n")
} 

if(!dir.exists("data")){
  dir.exists("data")
}

with_timeout <- function(expr, cpu, elapsed){
  expr <- substitute(expr)
  envir <- parent.frame()
  setTimeLimit(cpu = cpu, elapsed = elapsed, transient = TRUE)
  on.exit(setTimeLimit(cpu = Inf, elapsed = Inf, transient = FALSE))
  eval(expr, envir = envir)
}

hashies <- c("plandemic", "plannedemic", 
             "stop5grollout", "stop5g", "stop5gflorida", "stop5gglobal", "freedomkeepers", 
             "stop5gaustralia", "stop5guk", "stop5gitalia", "stop5gcalifornia", 
             "stop5ginternational", "stop5gtowers", "stop5gespaña", "stop5gbarcelona", 
             "stop5gusa", "stop5gcentralcoast", "stop5gpennsylvania", "stop5gtoday", 
             "stop5ghawaii", "stop5gitaly", "stop5gworldwide", "stop5geverywhere", 
             "governmentlies", "fuckbillgates", "informedconsent", "billgatesisevil", 
             "scamdemic", "vaccineinjury", "arrestbillgates", "markofthebeast", 
             "parentalrights", "fearmongering", "firefauci", "readtheinsert", 
             "savethechildren", "saveourchildren", "projectbluebeam", "mindcontrol", 
             "cabal", "event201", "id2020", "healthfreedom", "plandemic2020", 
             "coronalies", "medicalrights", "saynotobillgates", "wakeupsheeple", 
             "reopenusa", "populationcontrol", "idonotconsent", "believemothers", 
             "coronafake", "givegatesnochance", "medicalfreedomofchoice", 
             "gibgateskeinechance", "widerstand2020", "protruth", "fucknwo", 
             "fakevirus", "attilahildmann", "medicalexemption", "coronalüge", 
             "bodoschiffmann", "vaccinationchoice", "stopbillgates", "davidicke", 
             "wedonotconsent", "betweenmeandmydoctor", "truther", "outofshadows", 
             "hollyweirdisevil", "hisnamewassethrich", "andrenochrome", "georgesoros", 
             "wherewegoonewegoall", "wearethenewsnow", "filmyourhospital", 
             "qanonarmy", "qarmy", "thestormisuponus", "darktolight", "weareq", 
             "pizzagate", "nonewnormal", "rfidchip", "newworldorder", "agenda21", 
             "billgates", "nwo", "fakenews", "illuminati", "quarantine", "covid1984", 
             "deepstate", "depopulation", "mkultra", "agenda2030", "thegreatawakening", 
             "chemtrails", "qanon", "pedogate", "epsteindidntkillhimself", 
             "newworldorderagenda", "sheeple", "wwg1wga", "nasalies", "greatawakening", 
             "endtimes", "rothschild", "truthseeker", "falseflag", "bilderberggroup", 
             "querdenken", "zionistagenda", "plandemie", "fallofthecabal", 
             "devilworshippers", "theyarekillingus", "thegoyimknow", "falseflagoperations", 
             "satanicgovernments", "querdenken711", "querdenker", "fakepandemie", 
             "depopulationagenda", "adrenochrome", "redpill", "maskenzwang", 
             "obamagate", "plandemia", "covidhoax", "impfzwang", "nomask", 
             "noalnuevoordenmundial", "kenfm", "endthelockdown", "q", "antivax", 
             "medialies", "zwangsimpfung", "5gdangers", "reopenamerica", "scamdemic2020", 
             "nomaskneeded", "saynoto5gworldwide", "saynotomandatoryvaccinations", 
             "saynotomasks", "covidlies", "haarp", "covid19fake", "virusesarenotcontagious", 
             "elonmusk5gsatellites", "fuckmasks", "oneworldgovernment", "psychologicalwarfare", 
             "billgatesisamurderer", "billgatesrfid", "agenda21depopulationplan", 
             "covidgate", "no5g", "billgatescoronavirus", "60ghz", "wwg1wgaworldwide", 
             "thebaqery", "billgatesvaccine", "wuhanvirus", "thevirusscareisfake", 
             "antivaxx", "medicalfreedomactivist", "hugsovermasks", "falldemie", 
             "911insidejob", "endthelockdownnow", "stopwho", "globalhealthsecurityagenda", 
             "pedovore", "prisonplanet", "redpilled", "coronavirusisfake", 
             "antivaccine", "plamdemic", "secretsocieties", "losvirusnoexisten", 
             "killilluminati", "fakepandemic", "covid19hoax", "pedowood", 
             "coronavirushoax", "coronafraude", "londonrealarmy", "stopptdenwahnsinn"
)

latest_hashtag <- readLines("latest_hashtag.txt")[1]

if(latest_hashtag == hashies[length(hashies)]){
  hashies <- "plandemic"
  
} else {
  hashies <- hashies[which(hashies==latest_hashtag)+1] 
}



print(paste0("Getting #", hashies))

cat(hashies, file = "latest_hashtag.txt")

# get_em <- function(hashtag) {
  
output <- tryCatch(
  {

    with_timeout(insta_posts(query = hashies,
                             scope = "hashtag",
                             max_posts = 10,
                             scrape_comments = F,
                             save_path = paste0("data/", hashies, ".csv")),
                 60*60*5.5,
                 60*60*5.5)

  },
  error=function(cond) {
    message("Here's the original error message:")
    message(cond)
    # Choose a return value in case of error
    return(data.frame(perc = NA))
  }
)

print(paste0("Dataset has so many rows: ", nrow(output)))
