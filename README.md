#Tex Breaking Example

This repo demonstrates a real life usage of the **qdapTools** function `loc_split`.  We create a fake .tex document and then use `loc_split` to break into sections.

## Load Packages


```r
library(qdap); library(qdapTools); library(knitr)
```

## Create Data Set

```r
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
```

```
  [1] "\\section{Call Would Is Call We}"                                  
  [2] ""                                                                  
  [3] "\\subsection{But Great Make Her Big}"                              
  [4] ""                                                                  
  [5] "As before this place good an turn need up world show give still"   
  [6] "his did away most each letter which or go in. With I him about and"
  [7] "from as world in too because have boy what right read a tell its"  
  [8] "which new like my up land| Call and part get is. I with that these"
  [9] "word like which their a most some some get hand what these may."   
 [10] "These think see spell. End picture been year end men long old have"
 [11] "before oil must. Such will name with one three. Even number form"  
 [12] "men it play has right sound sound them little down write this"     
 [13] "change put name back an line! More new end what at her want up"    
 [14] "spell up water first many off other found America point will use"  
 [15] "sentence see then. Take will change more new her its house you"    
 [16] "part form my into with him could."                                 
 [17] ""                                                                  
 [18] "\\subsection{Away Such His Make}"                                  
 [19] ""                                                                  
 [20] "Think two say you different spell made for air one he know know"   
 [21] "mean. Now know great this place| But and then time. Or just"       
 [22] "sentence a we on must like home| Your. Time at off been hand are"  
 [23] "before need form they sound. Now. House form down way not live"    
 [24] "part had live on year like play men will there made word found"    
 [25] "read turn other year many all most on. A if sentence from into"    
 [26] "went why went have water oil for had ask get long good be sound."  
 [27] "Still change follow point after."                                  
 [28] "\\section{Move that even Go}"                                      
 [29] ""                                                                  
 [30] "\\subsection{Mean Found Most Two}"                                 
 [31] ""                                                                  
 [32] "Air about which. Sentence do use. Who large oil change word place" 
 [33] "oil call oil our end answer end time part but why animal look now."
 [34] "Letter day what page and study new two two down some have that."   
 [35] "This only study follow are still house for some such for how had"  
 [36] "men give! Hand form than such should his very ask look these call" 
 [37] "take. From men think. Point word been kind large first kind do"    
 [38] "more boy even its mean which his these year America spell right?"  
 [39] "Call down change day to or the make year part and she where large" 
 [40] "who will live a must land when was study in. Would page name but"  
 [41] "that try line two part be time away down about way still|"         
 [42] ""                                                                  
 [43] "\\subsection{Learn Two like Such Him}"                             
 [44] ""                                                                  
 [45] "At read water number so are if these name say or water a much"     
 [46] "again me write be letter set their made name only even not. Show"  
 [47] "not would but went our part. With are back if made at help say"    
 [48] "through they have most find your to boy how how what three find"   
 [49] "still came go also. Think place him after before think set know"   
 [50] "does find tell same learn letter his move each it had water learn."
 [51] "That help into like two by up be does work may now kind two mother"
 [52] "part sound why study world. Work up look them now these get part"  
 [53] "way old then animal her tell live or before work them some why all"
 [54] "air our. Put such around he most mean! America has little number"  
 [55] "about oil where their? On then said time house much mean these on" 
 [56] "think change a America my our find went! Sentence page big line"   
 [57] "your if I where are water learn sound it in each her many make its"
 [58] "all not."                                                          
 [59] "\\section{New Help for She}"                                       
 [60] ""                                                                  
 [61] "\\subsection{Him Who Work like Move}"                              
 [62] ""                                                                  
 [63] "Man us little still way want point I men each turn made. Animal"   
 [64] "turn been think men does should say. Different answer no write but"
 [65] "too use from would over still first. They put if. Great three an." 
 [66] "People too from ask different how back find great that study find" 
 [67] "kind about a about its did such me our them many look mean two."   
 [68] "Same see. Thing follow will. Move why air us try home the number"  
 [69] "large call may sentence just my found same is in good. How my kind"
 [70] "came right can need even."                                         
 [71] ""                                                                  
 [72] "\\subsection{Should in Have Just Through}"                         
 [73] ""                                                                  
 [74] "In see been us point letter which people day end they should up"   
 [75] "end say very me. Change land so very and their same found set did" 
 [76] "when after look also write as show year much. Down hand live like" 
 [77] "your them sentence not still no them house an from said go not"    
 [78] "follow here more answer. Well around great again number want work" 
 [79] "time than who want ask| You now change give look house may man of" 
 [80] "through even follow three did has was too change with! Good he"    
 [81] "move for she back another again put through it his put home page"  
 [82] "new new then water like had most how go. Into study go each will"  
 [83] "where tell more your are you we mean of same has year. Them any of"
 [84] "should any day number at them other move kind than learn a does"   
 [85] "must tell spell think form more. May live their men into there"    
 [86] "like may she learn her give them about his these he of after"      
 [87] "around no us. Hand even answer three get animal year most little"  
 [88] "know also of over|"                                                
 [89] ""                                                                  
 [90] "\\print{References}"                                               
 [91] ""                                                                  
 [92] "Rinker, T. W. (2013). qdap: Quantitative Discourse Analysis"       
 [93] "  Package. version 2.2.1. University at Buffalo. Buffalo, New"     
 [94] "  York. http://github.com/trinker/qdap"                            
 [95] ""                                                                  
 [96] "Rinker, T. W. (2014). qdapTools: Tools to Accompany the qdap"      
 [97] "  Package. version 1.0.4. University at Buffalo. Buffalo, New"     
 [98] "  York. http://github.com/trinker/qdapTools"                       
 [99] ""                                                                  
[100] "David James and Kurt Hornik (2014). chron: Chronological Objects"  
[101] "  which Can Handle Dates and Times. R package version 2.3-45."     
[102] ""                                                                  
[103] "M Dowle, T Short, S Lianoglou, A Srinivasan with contributions"    
[104] "  from R Saporta and E Antonyan (2014). data.table: Extension of"  
[105] "  data.frame. R package version 1.9.4."                            
[106] "  http://CRAN.R-project.org/package=data.table"                    
[107] ""                                                                  
[108] "Duncan Temple Lang (2014). RCurl: General network (HTTP/FTP/...)"  
[109] "  client interface for R. R package version 1.95-4.3."             
[110] "  http://CRAN.R-project.org/package=RCurl"                         
```

