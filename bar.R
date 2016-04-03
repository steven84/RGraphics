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