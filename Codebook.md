Getting-and-cleanning-Data_Course-project
=========================================
180 rows,81 columns

1st column:label indicating one of the total 30 subjects

2nd column:label indicating one of the total 6 types of acitivities

3-81 columns:average measurements for each subject and each activity


about the transformation,the "x","y","subject" three main parts were firstly built up by clips respectively.

strsplit() and grep() functions were used to extract only the mean and std measurements among the all,shaping the data set to a much small one.

gsub() and tolower() functions were used to modify the variables names.

gsub() function was also used to change names of activity from integer number to readable phrases.

Then the three parts were put together to one single set,which through melt() and dcast() functions,finally transformed into
what we see now
