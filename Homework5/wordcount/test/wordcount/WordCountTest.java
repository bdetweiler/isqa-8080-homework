package wordcount;

import static org.junit.Assert.*;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper.Context;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;

import static org.mockito.Mockito.*;
import wordcount.WordCount.Map;

public class WordCountTest {

	// private WordCount wc = new WordCount();
	
	@Test
	public void testMap() {
		Map map = new WordCount.Map();
		Text text = new Text();
		
		Context context = mock(Context.class);
		// Mockito.when(context.write(new Text(), new IntWritable())).thenReturn(null);
		
		text.set("Brian Allison Vivienne Mason");
		// map.map(0, text, context);
		fail("Not yet implemented");
	}

	@Test
	public void testReduce() {
		fail("Not yet implemented");
	}
}
