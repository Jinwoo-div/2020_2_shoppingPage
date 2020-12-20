package com.mybatis.sample.app;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SampleSessionFactory {
	public static SqlSessionFactory sqlSessionFactory;
	static {
        String resource = "com/mybatis/sample/sql/mybatis-config.xml";
        Properties pro = new Properties();
        pro.put("driver", "com.mysql.jdbc.Driver");
        pro.put("url", "jdbc:mysql://localhost:3307/userdb2?serverTimezone=UTC");
        pro.put("username", "root");
        pro.put("password", "1234");
        try {
        	InputStream inputStream = Resources.getResourceAsStream(resource);
        	sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream, pro);
        	SqlSession session = sqlSessionFactory.openSession(false);
        }	catch(IOException e) {
        	e.printStackTrace();
        }
//        HashMap<String, String> input = new HashMap<String, String>();
//        input.put("code", "AIA");
//        List<HashMap<String, String>> outputs = session.selectList("SqlSampleMapper.selectSample", input);
//        System.out.println(outputs.get(0));
//        session.commit();
//        session.close();
	}
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
