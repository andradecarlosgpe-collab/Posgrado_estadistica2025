#Carlos guadalupe andrade peña 1541591
#Semana 4 Calidad de plantula

#Importar
library(readxl)
Calidadplantula_csv <- read_excel("C:/Repositorios/Posgrado_estadistica2025
/Calidadplantula.csv.xlsx")
View(Calidadplantula_csv)
Calidadplantula_csv$Tratamiento<-as.factor(Calidadplantula_csv$Tratamiento)
class(Calidadplantula_csv)
summary(Calidadplantula_csv)
mean(Calidadplantula_csv$IE)
tapply(Calidadplantula_csv$IE, Calidadplantula_csv$Tratamiento, mean)
tapply(Calidadplantula_csv$IE, Calidadplantula_csv$Tratamiento, sd)
tapply(Calidadplantula_csv$IE, Calidadplantula_csv$Tratamiento, var)
#Boxplot..

colores<- c("navajowhite","red")

boxplot(Calidadplantula_csv$IE~ Calidadplantula_csv$Tratamiento, col = colores, 
        xlab = "Tratamientos",
        ylab = "Índice de Esbeltez",
        main = "Calidad de Planta en Vivero Forestal",
        ylim = c(0.4,1.2))
#Aplicar subconjunto para cada tratamiento

df_ctrl <- subset(Calidadplantula_csv, Tratamiento == "Ctrl")
View(df_ctrl)
df_fert <- subset(Calidadplantula_csv, Tratamiento == "Fert")
View(df_fert)
#Grafico QQ
par(mfrow=c(1,2))
qqnorm(df_ctrl$IE); qqline(df_ctrl$IE)
qqnorm(df_fert$IE); qqline(df_fert$IE)
par(mfrow=c(1,2))
#Comprobando los 3 supuestos

shapiro.test(df_ctrl$IE) # Normales
shapiro.test(df_fert$IE) # Normales

var.test(Calidadplantula_csv$IE ~ Calidadplantula_csv$Tratamiento)

t.test(Calidadplantula_csv$IE ~ Calidadplantula_csv$Tratamiento,
alternative = "two.sided", var.equal = T)


#Efecto de Cohen´s...

cohens_efecto <- function(x, y) {
  n1 <- length(x); n2 <- length(y)
  s1 <- sd(x); s2 <- sd(y)
  sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
  (mean(x) - mean(y)) / sp
}

d1_cal <- cohens_efecto(df_ctrl$IE,df_fert$IE)
d1_cal

