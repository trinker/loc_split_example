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
  [1] "\\section{For Know so Or}"                                         
  [2] ""                                                                  
  [3] "\\subsection{Mother Said Number Not}"                              
  [4] ""                                                                  
  [5] "Thing learn point in set where year her one the too said our ask"  
  [6] "of their well sentence to has give. Study them the who this them"  
  [7] "letter go were move any letter want. Much had on to like the why"  
  [8] "small like about letter help. Sentence said land live before use"  
  [9] "we our by the each we set house study such same away help sentence"
 [10] "his world? Find them now set all an who great different write air" 
 [11] "made say its. Be show land much kind to of went said must three"   
 [12] "does. I are had by big found should sentence an away but our put"  
 [13] "help old in may some in line she if mother you want try help. As"  
 [14] "them letter mother another again. America more house first big"    
 [15] "your down where give give would. Home."                            
 [16] ""                                                                  
 [17] "\\subsection{Sound Which Men Time Take}"                           
 [18] ""                                                                  
 [19] "May small an how off her great oil ask after animal has away may"  
 [20] "different now we hand which have our point tell. People can"       
 [21] "picture then take may must said different study here show you up"  
 [22] "be more the other. Long would did other change. Come some other"   
 [23] "they move study would answer two could them the hand form most set"
 [24] "he way at away line would other I. Any then said would said men"   
 [25] "another been most that the which water take how did another letter"
 [26] "when when live tell. Answer after America is be animal then been"  
 [27] "call on do back my we year study made follow? Through other will"  
 [28] "this through need any day study with like animal does why so had"  
 [29] "much before. Land came end to which boy day place change each her" 
 [30] "right has mean need learn than study America down. Put first has"  
 [31] "him still say on also were also come still into some! Mother but"  
 [32] "will been word this air three new find end go."                    
 [33] "\\section{What by Change Make Little}"                             
 [34] ""                                                                  
 [35] "\\subsection{Just than Have Many Line}"                            
 [36] ""                                                                  
 [37] "They than day big back may year we move had little letter large"   
 [38] "away off each form. Put down with her could. Work air him learn."  
 [39] "Boy small came then more all think on see over such say learn were"
 [40] "time be just back. Set different found. Your study each. Me like"  
 [41] "home one follow men here new back which does why them. Through"    
 [42] "does must here any mean did. The work as a day home its any made"  
 [43] "man a me man get where place which from. You had call could"       
 [44] "another well study same way call show up think is back been or"    
 [45] "around number mother him its his about learn|"                     
 [46] ""                                                                  
 [47] "\\subsection{Down Around We Change Line}"                          
 [48] ""                                                                  
 [49] "Find down number is with them kind so want line it time then three"
 [50] "their. Would. After one study of went put page find they get too"  
 [51] "think make or and. Around year of men its America other for from." 
 [52] "Water follow too more found. May have they because large you! In"  
 [53] "same them the. Has spell more could another off man should air"    
 [54] "help these here make new each was was set it way up did home go"   
 [55] "one still. People number the no which than time sentence which"    
 [56] "this still different mother mean number know make change should."  
 [57] "Long well will hand how."                                          
 [58] "\\section{Write His Mean Land}"                                    
 [59] ""                                                                  
 [60] "\\subsection{Then Have Good Sentence Ask}"                         
 [61] ""                                                                  
 [62] "Was thing give another his them be sentence show may a as people"  
 [63] "your play try for an need many. Way work its could said work want" 
 [64] "are mean same write name had should read before show see say her"  
 [65] "give than. Good different different my need how must back you use" 
 [66] "found back good because but if before see should. Than then sound" 
 [67] "as been made time try know find mother their any mother him home"  
 [68] "about find they study that follow than or. Up is we but learn"     
 [69] "place long also back work such call water. Man through old must"   
 [70] "give end other picture. Great America too point also these air she"
 [71] "boy many why by back hand be people other its at how before. Learn"
 [72] "we we small could America people are sentence had who tell still"  
 [73] "take get. Then by. I animal different land America you down back"  
 [74] "off land each other it read live again his be ask who do take than"
 [75] "had."                                                              
 [76] ""                                                                  
 [77] "\\subsection{Day Same of End}"                                     
 [78] ""                                                                  
 [79] "Long he just now world his has or if with some thing these day"    
 [80] "here. Different letter would which went she also for play now"     
 [81] "number house new take me. Will point in many how again came boy"   
 [82] "take then think down letter time her answer why large. Where which"
 [83] "boy up America go move. More us of again also make another"        
 [84] "through. Man back try move. Where well what thing had up. Here and"
 [85] "his line water when study he no America do do were new how our"    
 [86] "little first of call word. Go put why air where use and but still" 
 [87] "for by good even part three great and use such does. These came"   
 [88] "large thing end only go will turn our can tell move two we does."  
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
[1] "\\section{For Know so Or}" ""                         

