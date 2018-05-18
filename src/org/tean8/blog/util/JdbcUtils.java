package org.tean8.blog.util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;
import tk.mybatis.mapper.entity.Config;
import tk.mybatis.mapper.mapperhelper.MapperHelper;


public class JdbcUtils {
	/**
	 * 获得工厂
	 */
	private static SqlSessionFactory factory;
	static{
		try {
			//1 加载配置文件
			InputStream is = Resources.getResourceAsStream("SqlMapConfig.xml");
			//2 创建工厂
			factory = new SqlSessionFactoryBuilder().build(is);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<SqlSession>();
	/**
	 * 共享session
	 * @return
	 */
	private static SqlSession getSession(){
		//1 获得
		SqlSession session = threadLocal.get();
		//2 没有，创建，并添加
		if(session == null){
			session = factory.openSession();

/*

			*/
/**通用mapper start**//*

			//创建一个MapperHelper
			MapperHelper mapperHelper = new MapperHelper();
			//特殊配置
			Config config = new Config();
			// 设置UUID生成策略
			// 配置UUID生成策略需要使用OGNL表达式
			// 默认值32位长度:@java.util.UUID@randomUUID().toString().replace("-", "")
			//config.setUUID("");
			// 主键自增回写方法,默认值MYSQL,详细说明请看文档
//	        config.setIDENTITY("HSQLDB");
			// 支持方法上的注解
			// 3.3.1版本增加
			config.setEnableMethodAnnotation(true);
			config.setNotEmpty(true);
			// 序列的获取规则,使用{num}格式化参数，默认值为{0}.nextval，针对Oracle
			// 可选参数一共3个，对应0,1,2,分别为SequenceName，ColumnName, PropertyName
			//config.setSeqFormat("NEXT VALUE FOR {0}");
			// 设置全局的catalog,默认为空，如果设置了值，操作表时的sql会是catalog.tablename
			//config.setCatalog("");
			// 设置全局的schema,默认为空，如果设置了值，操作表时的sql会是schema.tablename
			// 如果同时设置了catalog,优先使用catalog.tablename
			//config.setSchema("");
			// 主键自增回写方法执行顺序,默认AFTER,可选值为(BEFORE|AFTER)
			//config.setOrder("AFTER");
			//设置配置
			mapperHelper.setConfig(config);
			// 注册通用Mapper接口 - 可以自动注册继承的接口
			mapperHelper.registerMapper(Mapper.class);
			mapperHelper.registerMapper(MySqlMapper.class);
//	        mapperHelper.registerMapper(SqlServerMapper.class);
//	        mapperHelper.registerMapper(IdsMapper.class);
			//配置完成后，执行下面的操作
			mapperHelper.processConfiguration(session.getConfiguration());


*/

			/**通用mapper end**/
			
			/**通用mapper end**/
			
			
			threadLocal.set(session);
		}
		//3返回
		return session;
	}

	/**
	 * 获得mapper (dao)
	 * @param clazz
	 * @return
	 */
	public static <T>  T  getMapper(Class<T> clazz){
		return getSession().getMapper(clazz);
	}
	
	/**
	 * 释放资源
	 */
	public static void release(){
		getSession().close();		//session对象存在，session与数据库断开连接
		threadLocal.remove();		////将没有用的session，从ThreadLocal移除
	}
	/**
	 * 提交事务并释放资源
	 */
	public static void commitAndClose(){
		try {
			getSession().commit();
		} catch (Exception e) {
		} finally{
			release();
		}
	}
	/**
	 * 回滚事务并释放资源
	 */
	public static void rollbackAndClose(){
		try {
			getSession().rollback();
		} catch (Exception e) {
		} finally{
			release();
		}
	}
	
	
}
