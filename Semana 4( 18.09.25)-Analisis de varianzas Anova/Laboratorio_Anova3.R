#Carlos Guadalupe Andrade Peña
##anova
###2025-23-09
#Comparación de concentraciones de estroncio en cuerpos de agua
#datos 
library(datapasta)
library(readr)
file.exists("Estroncio.CSV")
Estroncio <- read.csv("Estroncio.csv", header = TRUE) 
#transformación de datos
Estroncio_log <- stack (Estroncio[,-1])
colnames(Estroncio_log) <- c("Estroncio","Sitio")  
Estroncio_log$Sitio <- as.factor(Estroncio_log$Sitio)
#Estadísticas descritivas
tapply(Estroncio_log$Estroncio,Estroncio_log$Sitio, mean)
tapply(Estroncio_log$Estroncio,Estroncio_log$Sitio,var)
#Boxplot
boxplot(Estroncio ~ Sitio, data = Estroncio_log,  
        col = "pink",  
        main = "Concentraciones de Estroncio por sitio",  
        ylab = "Estroncio (mg/ml)")
#Pruebas de normalidad
shapiro.test(Estroncio_log$Estroncio)
by(Estroncio_log$Estroncio,Estroncio_log$Sitio,shapiro.test)
#Homogeneidad de varianzas
bartlett.test(Estroncio ~ Sitio, data = Estroncio_log)  
#Anova
Estroncio.aov <-aov(Estroncio ~ Sitio, data = Estroncio_log)
summary(Estroncio.aov)
#Prueba LSD
library(agricolae)
lsd_resultados <- LSD.test(Estroncio.aov, "Sitio", p.adj = "none")  
print(lsd_resultados) 
#Prueba Turkey
tukey_resultados<- TukeyHSD(Estroncio.aov,conf.level = 0.95)
print(tukey_resultados)
plot(tukey_resultados)
#Diferencias mínima significativa (MSD) con Tukey
n<- 6  
glerror <- Estroncio.aov$df.residual  
MSE <- summary(Estroncio.aov)[[1]][["Mean Sq"]][2]  
k <- length(levels(Estroncio_log$Sitio))  
qcrit <- qtukey(0.95, nmeans = k, df = glerror)  
MSD <- qcrit * sqrt(MSE/2 * (2/n))  
MSD  
#Visualizacion con ggplot2
library(ggplot2)
ggplot(Estroncio_log, aes(x = Sitio, y = Estroncio, fill = Sitio)) +  
geom_violin(trim = FALSE, alpha = 0.6) +  
geom_jitter(width = 0.1, alpha = 0.7) +  
geom_boxplot(width = 0.1, fill = "purple", outlier.shape = NA) +  
theme_light() +  
labs(title = "Distribución de Estroncio por sitio",  
y = "Estroncio (mg/ml)",  
x = "Sitio")
install.packages("datapasta")
