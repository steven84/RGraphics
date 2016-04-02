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
