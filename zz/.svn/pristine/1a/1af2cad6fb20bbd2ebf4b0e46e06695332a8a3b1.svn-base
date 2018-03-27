package com.bizdata.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import com.bizdata.framework.shiro.UserRealm;
import com.bizdata.framework.shiro.config.ShiroConfigProperties;
import com.bizdata.framework.shiro.config.ShiroRedisProperties;
import com.bizdata.framework.shiro.redis.RedisCacheSessionDao;
import com.bizdata.framework.shiro.retry.RetryLimitHashedCredentialsMatcher;
import org.apache.commons.lang.time.DateUtils;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.session.mgt.eis.JavaUuidSessionIdGenerator;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authz.SslFilter;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.config.MethodInvokingFactoryBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import redis.clients.jedis.JedisPoolConfig;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * shiro权限框架配置
 *
 * @author sdevil507
 * @version 1.0
 */
@Configuration
public class ShiroConfiguration {

    // ======================================shiro参数配置======================================
    @Bean(name = "shiroConfigProperties")
    public ShiroConfigProperties shiroConfigProperties() {
        return new ShiroConfigProperties();
    }

    // ======================================基础配置======================================

    /**
     * Shiro生命周期处理器</br>
     * 该处理器使得更容易在spring中配置shiro bean,因为用户不需要担心是否制定bean的初始化和销毁方法。
     *
     * @return LifecycleBeanPostProcessor
     */
    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     * 调用SecurityUtils.setSecurityManager(securityManager)，
     * 为SecurityUtils设置安全管理器,
     * SecurityUtils是一个抽象的工具类，提供了SecurityManager实例的保存和获取的方法，以及创建Subject的方法。
     *
     * @return MethodInvokingFactoryBean
     */
    @Bean
    public MethodInvokingFactoryBean getMethodInvokingFactoryBean() {
        MethodInvokingFactoryBean methodInvokingFactoryBean = new MethodInvokingFactoryBean();
        methodInvokingFactoryBean.setStaticMethod("org.apache.shiro.SecurityUtils.setSecurityManager");
        methodInvokingFactoryBean.setArguments(new Object[]{getDefaultWebSecurityManager()});
        return methodInvokingFactoryBean;
    }

    /**
     * shiro安全管理器,所有与安全相关操作都与其交互，管理所有的组件
     *
     * @return DefaultWebSecurityManager
     */
    @Bean(name = "securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager() {
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        // 设置域
        defaultWebSecurityManager.setRealm(getUserRealm());
        // 设置session管理器
        defaultWebSecurityManager.setSessionManager(getDefaultWebSessionManager());
        // 设置cache管理器
        defaultWebSecurityManager.setCacheManager(getEhCacheManager());
        // 设置RememberMe管理器
        defaultWebSecurityManager.setRememberMeManager(getCookieRememberMeManager());
        return defaultWebSecurityManager;
    }

    // ======================================域配置======================================

    /**
     * 域，Shiro从Realm获取安全数据（如用户、角色、权限）<br>
     * SecurityManager要验证用户身份，那么它需要从Realm获取相应的用户进行比较以确定用户身份是否合法；<br>
     * 也需要从Realm得到用户相应的角色/权限进行验证用户是否能进行操作；
     *
     * @return UserRealm
     */
    @Bean(name = "userRealm")
    public UserRealm getUserRealm() {
        UserRealm userRealm = new UserRealm();
        // 注入凭证匹配器
        userRealm.setCredentialsMatcher(getRetryLimitHashedCredentialsMatcher());
        // 启用缓存，默认false
        userRealm.setCachingEnabled(false);
        return userRealm;
    }

    /**
     * 拓展凭证匹配器,继承自HashedCredentialsMatcher<br>
     * HashedCredentialsMatcher会根据配置自动识别盐值,加入登录错误次数限制
     *
     * @return RetryLimitHashedCredentialsMatcher
     */
    @Bean(name = "credentialsMatcher")
    public RetryLimitHashedCredentialsMatcher getRetryLimitHashedCredentialsMatcher() {
        RetryLimitHashedCredentialsMatcher retryLimitHashedCredentialsMatcher = new RetryLimitHashedCredentialsMatcher();
        retryLimitHashedCredentialsMatcher.setHashAlgorithmName("md5");
        retryLimitHashedCredentialsMatcher.setHashIterations(1);
        retryLimitHashedCredentialsMatcher.setStoredCredentialsHexEncoded(true);
        return retryLimitHashedCredentialsMatcher;
    }

    // ======================================会话配置======================================

