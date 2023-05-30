package com.as.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	    private static Properties env = new Properties();  
	      
	    static {  
	        try {  
	            InputStream is = PropertiesUtil.class.getClassLoader().getResourceAsStream("config.properties");  
	            env.load(is);  
	            is.close();  
	        } catch (Exception e) {  
	        }  
	    }  
	      
	    /** 
	     * 取属性值 
	     * @param key 
	     * @return  
	     */  
	    public static String getProperty(String key){  
	        return env.getProperty(key);  
	    }  
	      
	    /** 
	     * 设置属性值 
	     * @param key 
	     * @param value  
	     */  
	    public static void setProperty(String key, String value){  
	        try{  
	            File file = new File(PropertiesUtil.class.getClassLoader().getResource(".").getPath()+File.separator+"env.properties");  
	            FileOutputStream outStream = new FileOutputStream(file);  
	            env.setProperty(key, value);  
	            //写入properties文件  
	            env.store(outStream, null);  
	        } catch (Exception ex) {  
	        }  
	    }  
	      
	    public static void main(String[] args) {  
	        // TODO Auto-generated method stub  
	        System.out.println(PropertiesUtil.getProperty("MAXWAIT"));  
	        //System.out.println(PropertiesUtil.class.getClassLoader().getResource(".").getPath());  
	    }  
	}  
