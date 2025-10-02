#Laboratorio-1 R
##Carlos Andrade
###2025-09-01
#Gastos totales
300 + 240 + 1527 + 400 + 1500 + 1833
celular<-300
celular
transporte <- 240
comestible <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833
# Valor absoluto (absolute value)
abs(10)
abs(-4)
# Raíz cuadrada (square root)
sqrt(9)
# Logáritmo natural (natural Logarithm)
log(2)
help("mean")
## starting httpd help server... done
?abs
?mean
help.search("absolute")
??absolute
gastos <- c(celular, transporte, comestible, gimnasio, alquiler, otros)
barplot(gastos)
gastos.ordenados <- sort (gastos, decreasing = TRUE)
names(gastos.ordenados) <-
c("otros","comestibles","alquiler","gimnasio","celular","transporte")    
barplot(gastos.ordenados,main = "gastos
mensuales",names.arg = names(gastos.ordenados),col = "green")
