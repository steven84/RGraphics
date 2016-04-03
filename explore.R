library(ggplot2)
?mtcars
qplot(mtcars$wt,mtcars$mpg)
qplot(wt,mpg,data = mtcars)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

?pressure
plot(pressure$temperature, pressure$pressure, type="l")
points(pressure$temperature, pressure$pressure)

lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="red")

qplot(pressure$temperature, pressure$pressure, geom = "line")
qplot(temperature, pressure, data = pressure, geom = "line" )

ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line()

qplot(temperature, pressure, data=pressure, geom=c("line", "point"))
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()

?BOD
barplot(BOD$demand, names.arg = BOD$Time)

barplot(table(mtcars$cyl))

qplot(mtcars$mpg)
qplot(mpg, data = mtcars, binwidth=4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 4)

boxplot(len ~ supp, data = ToothGrowth)
boxplot(len ~ supp + dose, data = ToothGrowth)

qplot(supp, len, data = ToothGrowth, geom = "boxplot")
ggplot(ToothGrowth, aes(supp,len)) + geom_boxplot()

qplot(interaction(supp, dose), len, data = ToothGrowth,geom = "boxplot")
ggplot(ToothGrowth, aes(interaction(supp, dose),len)) + geom_boxplot()

curve(x^3 - 5*x, from=-4, to=4)

myfun <- function(xvar) {
    1/(1 + exp(-xvar + 10))
}
curve(myfun(x), from = 0, to = 20)
curve(1-myfun(x), add = TRUE, col = "red")

ggplot(data.frame(x=c(0, 20)), aes(x=x)) + stat_function(fun = myfun, geom = "line")