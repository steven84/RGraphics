library(gcookbook)
?pg_mean
str(pg_mean)
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat = "identity")

ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat = "identity")
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat = "identity")
ggplot(pg_mean, aes(x=group, y=weight)) + 
    geom_bar(stat = "identity", fill = "lightblue", colour = "black")

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
    geom_bar(position = "dodge", stat = "identity", colour = "black") +
    scale_fill_brewer(palette = "Pastel1")

ggplot(diamonds, aes(x=cut)) + geom_bar()
ggplot(diamonds, aes(x=carat)) + geom_bar()

ups <- subset(uspopchange, rank(Change)>40)

ggplot(ups, aes(x=Abb, y=Change, fill=Region)) + geom_bar(stat="identity")

ggplot(ups, aes(x=reorder(Abb, Change), y=Change, fill=Region)) +
    geom_bar(stat="identity", colour="black") + 
    scale_fill_manual(values = c("#669933","#FFCC66")) + 
    xlab("State")

csub <- subset(climate, Source=="Berkeley" & Year >= 1900)
csub$pos <- csub$Anomaly10y >=0

ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
    geom_bar(stat = "identity", position = "identity")

ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
    geom_bar(stat = "identity", position = "identity", colour = "black", size = 0.25) +
    scale_fill_manual(values = c("#CCEEFF","#FFDDDD"), guide=FALSE)

ggplot(pg_mean, aes(x=group, y=weight)) + 
    geom_bar(stat = "identity", width = 0.5 )

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity", position = position_dodge(0.7), width=0.5 )

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity" )

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity" ) +
    guides(fill=guide_legend(reverse = TRUE))

library(plyr)
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar, order=desc(Cultivar))) +
    geom_bar(stat = "identity" )

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity", colour="black") +
    guides(fill=guide_legend(reverse = TRUE)) +
    scale_fill_brewer(palette = "Pastel1")
