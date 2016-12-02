weightmedian<-function(directory, day) {
        files_list<-list.files(directory, full.names = TRUE)
        dat<-data.frame()
        for (i in 1:length(files_list)){
                dat<-rbind(dat, read.csv(files_list[i]))
        }
        dat_subset<-dat[which(dat[,"Day"] == day),]
        median(dat_subset[,"Weight"], na.rm = TRUE)
}

wghtmedian<-function(directory, day){
        files_list<-list.files(directory, full.names = TRUE)
        temp <- vector(mode = "list", length(files_list))
        temp<-lapply(files_list, read.csv)
        dat<-do.call(rbind,temp)
        dat_subset<-dat[which(dat[,"Day"] == day),]
        median(dat_subset[,"Weight"], na.rm = TRUE)
}