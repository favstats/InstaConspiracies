


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
  
# output <- tryCatch(
#   {
# 
#     with_timeout(source_python("scripter.py"),
#                  60*60*5.5,
#                  60*60*5.5)
# 
#   },
#   error=function(cond) {
#     message("Here's the original error message:")
#     message(cond)
#     # Choose a return value in case of error
#     return(data.frame(perc = NA))
#   }
# )

# flatten1 <- function(x) {
#   y <- list()
#   rapply(x, function(x) y <<- c(y,x))
#   y
# }
# 
# Reduce(output)
# 
# rbind(flatten1(output))
# 
# f <- function(l) {
#   if (!is.list(l)) return(l)
#   do.call('rbind', lapply(l, function(x) `length<-`(x, max(lengths(l)))))
# }

# print(paste0("Dataset has so many rows: ", length(output)))
