#Laboratorio-2
##carlos andrade
##2025-09-04
data("iris")
head(iris)
summary(iris)
str(iris)
data_sub <-subset(iris,Species %in% c("versicolor","virginica") )
table(data_sub$Species)
tapply(data_sub$Petal.Length,data_sub$Species,summary)
tapply(data_sub$Petal.Length,data_sub$Species,mean)
tapply(data_sub$Petal.Length, data_sub$Species, sd)
var.test(Petal.Length ~ Species,data = data_sub)
t.test(Petal.Length ~ Species, data = data_sub, var.equal = FALSE)
boxplot(Petal.Length ~ Species, data = data_sub,
col= c("green","red"),
main = "Comparación de medias entre especies",
xlab = "Especies",
ylab = "Tamaño de pétalo")
boxplot(iris$Sepal.Length)
boxplot(Petal.Length ~ Species, data = iris, col= c("skyblue", "lightgreen","pink"))
library(ggplot2)
ggplot(iris, aes(x = Species, y = Petal.Length)) + 
geom_boxplot()+ labs(title = "Boxplot del largo del pétalo por especie",
                     x = "Especie", 
                     y = "Largo del pétalo")
ggplot(data_sub, aes(x = Species, y = Petal.Length, fill = Species)) +
geom_violin(trim = FALSE, color = "pink", alpha = 0.6) + 
geom_boxplot(width = 0.1, fill = "gray", outlier.shape = NA) +
stat_summary(fun = mean, geom = "point", shape = 23, size = 3, fill = "yellow")+
theme_minimal() +
labs(title = "Distribución de la longitud de pétalos por especie",
       x = "Especies",
       y = "Longitud de pétalo (cm)") + theme(legend.position = "none")
library(effsize)
cohen.d(Petal.Length~Species,data = data_sub)
