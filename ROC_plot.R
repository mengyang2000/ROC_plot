library(pROC    , quietly=T, warn.conflicts=F)
args <- commandArgs(TRUE)
input = args[1]
group = args[2]
#data = "/Scratch/analysis/Ironman/LC_pentad_code_analyse_20171023/01.FE_pentad_code/pentad_code_IA/cpileup-parsed/probability-estimation--ignore-all-at-tissue-chisq.test-deletesamepentadcode/IA-Benign.class_probability_estimation.tsv"
data = read.table(input,header=TRUE,sep="\t")
pdf(file=sprintf("ROC_Comparison__%s.pdf",group))
mygrey <- rgb(89/255,87/255,87/255)
#par(family="sans",col.main=mygrey,col=mygrey,col.lab=mygrey,col.axis=mygrey,cex.main=1.5,cex.lab=1.2,cex.axis=1.2,mgp=c(2.5,1,0))
par(family="sans",col.main=mygrey,col=mygrey,col.lab=mygrey,col.axis=mygrey,cex.main=1.5,cex.lab=1.2,cex.axis=1.2)
plot.roc(data$group, data$IA_Tissue,
         grid=c(5,5),
#        main=sprintf("ROC Comparison(%s,%s)","75IA,121Benign","Tissue"),
	 main=sprintf("ROC Comparison(%s)",group),
         percent=TRUE,
         print.thres=TRUE,
         ci=TRUE,
         auc=TRUE,
         print.auc=TRUE,
         print.thres.cex=1.2,
         print.thres.pattern="%.3f (%.1f%%, %.1f%%)",
         print.thres.col=mygrey,
         print.auc.cex=1.2,
         auc.polygon=TRUE,
         auc.polygon.col="Light Sky Blue",
         
)
#legend("bottomright", legend = "75IA,121Benign", lwd = 1.5,cex=1.5)
dev.off()