    /**
     * session会话管理器<br>
     * 用于Web环境的实现，替代ServletContainerSessionManager，自己维护着会话，直接废弃了Servlet容器的会话管理。
     *
     * @return DefaultWebSessionManager
     */
    @Bean(name = "sessionManager")
    public DefaultWebSessionManager getDefaultWebSessionManager() {
        DefaultWebSessionManager defaultWebSessionManager = new DefaultWebSessionManager();
        // 设置全局过期时间
        defaultWebSessionManager.setGlobalSessionTimeout(shiroConfigProperties().getSession().getTimeOut() * DateUtils.MILLIS_PER_MINUTE);
        // 会话过期删除会话
        defaultWebSessionManager.setDeleteInvalidSessions(true);
        // 定时检查失效的session
        defaultWebSessionManager.setSessionValidationSchedulerEnabled(true);
        // 设置sessionDao(可以选择具体session存储方式)
        defaultWebSessionManager.setSessionDAO(getSessionDao());
        // 是否启用/禁用Session Id Cookie，默认是启用的；
        // 如果禁用后将不会设置Session Id
        // Cookie,即默认使用了Servlet容器的JSESSIONID,且通过URL重写(URL中的“;JSESSIONID=id”部分)保存SessionId
        defaultWebSessionManager.setSessionIdCookieEnabled(true);
        // 设置cookie相关配置
        defaultWebSessionManager.setSessionIdCookie(getSessionIdSimpleCookie());
        return defaultWebSessionManager;
    }

    // ======================================redis参数配置======================================
    @Bean(name = "shiroRedisProperties")
    @ConditionalOnProperty(prefix = "shiro", name = "cluster", matchIfMissing = true)
    public ShiroRedisProperties shiroRedisProperties() {
        return new ShiroRedisProperties();
    }

    @Bean(name = "jedisPoolConfig")
    @ConditionalOnProperty(prefix = "shiro", name = "cluster", matchIfMissing = true)
    public JedisPoolConfig getJedisPoolConfig() {
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(shiroRedisProperties().getPool().getMaxActive());
        jedisPoolConfig.setMaxIdle(shiroRedisProperties().getPool().getMaxIdle());
        jedisPoolConfig.setMaxWaitMillis(shiroRedisProperties().getPool().getMaxWait());
        jedisPoolConfig.setMinIdle(shiroRedisProperties().getPool().getMinIdle());
        return jedisPoolConfig;
    }

    @Bean(name = "jedisConnectionFactory")
    @ConditionalOnProperty(prefix = "shiro", name = "cluster", matchIfMissing = true)
    public JedisConnectionFactory getJedisConnectionFactory() {
        JedisConnectionFactory jedisConnectionFactory = new JedisConnectionFactory();
        jedisConnectionFactory.setDatabase(shiroRedisProperties().getDatabase());
        jedisConnectionFactory.setHostName(shiroRedisProperties().getHost());
        jedisConnectionFactory.setPort(shiroRedisProperties().getPort());
        jedisConnectionFactory.setPassword(shiroRedisProperties().getPassword());
        jedisConnectionFactory.setTimeout(shiroRedisProperties().getTimeout());
        jedisConnectionFactory.setPoolConfig(getJedisPoolConfig());
        return jedisConnectionFactory;
    }

    /**
     * 用于集群环境下密码错误重试次数RedisTemplate
     *
     * @return RedisTemplate
     */
    @Bean(name = "redisTemplateForPwdRetry")
    @ConditionalOnProperty(prefix = "shiro", name = "cluster", matchIfMissing = true)
    public RedisTemplate<String, Integer> getRedisTemplateForPwdRetry() {
        RedisTemplate<String, Integer> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(getJedisConnectionFactory());
        RedisSerializer stringSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(stringSerializer);
        redisTemplate.setHashKeySerializer(stringSerializer);
        return redisTemplate;
    }

    /**
     * 用于集群环境下SessionDao的RedisTemplate
     *
     * @return RedisTemplate
     */
    @Bean(name = "redisTemplateForSessionDao")
    @ConditionalOnProperty(prefix = "shiro", name = "cluster", matchIfMissing = true)
    public RedisTemplate<String, Session> getRedisTemplateForSessionDao() {
        RedisTemplate<String, Session> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(getJedisConnectionFactory());
        RedisSerializer stringSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(stringSerializer);
        redisTemplate.setHashKeySerializer(stringSerializer);
        return redisTemplate;
    }

