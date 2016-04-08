library(gcookbook)
library(plyr)
library(ggplot2)

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

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar, order=desc(Cultivar))) +
    geom_bar(stat = "identity" )

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity", colour="black") +
    guides(fill=guide_legend(reverse = TRUE)) +
    scale_fill_brewer(palette = "Pastel1")

ce <- ddply(cabbage_exp, "Date", transform, percent_weight = Weight / sum(Weight) * 100)

ggplot(ce, aes(x=Date, y=percent_weight, fill=Cultivar)) +
    geom_bar(stat = "identity")

ggplot(ce, aes(x=Date, y=percent_weight, fill=Cultivar)) +
    geom_bar(stat = "identity", colour = "black") +
    guides(fill=guide_legend(reverse = TRUE)) +
    scale_fill_brewer(palette = "Pastel1")

ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
    geom_bar(stat="identity") +
    geom_text(aes(label=Weight), vjust=1.5, colour="white")

ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
    geom_bar(stat="identity") +
    geom_text(aes(label=Weight), vjust=-0.2)

ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
    geom_bar(stat = "identity") +
    geom_text(aes(label=Weight), vjust=-0.2) +
    ylim(0, max(cabbage_exp$Weight)*1.05)

ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
    geom_bar(stat = "identity") +
    geom_text(aes(y=Weight+0.1, label=Weight))

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity", position = "dodge") +
    geom_text(aes(label=Weight), vjust=1.5, colour="white", position=position_dodge(.9))

ce <- arrange(cabbage_exp, Date, Cultivar)
ce <- ddply(ce, "Date", transform, label_y=cumsum(Weight))
            
ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity") +
    geom_text(aes(y=label_y, label=Weight), vjust=1.5, colour="white")

ce <- arrange(cabbage_exp, Date, Cultivar)
ce <- ddply(ce, "Date", transform, label_y=cumsum(Weight)-0.5*Weight)

ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity") +
    geom_text(aes(y=label_y, label=Weight), vjust=1.5, colour="white")

ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat = "identity", colour="black") +
    geom_text(aes(y=label_y, label=paste(format(Weight, nsmall = 2), "kg")), size=4) +
    guides(fill=guide_legend(reverse = TRUE)) +
    scale_fill_brewer(palette = "Pastel1")

tophit <- tophitters2001[1:25,]
ggplot(tophit, aes(x=avg, y=name)) + geom_point()

ggplot(tophit, aes(x=avg, y=reorder(name, avg))) +
    geom_point(size=3) +
    theme_bw() +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_line(colour = "gray60", linetype = "dashed"))

ggplot(tophit, aes(y=avg, x=reorder(name, avg))) +
    geom_point(size=3) +
    theme_bw() +
    theme(axis.text.x = element_text(angle=60,hjust=1),
          panel.grid.major.y = element_blank(),
          panel.grid.minor.y = element_blank(),
          panel.grid.major.x = element_line(colour = "grey60",linetype = "dashed"))

nameorder <- tophit$name[order(tophit$lg, tophit$avg)]

tophit$name <- factor(tophit$name, levels=nameorder)

ggplot(tophit, aes(x=avg, y=name)) +
    geom_segment(aes(yend=name), xend=0, colour="grey50") +
    geom_point(size=3, aes(colour=lg)) +
    scale_colour_brewer(palette = "Set1", limits=c("NL","AL")) +
    theme_bw() +
    theme(panel.grid.major.y = element_blank(),
          legend.position=c(1, 0.55),
          legend.justification=c(1, 0.5))

ggplot(tophit, aes(x=avg, y=name)) +
    geom_segment(aes(yend=name), xend=0, colour="grey50") +
    geom_point(size=3, aes(colour=lg)) +
    scale_colour_brewer(palette = "Set1", limits=c("NL","AL"), guide=FALSE) +
    theme_bw() +
    theme(panel.grid.major.y = element_blank()) +
    facet_grid(lg~., scales = "free_y", space = "free_y")