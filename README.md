Getting-and-cleanning-Data_Course-project
=========================================
about the transformation,the "x","y","subject" three main parts were firstly built up by clips respectively.

strsplit() and grep() functions were used to extract only the mean and std measurements among the all,shaping the data set to a much small one.

gsub() and tolower() functions were used to modify the variables names.

gsub() function was also used to change names of activity from integer number to readable phrases.

Then the three parts were put together to one single set,which through melt() and dcast() functions,finally transformed into what we see now