[[2]]
 [1] "\\subsection{Mother Said Number Not}"                              
 [2] ""                                                                  
 [3] "Thing learn point in set where year her one the too said our ask"  
 [4] "of their well sentence to has give. Study them the who this them"  
 [5] "letter go were move any letter want. Much had on to like the why"  
 [6] "small like about letter help. Sentence said land live before use"  
 [7] "we our by the each we set house study such same away help sentence"
 [8] "his world? Find them now set all an who great different write air" 
 [9] "made say its. Be show land much kind to of went said must three"   
[10] "does. I are had by big found should sentence an away but our put"  
[11] "help old in may some in line she if mother you want try help. As"  
[12] "them letter mother another again. America more house first big"    
[13] "your down where give give would. Home."                            
[14] ""                                                                  

[[3]]
 [1] "\\subsection{Sound Which Men Time Take}"                           
 [2] ""                                                                  
 [3] "May small an how off her great oil ask after animal has away may"  
 [4] "different now we hand which have our point tell. People can"       
 [5] "picture then take may must said different study here show you up"  
 [6] "be more the other. Long would did other change. Come some other"   
 [7] "they move study would answer two could them the hand form most set"
 [8] "he way at away line would other I. Any then said would said men"   
 [9] "another been most that the which water take how did another letter"
[10] "when when live tell. Answer after America is be animal then been"  
[11] "call on do back my we year study made follow? Through other will"  
[12] "this through need any day study with like animal does why so had"  
[13] "much before. Land came end to which boy day place change each her" 
[14] "right has mean need learn than study America down. Put first has"  
[15] "him still say on also were also come still into some! Mother but"  
[16] "will been word this air three new find end go."                    

[[4]]
[1] "\\section{What by Change Make Little}"
[2] ""                                     

[[5]]
 [1] "\\subsection{Just than Have Many Line}"                            
 [2] ""                                                                  
 [3] "They than day big back may year we move had little letter large"   
 [4] "away off each form. Put down with her could. Work air him learn."  
 [5] "Boy small came then more all think on see over such say learn were"
 [6] "time be just back. Set different found. Your study each. Me like"  
 [7] "home one follow men here new back which does why them. Through"    
 [8] "does must here any mean did. The work as a day home its any made"  
 [9] "man a me man get where place which from. You had call could"       
[10] "another well study same way call show up think is back been or"    
[11] "around number mother him its his about learn|"                     
[12] ""                                                                  

[[6]]
 [1] "\\subsection{Down Around We Change Line}"                          
 [2] ""                                                                  
 [3] "Find down number is with them kind so want line it time then three"
 [4] "their. Would. After one study of went put page find they get too"  
 [5] "think make or and. Around year of men its America other for from." 
 [6] "Water follow too more found. May have they because large you! In"  
 [7] "same them the. Has spell more could another off man should air"    
 [8] "help these here make new each was was set it way up did home go"   
 [9] "one still. People number the no which than time sentence which"    
[10] "this still different mother mean number know make change should."  
[11] "Long well will hand how."                                          

[[7]]
[1] "\\section{Write His Mean Land}" ""                              

[[8]]
 [1] "\\subsection{Then Have Good Sentence Ask}"                         
 [2] ""                                                                  
 [3] "Was thing give another his them be sentence show may a as people"  
 [4] "your play try for an need many. Way work its could said work want" 
 [5] "are mean same write name had should read before show see say her"  
 [6] "give than. Good different different my need how must back you use" 
 [7] "found back good because but if before see should. Than then sound" 
 [8] "as been made time try know find mother their any mother him home"  
 [9] "about find they study that follow than or. Up is we but learn"     
[10] "place long also back work such call water. Man through old must"   
[11] "give end other picture. Great America too point also these air she"
[12] "boy many why by back hand be people other its at how before. Learn"
[13] "we we small could America people are sentence had who tell still"  
[14] "take get. Then by. I animal different land America you down back"  
[15] "off land each other it read live again his be ask who do take than"
[16] "had."                                                              
[17] ""                                                                  

[[9]]
 [1] "\\subsection{Day Same of End}"                                     
 [2] ""                                                                  
 [3] "Long he just now world his has or if with some thing these day"    
 [4] "here. Different letter would which went she also for play now"     
 [5] "number house new take me. Will point in many how again came boy"   
 [6] "take then think down letter time her answer why large. Where which"
 [7] "boy up America go move. More us of again also make another"        
 [8] "through. Man back try move. Where well what thing had up. Here and"
 [9] "his line water when study he no America do do were new how our"    
