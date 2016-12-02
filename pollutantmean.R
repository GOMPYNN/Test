pollutantmean<-function(directory, pollutant, id = 1:332){
        file_list<-list.files(directory, full.names = TRUE)
        temp <- vector(mode = "list", length(file_list))
        temp<-lapply(file_list, read.csv)
        qz_data<-do.call(rbind,temp)
        qz_subset<-qz_data[which(qz_data[,"ID"] %in% id),]
        mean(qz_subset[, pollutant], na.rm = TRUE)
}