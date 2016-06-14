#!/bin/bash

ant clean

if [ ! -e dist/build/Brian.jar ]; then
	ant
fi

# Remove output dir before rerunning MR job
hdfs dfs -rm -r movielens/output/userratingaverage

# Run MR job
hadoop jar dist/build/Brian.jar edu.unomaha.isqa8080.Brian movielens/input/ratings.csv movielens/output/userratingaverage

hdfs dfs -cat movielens/output/userratingaverage/part-r-00000
hdfs dfs -cat movielens/output/userratingaverage/part-r-00001
