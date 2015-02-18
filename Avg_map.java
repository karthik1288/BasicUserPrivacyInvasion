import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


	public class Avg_map extends Mapper<LongWritable,Text,Text,Text>{
	public void map(LongWritable key,Text value,Context context) throws IOException,InterruptedException{
		System.out.println("1");
	  
		String file1=null;
		String[]  value1=null;
		String[] line_split=null;
	
		
		file1 = value.toString();
		 value1 = file1.split("\t");
		 String result=null;
		 
		Path pt=new Path("/home/665498/Desktop/files/input_2.txt");//Location of file in HDFS
        FileSystem fs = FileSystem.get(new Configuration());
        BufferedReader br=new BufferedReader(new InputStreamReader(fs.open(pt)));
        String line;
       
        
        while ((line=br.readLine())!=null){
           
            if(line.matches(value1[1])){
            	System.out.println("result"+"\t"+value1[1]+"\t"+value1[0]);
            	result=value1[0];
            }
                     
            }
           
        
            context.write(new Text(result),new Text(value1[1]));
        
        }
       
		
		
}