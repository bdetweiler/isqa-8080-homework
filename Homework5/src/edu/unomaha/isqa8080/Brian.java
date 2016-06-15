package edu.unomaha.isqa8080;
import java.io.IOException;

import org.apache.commons.lang.ArrayUtils;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
import org.apache.log4j.Logger;

public class Brian extends Configured implements Tool {

	private static final Logger LOG = Logger.getLogger(Brian.class);
	
	private static final int NUMBER_OF_REDUCERS = 2;
	
	private static final int USER_NUMBER = 7;

	public static void main(String[] args) throws Exception {
		int res = ToolRunner.run(new Brian(), args);
		System.exit(res);
	}

	public int run(String[] args) throws Exception {
		LOG.debug("Running Move Ratings Count");
		
	    Job job = Job.getInstance(getConf(), "Brian");
	    job.setJarByClass(this.getClass());
	    // Use TextInputFormat, the default unless job.setInputFormatClass is used
	    FileInputFormat.addInputPath(job, new Path(args[0]));
	    FileOutputFormat.setOutputPath(job, new Path(args[1]));
	    job.setNumReduceTasks(NUMBER_OF_REDUCERS);
	    job.setMapperClass(Map.class);
	    job.setMapOutputKeyClass(IntWritable.class);
	    job.setMapOutputValueClass(DoubleWritable.class);
	    // job.setCombinerClass(Reduce.class);
	    job.setReducerClass(Reduce.class);
	    job.setOutputKeyClass(IntWritable.class);
	    job.setOutputValueClass(DoubleWritable.class);
	    
	    int rval = job.waitForCompletion(true) ? 0 : 1;
	   
	    LOG.debug("returning " + rval);
	    
	    return rval;
	}

	public static class Map extends	Mapper<LongWritable, Text, IntWritable, DoubleWritable> {

		public void map(LongWritable offset, Text lineText, Context context) throws IOException, InterruptedException {
			String line = lineText.toString();
			
			if (line.contains("movieId")) {
				return;
			}
			
			// userId,movieId,tag,timestamp
			String[] wordArr = line.split(",");
			
			LOG.info(wordArr);
			
			if (ArrayUtils.isNotEmpty(wordArr)) {
				IntWritable movieId = new IntWritable(Integer.parseInt(wordArr[0]));
				DoubleWritable rating = new DoubleWritable(Double.parseDouble(wordArr[2]));
				context.write(movieId, rating);
			}
			
		}
	}

	public static class Reduce extends Reducer<IntWritable, DoubleWritable, IntWritable, DoubleWritable> {
		@Override
		public void reduce(IntWritable movieId, Iterable<DoubleWritable> ratings, Context context) throws IOException, InterruptedException {
			Double sum = 0D;
			Double counter = 0D;
			for (DoubleWritable rating : ratings) {
				sum += rating.get();
				++counter;
			}
			
			Double average = new Double(sum / counter);
			if (counter > USER_NUMBER) {
				context.write(movieId, new DoubleWritable(average));
			}
		}
	}
}
