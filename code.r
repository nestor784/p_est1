#Generador de paleta de colores
install.packages("RColorBrewer")
library("RColorBrewer")
#display.brewer.all() Visualizar paletas de colores disponibles

#Base de datos
db1 <- read.csv("https://raw.githubusercontent.com/nestor784/p_est1/main/db1.csv", header = TRUE, sep=";", dec=".")
db2 <- read.csv("https://raw.githubusercontent.com/nestor784/p_est1/main/db2.csv", header = TRUE, sep=";", dec=".")
#Segmentación por año
db1_ano <- split(db1, f = db1$Ano)

#Ajueste de margenes r plots y colores
par(mar=c(5, 16, 5, 5))
colors <- brewer.pal(n = length(db1_ano$`2002`$Votos), name = "Set3")


#Elecciones 2002
#barplot(db1_ano$`2002`$Votos,names.arg = db1_ano$`2002`$Partido, xlim = c(0,6000000),las = 1,horiz = TRUE,col = colors, main = "Elecciones 2002")

#Elecciones 2006
#barplot(db1_ano$`2006`$Votos,names.arg = db1_ano$`2006`$Partido, xlim = c(0,9000000),las = 1,horiz = TRUE,col = colors, main = "Elecciones 2006")

for (i in db1_ano){
  barplot(i$Votos,names.arg = i$Partido,las = 1,horiz = TRUE,col = colors)
  title(main = paste("Elecciones " , toString(i$Ano[1]) ) )
}
#legend("topright", db1_ano$`2002`$Partido, cex = 1.3, fill = colors) Prueba con leyenda
