plot1<-function(){
  
  #Step 1  Read the file then convert Date and Time variables
  #  I've chosen the clunky route since I have the space and am rusty at programming.

  dset<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=formatter,na.strings="?")
  dset[,1]<-as.Date(dset[,1],"%d/%m/%Y")
   
  
  #Step 2  Pull out data for 2007-02-01 and 2007-02-01 and take out NA 
  
  formatter<-c(rep("character",times=2),rep("numeric",times=7))
  start<-as.Date("2007/02/01","%Y/%m/%d")
  finish<-as.Date("2007/02/02","%Y/%m/%d")
  
  index<-((dset[,1]>=start)&(dset[,1]<=finish)) & (!is.na(dset[,3]))
  dset<-dset[index,1:3]        ##Only kept the 3 columns needed for this graph.
  
  
  
  #Step 3  Contruct hist plot in a png file
  
  png("plot1.png")
  hist(dset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
  dev.off()
  
}