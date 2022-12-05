# Script file written to perform a single read of gbfs data.
#
# The goal is to have a source file that will read a pull from gbfs data and
# then append to csv file.

library(gbfs)
library(dplyr)

filename="E:/Dropbox/Rwork/DS241/f2022/data/likelog.csv"

df1=get_station_status(city = "cabi",output = "return") %>%
  filter(station_id %in%  c("101","102","103","104","105")) %>% 
  select(station_id,is_renting,is_returning,
         num_docks_available,num_docks_disabled,
         num_bikes_available,num_bikes_disabled,
         num_ebikes_available,last_updated)

write.table(df1,file=filename,append=TRUE,
            row.names = FALSE,
            col.names=FALSE,
            sep = ",")
  
  