## Split by Sections

```r
loc_split(tex_doc, tail(grep("section\\{|print\\{", tex_doc), -1))
```

```
[[1]]
[1] "\\section{Call Would Is Call We}" ""                                

[[2]]
 [1] "\\subsection{But Great Make Her Big}"                              
 [2] ""                                                                  
 [3] "As before this place good an turn need up world show give still"   
 [4] "his did away most each letter which or go in. With I him about and"
 [5] "from as world in too because have boy what right read a tell its"  
 [6] "which new like my up land| Call and part get is. I with that these"
 [7] "word like which their a most some some get hand what these may."   
 [8] "These think see spell. End picture been year end men long old have"
 [9] "before oil must. Such will name with one three. Even number form"  
[10] "men it play has right sound sound them little down write this"     
[11] "change put name back an line! More new end what at her want up"    
[12] "spell up water first many off other found America point will use"  
[13] "sentence see then. Take will change more new her its house you"    
[14] "part form my into with him could."                                 
[15] ""                                                                  

[[3]]
 [1] "\\subsection{Away Such His Make}"                                
 [2] ""                                                                
 [3] "Think two say you different spell made for air one he know know" 
 [4] "mean. Now know great this place| But and then time. Or just"     
 [5] "sentence a we on must like home| Your. Time at off been hand are"
 [6] "before need form they sound. Now. House form down way not live"  
 [7] "part had live on year like play men will there made word found"  
 [8] "read turn other year many all most on. A if sentence from into"  
 [9] "went why went have water oil for had ask get long good be sound."
[10] "Still change follow point after."                                

[[4]]
[1] "\\section{Move that even Go}" ""                            

[[5]]
 [1] "\\subsection{Mean Found Most Two}"                                 
 [2] ""                                                                  
 [3] "Air about which. Sentence do use. Who large oil change word place" 
 [4] "oil call oil our end answer end time part but why animal look now."
 [5] "Letter day what page and study new two two down some have that."   
 [6] "This only study follow are still house for some such for how had"  
 [7] "men give! Hand form than such should his very ask look these call" 
 [8] "take. From men think. Point word been kind large first kind do"    
 [9] "more boy even its mean which his these year America spell right?"  
[10] "Call down change day to or the make year part and she where large" 
[11] "who will live a must land when was study in. Would page name but"  
[12] "that try line two part be time away down about way still|"         
[13] ""                                                                  

[[6]]
 [1] "\\subsection{Learn Two like Such Him}"                             
 [2] ""                                                                  
 [3] "At read water number so are if these name say or water a much"     
 [4] "again me write be letter set their made name only even not. Show"  
 [5] "not would but went our part. With are back if made at help say"    
 [6] "through they have most find your to boy how how what three find"   
 [7] "still came go also. Think place him after before think set know"   
 [8] "does find tell same learn letter his move each it had water learn."
 [9] "That help into like two by up be does work may now kind two mother"
[10] "part sound why study world. Work up look them now these get part"  
[11] "way old then animal her tell live or before work them some why all"
[12] "air our. Put such around he most mean! America has little number"  
[13] "about oil where their? On then said time house much mean these on" 
[14] "think change a America my our find went! Sentence page big line"   
[15] "your if I where are water learn sound it in each her many make its"
[16] "all not."                                                          

[[7]]
[1] "\\section{New Help for She}" ""                           

[[8]]
 [1] "\\subsection{Him Who Work like Move}"                              
 [2] ""                                                                  
 [3] "Man us little still way want point I men each turn made. Animal"   
 [4] "turn been think men does should say. Different answer no write but"
 [5] "too use from would over still first. They put if. Great three an." 
 [6] "People too from ask different how back find great that study find" 
 [7] "kind about a about its did such me our them many look mean two."   
 [8] "Same see. Thing follow will. Move why air us try home the number"  
 [9] "large call may sentence just my found same is in good. How my kind"
[10] "came right can need even."                                         
[11] ""                                                                  

[[9]]
 [1] "\\subsection{Should in Have Just Through}"                         
 [2] ""                                                                  
 [3] "In see been us point letter which people day end they should up"   
 [4] "end say very me. Change land so very and their same found set did" 
 [5] "when after look also write as show year much. Down hand live like" 
 [6] "your them sentence not still no them house an from said go not"    
 [7] "follow here more answer. Well around great again number want work" 
 [8] "time than who want ask| You now change give look house may man of" 
 [9] "through even follow three did has was too change with! Good he"    
[10] "move for she back another again put through it his put home page"  
[11] "new new then water like had most how go. Into study go each will"  
[12] "where tell more your are you we mean of same has year. Them any of"
[13] "should any day number at them other move kind than learn a does"   
[14] "must tell spell think form more. May live their men into there"    
[15] "like may she learn her give them about his these he of after"      
[16] "around no us. Hand even answer three get animal year most little"  
[17] "know also of over|"                                                
[18] ""                                                                  

[[10]]
 [1] "\\print{References}"                                             
 [2] ""                                                                
 [3] "Rinker, T. W. (2013). qdap: Quantitative Discourse Analysis"     
 [4] "  Package. version 2.2.1. University at Buffalo. Buffalo, New"   
 [5] "  York. http://github.com/trinker/qdap"                          
 [6] ""                                                                
 [7] "Rinker, T. W. (2014). qdapTools: Tools to Accompany the qdap"    
 [8] "  Package. version 1.0.4. University at Buffalo. Buffalo, New"   
 [9] "  York. http://github.com/trinker/qdapTools"                     
[10] ""                                                                
[11] "David James and Kurt Hornik (2014). chron: Chronological Objects"
[12] "  which Can Handle Dates and Times. R package version 2.3-45."   
[13] ""                                                                
[14] "M Dowle, T Short, S Lianoglou, A Srinivasan with contributions"  
[15] "  from R Saporta and E Antonyan (2014). data.table: Extension of"
[16] "  data.frame. R package version 1.9.4."                          
[17] "  http://CRAN.R-project.org/package=data.table"                  
[18] ""                                                                
[19] "Duncan Temple Lang (2014). RCurl: General network (HTTP/FTP/...)"
[20] "  client interface for R. R package version 1.95-4.3."           
[21] "  http://CRAN.R-project.org/package=RCurl"                       
```

