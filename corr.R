corr<-function(directory, threshold = 0){
        file_list<-list.files(directory, full.names = TRUE)
        temp <- vector(mode = "list", length(file_list))
        temp<-lapply(file_list, read.csv)
        qz_data<-do.call(rbind,temp)
        
        result<-vector("numeric")
        
        for(i in 1:length(file_list)){
                qz_subset<-qz_data[which(qz_data[,"ID"] == i),]
                
                if (sum(complete.cases(qz_subset)) > threshold){
                        tres<-cor(qz_subset["sulfate"], qz_subset["nitrate"], use = "complete.obs")
                        result<-c(result,tres)
                }
        }
        result
}