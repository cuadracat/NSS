setwd("/Users/f0049jv/Desktop/Indian NSS/data")
library(foreign) ###load package to upload spss files
##read in blocks 
block12 = read.spss("block12.sav", to.data.frame = TRUE)
block3 = read.spss("block3.sav", to.data.frame = TRUE)
block4 = read.spss("block4.sav", to.data.frame = TRUE)
block51 = read.spss("block51.sav", to.data.frame = TRUE)
block52 = read.spss("block52.sav", to.data.frame = TRUE)
block53 = read.spss("block53.sav", to.data.frame = TRUE)
block6 = read.spss("block6.sav", to.data.frame = TRUE)
block7 = read.spss("block7.sav", to.data.frame = TRUE)
block8 = read.spss("block8.sav", to.data.frame = TRUE)

##merge all of block 5
block5 = merge(block51, block52,by=c("FSU_Serial_No", "Hamlet_Group_Sub_Block_No", "Second_Stage_Stratum_No", "Sample_Hhld_No"))
block5 = merge(block5, block53, by=c("FSU_Serial_No", "Hamlet_Group_Sub_Block_No", "Second_Stage_Stratum_No", "Sample_Hhld_No"))
###delete duplicate columns if there are any, there aren't here so I blocked it out 
#culled = which(duplicated(names(block5)))
#nodupes = block5c[,-culled]


##create unique identifier in each based off "FSU_Serial_No", "Hamlet_Group_Sub_Block_No", "Second_Stage_Stratum_No", "Sample_Hhld_No" 
block12$id = paste0(block12$FSU_Serial_No, block12$Hamlet_Group_Sub_Block_No, block12$Second_Stage_Stratum_No, block12$Sample_Hhld_No, block12$Person_Serial_No)
block3$id = paste0(block3$FSU_Serial_No, block3$Hamlet_Group_Sub_Block_No, block3$Second_Stage_Stratum_No, block3$Sample_Hhld_No, block3$Person_Serial_No)
block4$id = paste0(block4$FSU_Serial_No, block4$Hamlet_Group_Sub_Block_No, block4$Second_Stage_Stratum_No, block4$Sample_Hhld_No, block4$Person_Serial_No)
block5$id = paste0(block5$FSU_Serial_No, block5$Hamlet_Group_Sub_Block_No, block5$Second_Stage_Stratum_No, block5$Sample_Hhld_No, block5$Person_Serial_No)
block6$id = paste0(block6$FSU_Serial_No, block6$Hamlet_Group_Sub_Block_No, block6$Second_Stage_Stratum_No, block6$Sample_Hhld_No, block6$Person_Serial_No)
block7$id = paste0(block7$FSU_Serial_No, block7$Hamlet_Group_Sub_Block_No, block7$Second_Stage_Stratum_No, block7$Sample_Hhld_No, block7$Person_Serial_No)
block8$id = paste0(block8$FSU_Serial_No, block8$Hamlet_Group_Sub_Block_No, block8$Second_Stage_Stratum_No, block8$Sample_Hhld_No, block8$Person_Serial_No)

require(foreign)
write.dta(block12, "statablock12.dta")
write.dta(block3, "statablock3.dta")
write.dta(block4, "statablock4.dta")
write.dta(block5, "statablock5.dta")
write.dta(block6, "statablock6.dta")
write.dta(block7, "statablock7.dta")
write.dta(block8, "statablock8.dta")

