import org.junit.Test;
import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class TestRedis {
    @Test
    public void testRedis()throws Exception{
        //1. 获取连接
        Jedis jedis = new Jedis();
        //2. 操作
        jedis.set("username","admin");
        String userName = jedis.get("username");
        System.out.println("username======>"+userName);
        jedis.setex("activeCode",5,"66666");
        System.out.println("activeCode"+ jedis.get("activeCode"));
        Thread.sleep(6000);
        System.out.println("activeCode"+ jedis.get("activeCode"));
        //3. 关闭连接
        jedis.close();
    }
    @Test
    public void testRedis2()throws Exception{
        //1. 获取连接
        Jedis jedis = new Jedis();
        //2. 操作
        jedis.hset("user","username","admin");
        jedis.hset("user","age","20");
        String userName = jedis.hget("user","username");
        System.out.println("username======>"+userName);
        Map<String,String> userMap = jedis.hgetAll("user");
        System.out.println(userMap);
        //3. 关闭连接
        jedis.close();
    }

    /**
     * 列表类型
     * @throws Exception
     */
    @Test
    public void testRedis3()throws Exception{
        //1. 获取连接
        Jedis jedis = new Jedis();
        //2. 操作
       //jedis.lpush("myList","a","b","c");
       //jedis.rpush("myList","d","e","f");
      //获取
        List<String>myList = jedis.lrange("myList",0,-1);
        System.out.println(myList);
        long p1 = jedis.del("myList");
        System.out.println(p1);
        long p2 = jedis.del("myList");
        System.out.println(p2);
        myList = jedis.lrange("myList",0,-1);
        System.out.println(myList);
        //3. 关闭连接
        jedis.close();
    }
    @Test
    public void testRedis4()throws Exception{
        //1. 获取连接
        Jedis jedis = JedisPoolUtils.getJedis();
        //2. 操作
        jedis.sadd("java","c#","android","php");
        Set<String>set = jedis.smembers("java");
        System.out.println(set);
        //3. 关闭连接
        jedis.close();
    }
    @Test
    public void testRedis5()throws Exception{
        //1. 获取连接
        Jedis jedis = JedisPoolUtils.getJedis();
        //2. 操作
       jedis.zadd("mysortedset",20,"张三");
       jedis.zadd("mysortedset",10,"李四");
       jedis.zadd("mysortedset",30,"王五");
        Set<String>set = jedis.zrange("mysortedset",0,-1);
        System.out.println(set);
        //3. 关闭连接
        jedis.close();
    }


}