    /**
     * 提供sessionDao实现
     *
     * @return
     */
    @Bean(name = "sessionDAO")
    public AbstractSessionDAO getSessionDao() {
        AbstractSessionDAO sessionDAO;
        if (shiroConfigProperties().isCluster()) {
            //如果是集群环境
            sessionDAO = new RedisCacheSessionDao(shiroConfigProperties().getSession().getTimeOut());
            ((RedisCacheSessionDao) sessionDAO).setRedisTemplate(getRedisTemplateForSessionDao());
        } else {
            //如果单机环境
            sessionDAO = new EnterpriseCacheSessionDAO();
        }
        sessionDAO.setSessionIdGenerator(getJavaUuidSessionIdGenerator());
        return sessionDAO;
    }

    /**
     * 配置cookie设置
     *
     * @return
     */
    @Bean(name = "sessionIdCookie")
    public SimpleCookie getSessionIdSimpleCookie() {
        SimpleCookie simpleCookie = new SimpleCookie("session_id");
        // 如果设置为true，则客户端不会暴露给客户端脚本代码，使用HttpOnly
        // cookie有助于减少某些类型的跨站点脚本攻击；此特性需要实现了Servlet 2.5 MR6及以上版本的规范的Servlet容器支持；
        simpleCookie.setHttpOnly(true);
        // 设置Cookie的过期时间，秒为单位，默认-1表示关闭浏览器时过期Cookie；
        simpleCookie.setMaxAge(shiroConfigProperties().getCookie().getMaxAge() * 60);
        return simpleCookie;
    }

    /**
     * 会话ID生成器
     *
     * @return JavaUuidSessionIdGenerator
     */
    @Bean(name = "sessionIdGenerator")
    public JavaUuidSessionIdGenerator getJavaUuidSessionIdGenerator() {
        return new JavaUuidSessionIdGenerator();
    }

    // ======================================rememberMe配置======================================

    /**
     * rememberMe管理器
     *
     * @return CookieRememberMeManager
     */
    @Bean(name = "rememberMeManager")
    public CookieRememberMeManager getCookieRememberMeManager() {
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        cookieRememberMeManager.setCipherKey(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));
        cookieRememberMeManager.setCookie(getRememberMeSimpleCookie());
        return cookieRememberMeManager;
    }

    /**
     * rememberMe cookie设置
     *
     * @return SimpleCookie
     */
    @Bean(name = "rememberMeCookie")
    public SimpleCookie getRememberMeSimpleCookie() {
        SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
        simpleCookie.setHttpOnly(true);
        // 设置记住我cookie时间，单位为分钟
        // 30(日)*24(时)*60(分)=43200
        simpleCookie.setMaxAge(shiroConfigProperties().getCookie().getRememberMeMaxAge() * 60);
        return simpleCookie;
    }

    // ======================================cache配置======================================

    @Bean(name = "shiroEhcacheManager")
    public EhCacheManager getEhCacheManager() {
        EhCacheManager ehCacheManager = new EhCacheManager();
        ehCacheManager.setCacheManagerConfigFile("classpath:ehcache/ehcache-shiro.xml");
        return ehCacheManager;
    }

    // ======================================filter配置======================================

    /**
     * shiro过滤器,用于拦截配置中的请求并进行链式处理
     *
     * @return ShiroFilterFactoryBean
     */
    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean getShiroFilterFactoryBean() {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(getDefaultWebSecurityManager());
        shiroFilterFactoryBean.setLoginUrl("/admin/login");
        Map<String, Filter> filters = new HashMap<>();
        filters.put("ssl", getSslFilter());
        shiroFilterFactoryBean.setFilters(filters);
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/admin/logout", "anon");
        filterChainDefinitionMap.put("/admin/ajaxLogin", "anon");
        filterChainDefinitionMap.put("/admin/**", "user");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    /**
     * ssl filter设置
     *
     * @return SslFilter
     */
    @Bean(name = "sslFilter")
    public SslFilter getSslFilter() {
        SslFilter sslFilter = new SslFilter();
        sslFilter.setPort(8443);
        return sslFilter;
    }

    // ======================================shiro拓展支持======================================

    /**
     * 开启spring自动代理,支持shiro权限注解使用
     *
     * @return DefaultAdvisorAutoProxyCreator
     */
    @Bean
    @DependsOn("lifecycleBeanPostProcessor")
    public DefaultAdvisorAutoProxyCreator getDefaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator creator = new DefaultAdvisorAutoProxyCreator();
        creator.setProxyTargetClass(true);
        return creator;
    }

    /**
     * 提供shiro权限注解支持
     *
     * @return AuthorizationAttributeSourceAdvisor
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor getAuthorizationAttributeSourceAdvisor() {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(getDefaultWebSecurityManager());
        return advisor;
    }

    /**
     * 提供thymeleaf shiro标签支持
     *
     * @return ShiroDialect
     */
    @Bean(name = "shiroDialect")
    public ShiroDialect shiroDialect() {
        return new ShiroDialect();
    }

}
