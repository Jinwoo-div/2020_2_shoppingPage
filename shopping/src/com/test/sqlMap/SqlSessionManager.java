package com.test.sqlMap;
import java.io.IOException;
import java.io.Reader;
import java.io.File;
import java.io.FileReader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//myBatis 설정 파일을 읽어 DB 커넥션을 맺은뒤 커넥션 맺은 session을 반환
public class SqlSessionManager {
	public static SqlSessionFactory sqlSession;
	static {
        String resource = "Config.xml";
        Reader reader;
        try {
        	reader = Resources.getResourceAsReader(resource);
        	sqlSession = new SqlSessionFactoryBuilder().build(reader);
        	} 
        catch (IOException e) {
        		e.printStackTrace();
        		}
        }
    public static SqlSessionFactory getSqlSession() {
    	return sqlSession;
    	}
    }