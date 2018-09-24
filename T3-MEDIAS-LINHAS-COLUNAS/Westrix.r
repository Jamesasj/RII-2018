library(corrplot)
print("Bem vindo ao R", quote=FALSE)


matriz = read.csv("/media/wesleyz/HD1Tera/DADOS/000-git/000-2018/RII-2018/T3-MEDIAS-LINHAS-COLUNAS/arquivosaida", FALSE, ";")

class(matriz)

mediaRow <- rowMeans(matriz)
mediaCol <- colMeans(matriz)

write.table(mediaRow, file = "row-mean.dat", fileEncoding = "")

write.csv(mediaCol, file = "column-mean.dat", fileEncoding = "")

matValores <- matrix(NA, 17, 17)


for (i in 1:17)
  {
    omega  = as.numeric(unlist(matriz[,i]))
    for (j in 1:17){
        teta  = as.numeric(unlist(matriz[,j])) 
        # print(omega)
        # print(teta)
        cat("correlacao", i, j) 
        correlacaoOmegaTeta <- cor(omega, teta)
        print(round(correlacaoOmegaTeta,4))
        matValores[[i,j]] = round(correlacaoOmegaTeta,4)
    }
}

jpeg(paste("/media/wesleyz/HD1Tera/DADOS/000-git/000-2018/RII-2018/T3-MEDIAS-LINHAS-COLUNAS/",'correlacao',".jpg"))
corrplot.mixed(matValores, lower.col = "black", number.cex = .6)
corrplot(matValores)
dev.off()