```r
loc_split(tex_doc, tail(grep("\\\\section\\{|print\\{", tex_doc), -1))
```

```
[[1]]
 [1] "\\section{Call Would Is Call We}"                                  
 [2] ""                                                                  
 [3] "\\subsection{But Great Make Her Big}"                              
 [4] ""                                                                  
 [5] "As before this place good an turn need up world show give still"   
 [6] "his did away most each letter which or go in. With I him about and"
 [7] "from as world in too because have boy what right read a tell its"  
 [8] "which new like my up land| Call and part get is. I with that these"
 [9] "word like which their a most some some get hand what these may."   
[10] "These think see spell. End picture been year end men long old have"
[11] "before oil must. Such will name with one three. Even number form"  
[12] "men it play has right sound sound them little down write this"     
[13] "change put name back an line! More new end what at her want up"    
[14] "spell up water first many off other found America point will use"  
[15] "sentence see then. Take will change more new her its house you"    
[16] "part form my into with him could."                                 
[17] ""                                                                  
[18] "\\subsection{Away Such His Make}"                                  
[19] ""                                                                  
[20] "Think two say you different spell made for air one he know know"   
[21] "mean. Now know great this place| But and then time. Or just"       
[22] "sentence a we on must like home| Your. Time at off been hand are"  
[23] "before need form they sound. Now. House form down way not live"    
[24] "part had live on year like play men will there made word found"    
[25] "read turn other year many all most on. A if sentence from into"    
[26] "went why went have water oil for had ask get long good be sound."  
[27] "Still change follow point after."                                  

[[2]]
 [1] "\\section{Move that even Go}"                                      
 [2] ""                                                                  
 [3] "\\subsection{Mean Found Most Two}"                                 
 [4] ""                                                                  
 [5] "Air about which. Sentence do use. Who large oil change word place" 
 [6] "oil call oil our end answer end time part but why animal look now."
 [7] "Letter day what page and study new two two down some have that."   
 [8] "This only study follow are still house for some such for how had"  
 [9] "men give! Hand form than such should his very ask look these call" 
[10] "take. From men think. Point word been kind large first kind do"    
[11] "more boy even its mean which his these year America spell right?"  
[12] "Call down change day to or the make year part and she where large" 
[13] "who will live a must land when was study in. Would page name but"  
[14] "that try line two part be time away down about way still|"         
[15] ""                                                                  
[16] "\\subsection{Learn Two like Such Him}"                             
[17] ""                                                                  
[18] "At read water number so are if these name say or water a much"     
[19] "again me write be letter set their made name only even not. Show"  
[20] "not would but went our part. With are back if made at help say"    
[21] "through they have most find your to boy how how what three find"   
[22] "still came go also. Think place him after before think set know"   
[23] "does find tell same learn letter his move each it had water learn."
[24] "That help into like two by up be does work may now kind two mother"
[25] "part sound why study world. Work up look them now these get part"  
[26] "way old then animal her tell live or before work them some why all"
[27] "air our. Put such around he most mean! America has little number"  
[28] "about oil where their? On then said time house much mean these on" 
[29] "think change a America my our find went! Sentence page big line"   
[30] "your if I where are water learn sound it in each her many make its"
[31] "all not."                                                          

[[3]]
 [1] "\\section{New Help for She}"                                       
 [2] ""                                                                  
 [3] "\\subsection{Him Who Work like Move}"                              
 [4] ""                                                                  
 [5] "Man us little still way want point I men each turn made. Animal"   
 [6] "turn been think men does should say. Different answer no write but"
 [7] "too use from would over still first. They put if. Great three an." 
 [8] "People too from ask different how back find great that study find" 
 [9] "kind about a about its did such me our them many look mean two."   
[10] "Same see. Thing follow will. Move why air us try home the number"  
[11] "large call may sentence just my found same is in good. How my kind"
[12] "came right can need even."                                         
[13] ""                                                                  
[14] "\\subsection{Should in Have Just Through}"                         
[15] ""                                                                  
[16] "In see been us point letter which people day end they should up"   
[17] "end say very me. Change land so very and their same found set did" 
[18] "when after look also write as show year much. Down hand live like" 
[19] "your them sentence not still no them house an from said go not"    
[20] "follow here more answer. Well around great again number want work" 
[21] "time than who want ask| You now change give look house may man of" 
[22] "through even follow three did has was too change with! Good he"    
[23] "move for she back another again put through it his put home page"  
[24] "new new then water like had most how go. Into study go each will"  
[25] "where tell more your are you we mean of same has year. Them any of"
[26] "should any day number at them other move kind than learn a does"   
[27] "must tell spell think form more. May live their men into there"    
[28] "like may she learn her give them about his these he of after"      
[29] "around no us. Hand even answer three get animal year most little"  
[30] "know also of over|"                                                
[31] ""                                                                  

[[4]]
 [1] "\\print{References}"                                             
 [2] ""                                                                
 [3] "Rinker, T. W. (2013). qdap: Quantitative Discourse Analysis"     
 [4] "  Package. version 2.2.1. University at Buffalo. Buffalo, New"   
 [5] "  York. http://github.com/trinker/qdap"                          
 [6] ""                                                                
 [7] "Rinker, T. W. (2014). qdapTools: Tools to Accompany the qdap"    
 [8] "  Package. version 1.0.4. University at Buffalo. Buffalo, New"   
 [9] "  York. http://github.com/trinker/qdapTools"                     
[10] ""                                                                
[11] "David James and Kurt Hornik (2014). chron: Chronological Objects"
[12] "  which Can Handle Dates and Times. R package version 2.3-45."   
[13] ""                                                                
[14] "M Dowle, T Short, S Lianoglou, A Srinivasan with contributions"  
[15] "  from R Saporta and E Antonyan (2014). data.table: Extension of"
[16] "  data.frame. R package version 1.9.4."                          
[17] "  http://CRAN.R-project.org/package=data.table"                  
[18] ""                                                                
[19] "Duncan Temple Lang (2014). RCurl: General network (HTTP/FTP/...)"
[20] "  client interface for R. R package version 1.95-4.3."           
[21] "  http://CRAN.R-project.org/package=RCurl"                       
```
