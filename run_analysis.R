run_analysis<-function(){
        x_test<-read.table("x_test.txt")
        x_train<-read.table("x_train.txt")
        y_test<-read.table("y_test.txt",colClasses="character")
        y_train<-read.table("y_train.txt",colClasses="character")
        subject_test<-read.table("subject_test.txt")
        subject_Train<-read.table("subject_train.txt")
        features<-read.table("features.txt",colClasses="character")
        
        subject_train_test<-rbind(subject_train,subject_test)
        x_train_test<-rbind(x_train,x_test)
        splitFeatures = strsplit(features,"\\(") 
        firstElement <- function(x){x[1]}
        firstSplit<-sapply(splitFeatures,firstElement)
        Split_mean_std<-strsplit(firstSplit,"\\-")
        secondElement<-function(x){x[2]}
        secondSplit<-sapply(split_mean_std,secondElement)
        meanIndex<-grep("mean",secondSplit)
        stdIndex<-grep("std",secondSplit)
        Index_mean_std<-sort(c(meanIndex,stdIndex))
        subX_test_train<-x_test_train[,Index_mean_std]
        names(subX_train_test)<-features[Index_mean_std,2]
        names(subX_train_test)<-gsub("\\(\\)|\\_|\\-","",names(subX_train_test))
        names(subX_train_test)<-tolower(names(subX_train_test))
        
        y_train_test<-rbind(y_train,y_test)
        act_train_test<-gsub("1","WALKING",y_train_test[[1]])
        act_train_test<-gsub("2","WALKING_UPSTAIRS",act_train_test)
        act_train_test<-gsub("3","WALKING_DOWNSTAIRS",act_train_test)
        act_train_test<-gsub("4","SITTING",act_train_test)
        act_train_test<-gsub("5","STANDING",act_train_test)
        act_train_test<-gsub("6","LAYING",act_train_test)
        
        data<-cbind(x_train_test,Subject=subject_train_test,Activity=act_train_test)
        dataMelt<-melt(data,id=c("Subject","Activity"),measure.vars=names(data)[1:79])
        
        tidyData<-dcast(dataMelt,Subject+Activity~variable,mean)
        write.table(tidyData,file="tidyData.txt")
}