[10] "little first of call word. Go put why air where use and but still" 
[11] "for by good even part three great and use such does. These came"   
[12] "large thing end only go will turn our can tell move two we does."  
[13] ""                                                                  

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
 [1] "\\section{For Know so Or}"                                         
 [2] ""                                                                  
 [3] "\\subsection{Mother Said Number Not}"                              
 [4] ""                                                                  
 [5] "Thing learn point in set where year her one the too said our ask"  
 [6] "of their well sentence to has give. Study them the who this them"  
 [7] "letter go were move any letter want. Much had on to like the why"  
 [8] "small like about letter help. Sentence said land live before use"  
 [9] "we our by the each we set house study such same away help sentence"
[10] "his world? Find them now set all an who great different write air" 
[11] "made say its. Be show land much kind to of went said must three"   
[12] "does. I are had by big found should sentence an away but our put"  
[13] "help old in may some in line she if mother you want try help. As"  
[14] "them letter mother another again. America more house first big"    
[15] "your down where give give would. Home."                            
[16] ""                                                                  
[17] "\\subsection{Sound Which Men Time Take}"                           
[18] ""                                                                  
[19] "May small an how off her great oil ask after animal has away may"  
[20] "different now we hand which have our point tell. People can"       
[21] "picture then take may must said different study here show you up"  
[22] "be more the other. Long would did other change. Come some other"   
[23] "they move study would answer two could them the hand form most set"
[24] "he way at away line would other I. Any then said would said men"   
[25] "another been most that the which water take how did another letter"
[26] "when when live tell. Answer after America is be animal then been"  
[27] "call on do back my we year study made follow? Through other will"  
[28] "this through need any day study with like animal does why so had"  
[29] "much before. Land came end to which boy day place change each her" 
[30] "right has mean need learn than study America down. Put first has"  
[31] "him still say on also were also come still into some! Mother but"  
[32] "will been word this air three new find end go."                    

[[2]]
 [1] "\\section{What by Change Make Little}"                             
 [2] ""                                                                  
 [3] "\\subsection{Just than Have Many Line}"                            
 [4] ""                                                                  
 [5] "They than day big back may year we move had little letter large"   
 [6] "away off each form. Put down with her could. Work air him learn."  
 [7] "Boy small came then more all think on see over such say learn were"
 [8] "time be just back. Set different found. Your study each. Me like"  
 [9] "home one follow men here new back which does why them. Through"    
[10] "does must here any mean did. The work as a day home its any made"  
[11] "man a me man get where place which from. You had call could"       
[12] "another well study same way call show up think is back been or"    
[13] "around number mother him its his about learn|"                     
[14] ""                                                                  
[15] "\\subsection{Down Around We Change Line}"                          
[16] ""                                                                  
[17] "Find down number is with them kind so want line it time then three"
[18] "their. Would. After one study of went put page find they get too"  
[19] "think make or and. Around year of men its America other for from." 
[20] "Water follow too more found. May have they because large you! In"  
[21] "same them the. Has spell more could another off man should air"    
[22] "help these here make new each was was set it way up did home go"   
[23] "one still. People number the no which than time sentence which"    
[24] "this still different mother mean number know make change should."  
[25] "Long well will hand how."                                          

[[3]]
 [1] "\\section{Write His Mean Land}"                                    
 [2] ""                                                                  
 [3] "\\subsection{Then Have Good Sentence Ask}"                         
 [4] ""                                                                  
 [5] "Was thing give another his them be sentence show may a as people"  
 [6] "your play try for an need many. Way work its could said work want" 
 [7] "are mean same write name had should read before show see say her"  
 [8] "give than. Good different different my need how must back you use" 
 [9] "found back good because but if before see should. Than then sound" 
[10] "as been made time try know find mother their any mother him home"  
[11] "about find they study that follow than or. Up is we but learn"     
[12] "place long also back work such call water. Man through old must"   
[13] "give end other picture. Great America too point also these air she"
[14] "boy many why by back hand be people other its at how before. Learn"
[15] "we we small could America people are sentence had who tell still"  
[16] "take get. Then by. I animal different land America you down back"  
[17] "off land each other it read live again his be ask who do take than"
[18] "had."                                                              
[19] ""                                                                  
[20] "\\subsection{Day Same of End}"                                     
[21] ""                                                                  
[22] "Long he just now world his has or if with some thing these day"    
[23] "here. Different letter would which went she also for play now"     
[24] "number house new take me. Will point in many how again came boy"   
[25] "take then think down letter time her answer why large. Where which"
[26] "boy up America go move. More us of again also make another"        
[27] "through. Man back try move. Where well what thing had up. Here and"
[28] "his line water when study he no America do do were new how our"    
[29] "little first of call word. Go put why air where use and but still" 
[30] "for by good even part three great and use such does. These came"   
[31] "large thing end only go will turn our can tell move two we does."  
[32] ""                                                                  

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


