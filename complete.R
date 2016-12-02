complete<-function(directory, id = 1:332){
        file_list<-list.files(directory, full.names = TRUE)
        temp <- vector(mode = "list", length(file_list))
        temp<-lapply(file_list, read.csv)
        qz_data<-do.call(rbind,temp)
        
        results<-data.frame(matrix(0, nrow = length(id), ncol = 2))
        colnames(results)<-c("id","nobs")
        
        for (i in 1:length(id)){
                results[i,1]<-id[i]
                results[i,2]<-sum(complete.cases(qz_data[which(qz_data[,"ID"] == id[i]), ]))
        }
        results
        
}