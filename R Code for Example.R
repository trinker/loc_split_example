

library(qdap); library(qdapTools); library(knitr)



headers <- sprintf("\\section{%s}", 
    unlist(TC(random_sent(3, 5, range=c(0, 1), 
    endmark.fun = function() ""))))
subheaders <- sprintf("\\subsection{%s}", 
    unlist(TC(random_sent(6, 5, range=c(0, 1), 
    endmark.fun = function() ""))))

content <- lapply(replicate(6, unbag(random_sent())), strwrap)

ref_maker <- function(package){
    cit <- capture.output(citation(package))[-c(1:3)]
    out <- loc_split(cit, which(cit == ""))[[1]]
    out[1] <- Trim(out[1])
    c("", out)
}

packs <- c("qdap", "qdapTools", "chron", "data.table", "RCurl")
refs <- unlist(c("", "\\print{References}", lapply(packs, ref_maker)))

tex_doc <- Map(function(w, x, y, z) c(w, x, y, z), "", subheaders, "", content) %>%
    loc_split(c(3, 5)) %>%
    lapply(function(x) setNames(unlist(x), NULL)) %>%
    Map(function(x, y) c(x, y), headers, .) %>%
    setNames(NULL) %>%
    c(refs) %>%
    unlist()

tex_doc



loc_split(tex_doc, tail(grep("section\\{|print\\{", tex_doc), -1))
loc_split(tex_doc, tail(grep("\\\\section\\{|print\\{", tex_doc), -1))



## knitr::purl("README.Rmd", "example.R", documentation = 0)
## knitr::knit2html("README.Rmd", "README.md")

